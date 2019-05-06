-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admitpatient_room`
--

DROP TABLE IF EXISTS `admitpatient_room`;
CREATE TABLE `admitpatient_room` (
  `PatientID` int(10) NOT NULL,
  `Disease` varchar(50) DEFAULT NULL,
  `AdmitDate` date DEFAULT NULL,
  `RoomNo` int(5) NOT NULL,
  `DoctorID` int(10) NOT NULL,
  `AP_Remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `admitpatient_room_ibfk_1` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`),
  CONSTRAINT `admitpatient_room_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ;


--
-- Table structure for table `bill_room`
--

DROP TABLE IF EXISTS `bill_room`;
CREATE TABLE `bill_room` (
  `DischargeID` int(5) DEFAULT NULL,
  `BillingDate` date DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentModeDetails` varchar(100) DEFAULT NULL,
  `TotalCharges` int(10) DEFAULT NULL,
  `NoOfDays` int(5) DEFAULT NULL,
  `TotalRoomCharges` int(10) DEFAULT NULL,
  `BillNo` varchar(15) NOT NULL,
  PRIMARY KEY (`BillNo`)
  );


DROP TABLE IF EXISTS `dischargepatient_room`;
CREATE TABLE `dischargepatient_room` (
  `AdmitID` int(20) DEFAULT NULL,
  `DischargeDate` date DEFAULT NULL,
  `DP_Remarks` varchar(50) DEFAULT NULL
);


DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `DoctorID` int(10) NOT NULL,
  `DoctorName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ContacNo` varchar(11) DEFAULT NULL,
  `Qualifications` varchar(50) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
);
-- Table structure for table `patientregistration`
--

DROP TABLE IF EXISTS `patientregistration`;

CREATE TABLE `patientregistration` (
  `PatientID` int(10) NOT NULL,
  `PatientName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `ContactNo` varchar(11) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Gen` varchar(1) DEFAULT NULL,
  `BG` varchar(3) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ;
--
-- Dumping data for table `patientregistration`
--


DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `name` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `contact_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
  );

-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `RoomNo` int(5) NOT NULL,
  `RoomType` varchar(10) DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `RoomStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RoomNo`)
);

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `ServiceName` varchar(20) DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `ServiceID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ServiceID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patientregistration` (`PatientID`)
);
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-15 23:04:59
