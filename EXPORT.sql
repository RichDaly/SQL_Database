-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 11:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g00246442`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `Animal_ID` varchar(5) NOT NULL,
  `Owner_ID` varchar(5) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `App_ID` int(5) NOT NULL,
  `Staff_ID` varchar(50) NOT NULL,
  `Owner_ID` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Booking_Type` varchar(50) DEFAULT NULL,
  `Cancelled` varchar(50) DEFAULT NULL,
  `Symptoms` varchar(50) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `Invoice_ID` int(5) NOT NULL,
  `App_ID` int(5) NOT NULL,
  `Owner_ID` varchar(5) NOT NULL,
  `Treat_Fee` decimal(5,2) DEFAULT NULL,
  `LateCancel_Fee` decimal(5,2) DEFAULT NULL,
  `Total_Cost` decimal(5,2) DEFAULT NULL,
  `Paid` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `Food_ID` varchar(4) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Cost` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `Med_ID` int(3) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Cost` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Payment_ID` int(5) NOT NULL,
  `Invoice_ID` int(5) NOT NULL,
  `Date` date DEFAULT NULL,
  `Payment_Type` varchar(50) DEFAULT NULL,
  `Amount_Paid` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Stand-in structure for view `petandowner`
-- (See below for the actual view)
--
CREATE TABLE `petandowner` (
`Owner_ID` varchar(5)
,`Name` varchar(50)
,`Surname` varchar(50)
,`Animal_ID` varchar(5)
,`Type` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `petowner`
--

CREATE TABLE `petowner` (
  `Owner_ID` varchar(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Address_Line1` varchar(50) DEFAULT NULL,
  `Address_Line2` varchar(50) DEFAULT NULL,
  `Phone` int(20) NOT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` varchar(10) NOT NULL,
  `Animal_ID` varchar(50) NOT NULL,
  `App_ID` int(5) NOT NULL,
  `Diagnosis` varchar(50) DEFAULT NULL,
  `Med_ID` int(3) DEFAULT NULL,
  `Food_ID` varchar(4) DEFAULT NULL,
  `FollowUp` varchar(50) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Structure for view `petandowner`
--
DROP TABLE IF EXISTS `petandowner`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `petandowner`  AS SELECT `petowner`.`Owner_ID` AS `Owner_ID`, `petowner`.`Name` AS `Name`, `petowner`.`Surname` AS `Surname`, `animal`.`Animal_ID` AS `Animal_ID`, `animal`.`Type` AS `Type` FROM (`petowner` join `animal`) WHERE `petowner`.`Owner_ID` = `animal`.`Owner_ID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`Animal_ID`),
  ADD UNIQUE KEY `Animal_ID` (`Animal_ID`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`App_ID`),
  ADD UNIQUE KEY `App_ID` (`App_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD UNIQUE KEY `Invoice_ID` (`Invoice_ID`),
  ADD UNIQUE KEY `App_ID` (`App_ID`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Food_ID`),
  ADD UNIQUE KEY `Food_ID` (`Food_ID`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`Med_ID`),
  ADD UNIQUE KEY `Med_ID` (`Med_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Payment_ID` (`Payment_ID`),
  ADD KEY `Invoice_ID` (`Invoice_ID`);

--
-- Indexes for table `petowner`
--
ALTER TABLE `petowner`
  ADD PRIMARY KEY (`Owner_ID`),
  ADD UNIQUE KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD UNIQUE KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`),
  ADD UNIQUE KEY `Treatment_ID` (`Treatment_ID`),
  ADD KEY `Animal_ID` (`Animal_ID`),
  ADD KEY `App_ID` (`App_ID`),
  ADD KEY `Med_ID` (`Med_ID`),
  ADD KEY `Food_ID` (`Food_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `petowner` (`Owner_ID`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Owner_ID`) REFERENCES `petowner` (`Owner_ID`);

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`App_ID`) REFERENCES `appointment` (`App_ID`),
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`Owner_ID`) REFERENCES `petowner` (`Owner_ID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Invoice_ID`) REFERENCES `billing` (`Invoice_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`Animal_ID`),
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`App_ID`) REFERENCES `appointment` (`App_ID`),
  ADD CONSTRAINT `treatment_ibfk_3` FOREIGN KEY (`Med_ID`) REFERENCES `medication` (`Med_ID`),
  ADD CONSTRAINT `treatment_ibfk_4` FOREIGN KEY (`Food_ID`) REFERENCES `food` (`Food_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
