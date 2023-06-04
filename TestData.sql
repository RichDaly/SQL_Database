-- -------------------------------------------------------------------
-- Author:          Richard Daly G00246442
-- Description:     Test Data for the Database.
--                  NB: this data is also included in the export file.
-- -------------------------------------------------------------------

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`Animal_ID`, `Owner_ID`, `Name`, `Type`, `Breed`, `Age`) VALUES
('P001', 'X002', 'Luna', 'Dog', 'Labrador', 3),
('P002', 'X002', 'Max', 'Cat', 'Siamese', 2),
('P003', 'X003', 'Bailey', 'Rabbit', 'Holland Lop', 1),
('P004', 'X005', 'Charlie', 'Bird', 'Parakeet', 4),
('P005', 'X004', 'Daisy', 'Dog', 'Golden Retriever', 5),
('P006', 'X001', 'Cooper', 'Cow', 'Holstein', 4),
('P007', 'X001', 'Rocky', 'Cow', 'Holstein', 4),
('P008', 'X001', 'Bella', 'Cow', 'Holstein', 4),
('P009', 'X001', 'Toby', 'Cow', 'Holstein', 4),
('P010', 'X001', 'Sadie', 'Horse', 'Clydesdale', 6),
('P011', 'X001', 'Zeus', 'Horse', 'Clydesdale', 4);

-- --------------------------------------------------------

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`App_ID`, `Staff_ID`, `Owner_ID`, `Date`, `Time`, `Booking_Type`, `Cancelled`, `Symptoms`, `Comments`) VALUES
(1001, 'S002', 'X001', '2023-04-16', '10:00:00', 'Online', NULL, 'vaccination', 'Callout, Farm Animals'),
(1002, 'S001', 'X002', '2023-04-16', '10:00:00', 'Post', NULL, 'allergies', NULL),
(1003, 'S004', 'X004', '2023-04-16', '10:00:00', 'Phone', 'yes', 'running eyes', NULL),
(1004, 'S003', 'X005', '2023-04-16', '14:00:00', 'Drop In', NULL, 'limp', NULL),
(1005, 'S001', 'X003', '2023-04-16', '14:00:00', 'Online', NULL, 'Not eating', NULL),
(1011, 'S001', 'X001', '2023-05-18', '23:59:00', 'Online', NULL, 'Due Date', NULL);

-- --------------------------------------------------------

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`Invoice_ID`, `App_ID`, `Owner_ID`, `Treat_Fee`, `LateCancel_Fee`, `Total_Cost`, `Paid`) VALUES
(1234, 1001, 'X001', 242.00, NULL, 242.00, 100.00),
(1235, 1002, 'X002', 106.75, NULL, 106.75, 45.00),
(1236, 1003, 'X004', 45.00, 5.00, 50.00, 50.00),
(1237, 1004, 'X005', 75.00, NULL, 75.00, NULL),
(1238, 1005, 'X003', 95.00, NULL, 95.00, 95.00);

-- --------------------------------------------------------

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`Food_ID`, `Name`, `Description`, `Cost`) VALUES
('F001', 'Purina Pro Plan Dog Food', 'Premium dog food with real meat as the first ingre', 40.00),
('F002', 'Royal Canin Cat Food', 'Premium cat food with specialized formulas for spe', 35.00),
('F003', 'Hill\'s Science Diet Puppy Food', 'Puppy food with balanced nutrition for growth and ', 30.00),
('F004', 'Blue Buffalo Adult Cat Food', 'Grain-free cat food with real meat and no artifici', 45.00),
('F005', 'Orijen Senior Dog Food', 'High-protein dog food for senior dogs with limited', 60.00),
('F006', 'Merrick Grain-Free Wet Dog Food', 'Wet dog food with real meat and vegetables for add', 3.00),
('F007', 'Wellness Complete Health Cat Food', 'Complete and balanced cat food with added vitamins', 50.00),
('F008', 'Iams Proactive Health Kitten Food', 'Kitten food with essential nutrients for growth an', 25.00),
('F009', 'Science Diet Urinary Cat Food', 'Cat food with a specialized formula to support uri', 40.00),
('F010', 'Taste of the Wild High Protein Dog Food', 'High-protein dog food with real meat and no artifi', 50.00);

-- --------------------------------------------------------

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`Med_ID`, `Name`, `Description`, `Cost`) VALUES
(1, 'Amoxicillin', 'Antibiotic for bacterial infections', 1.50),
(2, 'Clavamox', 'Antibiotic for bacterial infections', 2.25),
(3, 'Prednisone', 'Anti-inflammatory for allergies and arthritis', 1.75),
(4, 'Tramadol', 'Pain relief for moderate to severe pain', 2.00),
(5, 'Heartgard', 'Heartworm prevention', 5.50),
(6, 'Frontline', 'Flea and tick prevention', 7.25),
(7, 'Metronidazole', 'Antibiotic for protozoal infections and diarrhea', 1.85),
(8, 'Rimadyl', 'Anti-inflammatory and pain relief for arthritis', 3.50),
(9, 'Cephalexin', 'Antibiotic for bacterial infections', 1.25),
(10, 'Enalapril', 'ACE inhibitor for high blood pressure', 2.75),
(11, 'Furosemide', 'Diuretic for fluid retention and heart failure', 2.00),
(12, 'Insulin', 'Regulates blood sugar levels in diabetic pets', 10.50),
(13, 'Phenobarbital', 'Anticonvulsant for seizures in dogs and cats', 4.00),
(14, 'Thyroxine', 'Hormone replacement for hypothyroidism in dogs', 3.25);

-- --------------------------------------------------------

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment_ID`, `Invoice_ID`, `Date`, `Payment_Type`, `Amount_Paid`) VALUES
(9001, 1235, '2023-04-16', 'Debit Card', 45.00),
(9002, 1238, '2023-04-16', 'Check', 95.00),
(9003, 1236, '2023-04-18', 'Debit Card', 50.00),
(9004, 1234, '2023-04-18', 'Cash', 50.00),
(9005, 1234, '2023-05-19', 'Cash', 50.00);

-- --------------------------------------------------------

--
-- Dumping data for table `petowner`
--

INSERT INTO `petowner` (`Owner_ID`, `Name`, `Surname`, `Address_Line1`, `Address_Line2`, `Phone`, `Email`) VALUES
('X001', 'John', 'Smith', '123 Main St', 'Apt 4B', 12341234, 'johnsmith@email.com'),
('X002', 'Sarah', 'Johnson', '456 Elm Ave', 'Unit 10', 12345678, 'sarah.j@email.com'),
('X003', 'Michael', 'Lee', '789 Oak Rd', NULL, 12349876, 'mlee@email.com'),
('X004', 'Jessica', 'Chen', '234 Birch Ln', NULL, 12344321, 'jchen@email.com'),
('X005', 'David', 'Kim', '567 Cedar St', 'Apt 7C', 12348765, 'dkim@email.com');

-- --------------------------------------------------------
--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Name`, `Surname`, `Role`) VALUES
('S001', 'Joe', 'O\' Donnell', 'Vet'),
('S002', 'Ronan', 'Shaw', 'Vet'),
('S003', 'Kieran', 'Doherty', 'Vet'),
('S004', 'Bob', 'Vance', 'Nurse'),
('S005', 'Penny', 'Dillon', 'Nurse'),
('S006', 'Tara', 'O\' Malley', 'Nurse'),
('S007', 'Roisin', 'Doherty', 'Receptionist');

-- --------------------------------------------------------
--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Treatment_ID`, `Animal_ID`, `App_ID`, `Diagnosis`, `Med_ID`, `Food_ID`, `FollowUp`, `Comments`) VALUES
('T001', 'P006', 1001, 'Vaccination', 5, NULL, NULL, NULL),
('T002', 'P007', 1001, 'Vaccination', 5, NULL, NULL, NULL),
('T003', 'P008', 1001, 'Vaccination', 5, NULL, NULL, NULL),
('T004', 'P009', 1001, 'Vaccination', 5, NULL, NULL, NULL),
('T005', 'P001', 1002, 'Allergic Reaction', 3, 'F005', 'yes', 'Keeping Overnight for Observation'),
('T006', 'P004', 1004, 'Broken Leg', 4, NULL, 'yes', NULL),
('T007', 'P003', 1005, 'Diabetic', 12, NULL, 'yes', 'Keeping Overnight for Observation');

-- --------------------------------------------------------
