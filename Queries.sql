-- -----------------------------------------------------------
-- Author:          Richard Daly G00246442
-- Description:     SELECT, INSERT, UPDATE and DELETE queries.
-- -----------------------------------------------------------

-- -----------------------------------------------------------
-- SELECT: different variations of select statments
-- -----------------------------------------------------------

-- select all treatments relating to appointment 1001
SELECT * FROM treatment WHERE App_ID = '1001';

-- select managers from staff not including Joe
SELECT * FROM staff WHERE ROLE = 'Vet' AND NAME != 'Joe';

-- select animals that age is 5 or 6
SELECT * FROM animal WHERE Age IN (5, 6);

-- what the average total cost in billing
SELECT AVG(Total_Cost) FROM billing;

-- select payments less than the average payment
SELECT Payment_ID, Payment_Type, Amount_Paid FROM payments WHERE Amount_Paid < (SELECT AVG(Amount_Paid) from payments);

-- How many animals are on record with count.
SELECT COUNT(Animal_ID) FROM animal;

-- what the sum of payments made
SELECT SUM(Amount_Paid) FROM payments;

-- add 2 cloumns that contain NULL values with IFNULL
SELECT Invoice_ID, Treat_Fee + IFNULL(LateCancel_Fee, 0) FROM billing;

-- distinct types of animals being treated
SELECT DISTINCT(Type) FROM animal;

-- what is the most expensive invoice in billing, descending order
SELECT Invoice_ID, Total_Cost FROM billing ORDER BY Total_Cost DESC;

-- what petowner name contains the letter 's'
SELECT NAME FROM petowner WHERE NAME LIKE '%s%';

-- how many petowner lastnames do not start with 'M'
SELECT COUNT(SURNAME) FROM petowner WHERE SURNAME NOT LIKE 'M%';

-- what customer does each invoive belong to (JOIN 3 tables)
SELECT billing.Invoice_ID, appointment.APP_ID, petowner.OWNER_ID 
FROM ((billing INNER JOIN appointment ON billing.App_ID = appointment.APP_ID) 
INNER JOIN petowner ON appointment.OWNER_ID = petowner.OWNER_ID);

-- what animal belongs to which owner and what is their contact details
SELECT Animal_ID, animal.Name, animal.Owner_ID, petowner.Name, petowner.Surname, petowner.Phone 
FROM animal, petowner WHERE animal.Owner_ID = petowner.OWNER_ID;

-- select data from 4 different tables that all reference the other
SELECT Invoice_ID, billing.App_ID, Treatment_ID, Diagnosis, treatment.Med_ID, medication.Name, treatment.Food_ID, food.Name 
FROM billing, treatment, medication, food 
WHERE billing.App_ID = treatment.App_ID AND treatment.Med_ID = medication.Med_ID AND treatment.Food_ID = food.Food_ID;

-- -----------------------------------------------------------
-- INSERT ----------------------------------------------------
-- -----------------------------------------------------------
/*
* Inserting new test data into the DB where all the data is linked together through keys. 
* Owner_ID being the primary in petowner table and the foreign key in animal and appointment.
*/

-- Inserting new owners into the table petowner
INSERT INTO petowner (Owner_ID, Name, Surname, Address_line1, Address_line2, Phone, Email) VALUES 
('X006', 'Richard', 'Sierra', 'Cashel', 'Athenry', '12348752', 'r.sierra@email.com'),
('X007', 'Tim', 'Bates', 'The sound', 'tuam', '13448956', 'timbates@email.com'),
('X008', 'sorcha', 'freenom', 'keel', 'headford', '95612345', 'freenom.s@email.com'),
('X009', 'bill', 'robson', 'briarhill', 'galway', '53545687', 'b.rob@email.com'),
('X010', 'shuna', 'o reilly', 'salthill', 'galway', '12312394', 's.o.reilly@email.com');

-- Inserting animals of the new owners
INSERT INTO animal (Animal_ID, Owner_ID, Name, Type, Breed, Age) VALUES
('P012', 'X006', 'oliver', 'cat', 'persian', '8'),
('P013', 'X007', 'buddy', 'dog', 'golden retriever', '10'),
('P014', 'X008', 'luna', 'cat', 'siamese', '6'),
('P015', 'X009', 'simba', 'dog', 'pomeranian', '7'),
('P016', 'X010', 'charles', 'cat', 'shorthair', '5');

-- Inserting appointments for the new owners with staff members
INSERT INTO appointment (App_ID, Owner_ID, Staff_ID, Date, Time, Booking_Type, Cancelled, Symptoms, Comments) VALUES 
('1006', 'X006', 'S001', '2023-04-17', '09:30', 'phone', NULL, 'Vomiting, diarrhea', NULL),
('1007', 'X007', 'S002', '2023-04-17', '10:30', 'phone', NULL, 'lethargy, decreased appetite', NULL),
('1008', 'X008', 'S003', '2023-04-17', '11:30', 'online', NULL, 'Increased thirst and urination, weight loss', 'Eating normally'),
('1009', 'X009', 'S001', '2023-04-17', '12:30', 'online', NULL, 'confusion, loss of coordination', NULL),
('1010', 'X010', 'S002', '2023-04-17', '14:00', 'phone', NULL, 'discharge or foul odor from the ears, loss of balance', NULL);

-- -----------------------------------------------------------
-- UPDATE: update some of the existing and new test data
-- -----------------------------------------------------------

-- update placeholder in appointments for due date. Identified with primary key.
UPDATE appointment SET Cancelled = 'yes', Comments = 'Submitted' WHERE App_ID = '1011';

-- date was stored incorrectly for a payment, update with correction. identified with primary key.
UPDATE payments SET Date = '2023-04-19' WHERE Payment_ID = '9005';

-- update multiple entries at once where column is equal to
UPDATE treatment SET Diagnosis = 'Yearly Vaccination' WHERE Treatment_ID BETWEEN 'T001' AND 'T004';

-- update all new appointments to cancelled NB: works on inserted data above.
UPDATE appointment SET Cancelled = 'Yes' WHERE App_ID BETWEEN '1006' AND '1010';

-- -----------------------------------------------------------
-- DELETE ----------------------------------------------------
-- -----------------------------------------------------------

-- single delete statements for 3 different tables
DELETE FROM animal WHERE Animal_ID = 'P014';

DELETE FROM appointment WHERE App_ID = '1008';

DELETE FROM petowner WHERE Owner_ID = 'X008';

/*
* Deleting the new test data with a BETWEEN and AND operator. In reverse order of insertion to 
* prevent references between keys preventing the delete. Reversing the order below will throw errors.
*/

DELETE FROM appointment WHERE App_ID BETWEEN '1006' AND '1010';

DELETE FROM animal WHERE Animal_ID BETWEEN 'P012' AND 'P016';

DELETE FROM petowner WHERE Owner_ID BETWEEN 'X006' AND 'X010';