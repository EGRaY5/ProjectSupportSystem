-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2018 at 06:59 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `q_id` int(20) NOT NULL,
  `reply` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`q_id`, `reply`) VALUES
(1, 'Total Cost except for tuition fees for BIT degree is Rs.62,900/='),
(2, '1st Year completion gives you a Diploma in IT, 2nd Year completion gives you a Higher Diploma in IT and 3rd year completion gives you a bachelor of IT degree from UCSC.'),
(3, '15th December 2018'),
(4, 'It is a part-time degree'),
(5, 'Esoft and Matrix does BIT lectures'),
(6, 'Yes BIT students are provided with a VLE (Virtual Learning Environment)'),
(7, '3 years');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `registrationNo` varchar(40) DEFAULT NULL,
  `addressLine1` varchar(45) DEFAULT NULL,
  `addressLine2` varchar(45) DEFAULT NULL,
  `addressLine3` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephoneNo` varchar(12) DEFAULT NULL,
  `formName` varchar(45) DEFAULT NULL,
  `Student_idStudent` int(11) NOT NULL,
  `supervisorApproval` varchar(45) DEFAULT 'Pending',
  `supervisorComment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idClient`, `name`, `registrationNo`, `addressLine1`, `addressLine2`, `addressLine3`, `email`, `telephoneNo`, `formName`, `Student_idStudent`, `supervisorApproval`, `supervisorComment`) VALUES
(1, 'Crypt Labs', 'reg3233', 'no 123', 'Divulapitiya', 'Gampaha', 'crypys@gmail.com', '0775416134', '15000753_clientAgreement.pdf', 15000753, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examinar`
--

CREATE TABLE `examinar` (
  `idExaminer` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `RoleInExamine` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `examiner`
--

CREATE TABLE `examiner` (
  `idExaminer` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `RoleInExamine` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `finaldissertation`
--

CREATE TABLE `finaldissertation` (
  `idFinalDissertation` int(11) NOT NULL,
  `formName` varchar(50) DEFAULT NULL,
  `supervisorComment` varchar(100) DEFAULT NULL,
  `Student_idStudent` int(11) NOT NULL,
  `supervisorApproval` varchar(45) DEFAULT 'Pending',
  `introduction` float DEFAULT NULL,
  `analysis` float DEFAULT NULL,
  `design` float DEFAULT NULL,
  `implementation` float DEFAULT NULL,
  `evaluation` float DEFAULT NULL,
  `conclustion` float DEFAULT NULL,
  `refer` float DEFAULT NULL,
  `appendices` float DEFAULT NULL,
  `general` float DEFAULT NULL,
  `totalmark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `finaldissertation`
--

INSERT INTO `finaldissertation` (`idFinalDissertation`, `formName`, `supervisorComment`, `Student_idStudent`, `supervisorApproval`, `introduction`, `analysis`, `design`, `implementation`, `evaluation`, `conclustion`, `refer`, `appendices`, `general`, `totalmark`) VALUES
(3, '15000753_dissertation.pdf', NULL, 15000753, 'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `finaldissertation_has_examiner`
--

CREATE TABLE `finaldissertation_has_examiner` (
  `FinalDissertation_idFinalDissertation` int(11) NOT NULL,
  `Examiner_idExaminer` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `type(major/minor)` varchar(45) DEFAULT NULL,
  `marks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- --------------------------------------------------------

--
-- Table structure for table `formsumissions`
--

CREATE TABLE `formsumissions` (
  `idformSumissions` int(11) NOT NULL,
  `formType` varchar(45) DEFAULT NULL,
  `endDate` varchar(45) DEFAULT NULL,
  `endTime` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formsumissions`
--

INSERT INTO `formsumissions` (`idformSumissions`, `formType`, `endDate`, `endTime`) VALUES
(9, 'Dissertation', '2019-10-23', '16:33'),
(10, 'Project Proposal', '2018-11-13', '04:33'),
(20, 'Client Details', '2017-12-29', '11:11'),
(21, 'Interim Report', '2017-12-29', '14:02');

-- --------------------------------------------------------

--
-- Table structure for table `interimreport`
--

CREATE TABLE `interimreport` (
  `idInterim Report` int(11) NOT NULL,
  `formName` varchar(45) DEFAULT NULL,
  `totalmarks` float DEFAULT NULL,
  `Student_idStudent` int(11) NOT NULL,
  `titleM` float DEFAULT NULL,
  `abstractM` float DEFAULT NULL,
  `introductionM` float DEFAULT NULL,
  `analysisM` float DEFAULT NULL,
  `solutionM` float DEFAULT NULL,
  `supervisorApproval` varchar(45) DEFAULT 'Pending',
  `supervisorComment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interimreport`
--

INSERT INTO `interimreport` (`idInterim Report`, `formName`, `totalmarks`, `Student_idStudent`, `titleM`, `abstractM`, `introductionM`, `analysisM`, `solutionM`, `supervisorApproval`, `supervisorComment`) VALUES
(7, '15020020_interim.pdf', 5, 15020020, 1, 1, 1, 1, 1, 'Pending', NULL),
(10, '15000753_interim.pdf', 0.5, 15000753, 0.1, 0.1, 0.1, 0.1, 0.1, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `idMessages` int(11) NOT NULL,
  `header` varchar(100) NOT NULL,
  `detail` varchar(250) NOT NULL,
  `User_userName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`idMessages`, `header`, `detail`, `User_userName`) VALUES
(3, 'this is message', 'viva postponed', 'pro01'),
(4, 'This is message', 'dead line extended', 'pro01'),
(5, 'this is message', 'dates for medical submission', 'pro01'),
(9, 'Special Notice', 'All the applicants are requested to be @UCSC  on 16th December 2017 at 10.00 am', 'pro01'),
(18, 'Deadline Extended', 'Deadlines are extended due to bad whether', 'pro01');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `idPlan` int(11) NOT NULL,
  `startingDate1` varchar(45) DEFAULT NULL,
  `endingDate1` varchar(45) DEFAULT NULL,
  `startingDate2` varchar(45) DEFAULT NULL,
  `endingDate2` varchar(45) DEFAULT NULL,
  `startingDate3` varchar(45) DEFAULT NULL,
  `endingDate3` varchar(45) DEFAULT NULL,
  `startingDate4` varchar(45) DEFAULT NULL,
  `endingDate4` varchar(45) DEFAULT NULL,
  `startingDate5` varchar(45) DEFAULT NULL,
  `endingDate5` varchar(45) DEFAULT NULL,
  `startingDate6` varchar(45) DEFAULT NULL,
  `endingDate6` varchar(45) DEFAULT NULL,
  `startingDate7` varchar(45) DEFAULT NULL,
  `endingDate7` varchar(45) DEFAULT NULL,
  `startingDate8` varchar(45) DEFAULT NULL,
  `endingDate8` varchar(45) DEFAULT NULL,
  `startingDate9` varchar(45) DEFAULT NULL,
  `endingDate9` varchar(45) DEFAULT NULL,
  `startingDate10` varchar(45) DEFAULT NULL,
  `endingDate10` varchar(45) DEFAULT NULL,
  `Student_idStudent` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`idPlan`, `startingDate1`, `endingDate1`, `startingDate2`, `endingDate2`, `startingDate3`, `endingDate3`, `startingDate4`, `endingDate4`, `startingDate5`, `endingDate5`, `startingDate6`, `endingDate6`, `startingDate7`, `endingDate7`, `startingDate8`, `endingDate8`, `startingDate9`, `endingDate9`, `startingDate10`, `endingDate10`, `Student_idStudent`) VALUES
(3, '2017-12-01', '2017-12-06', '2017-12-06', '2017-12-23', '2017-12-24', '2017-12-30', '2017-12-31', '2018-01-07', '2018-01-07', '2018-01-14', '2018-01-15', '2018-01-27', '2018-01-27', '2018-02-10', '2018-02-11', '2018-02-28', '2018-03-01', '2018-03-24', '2018-03-25', '2018-03-31', 15000753);

-- --------------------------------------------------------

--
-- Table structure for table `progressreportdetails`
--

CREATE TABLE `progressreportdetails` (
  `idprogressReportDetails` int(11) NOT NULL,
  `progressNo` int(11) DEFAULT NULL,
  `endDate` varchar(45) DEFAULT NULL,
  `endTime` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `progressreportdetails`
--

INSERT INTO `progressreportdetails` (`idprogressReportDetails`, `progressNo`, `endDate`, `endTime`) VALUES
(24, 4, '2018-04-03', '02:02'),
(27, 6, '2018-02-12', '02:22'),
(28, 7, '2018-02-21', '11:11'),
(29, 8, '2018-02-20', '14:22'),
(30, 9, '2019-02-21', '14:22'),
(32, 10, '2018-01-24', '02:22'),
(34, 5, '2017-12-29', '11:11');

-- --------------------------------------------------------

--
-- Table structure for table `progressreports`
--

CREATE TABLE `progressreports` (
  `idProgressReports` int(11) NOT NULL,
  `reportNo` int(11) DEFAULT NULL,
  `workCarried` varchar(250) DEFAULT NULL,
  `describeTheWork` varchar(250) DEFAULT NULL,
  `problems` varchar(250) DEFAULT NULL,
  `workPlannedButNotDone` varchar(250) DEFAULT NULL,
  `workPlanned` varchar(250) NOT NULL,
  `marks` float DEFAULT NULL,
  `Student_idStudent` int(10) NOT NULL,
  `SupervisorsState` varchar(45) DEFAULT 'Pending',
  `SupervisorRemarks` varchar(200) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `progressreports`
--

INSERT INTO `progressreports` (`idProgressReports`, `reportNo`, `workCarried`, `describeTheWork`, `problems`, `workPlannedButNotDone`, `workPlanned`, `marks`, `Student_idStudent`, `SupervisorsState`, `SupervisorRemarks`) VALUES
(4, 1, 'Feasibility Study', 'dddddddddddddd', 'dddddddddddddddddddddd', 'gggggggggggggggggggggggg', 'Feasibility Study', 0.4, 15000753, 'None', ''),
(5, 2, 'Find a project and meet client', 'sgege', 'sfwfwqfwq', 'wfwqfqwfwq', 'Find a project and meet client', 0.5, 15000753, 'None', ''),
(6, 3, 'Find a project and meet client', 'qwdqwdqd', 'wqdwqdwqdwqd', 'qwdwqdwqdqwdwqdwqd', 'Gather client requirements', 0.5, 15000753, 'None', ''),
(7, 4, 'Gather client requirements', 'acascascas', 'ascascsacasc', 'ascascsacascascasc', 'Define scope', 0.5, 15000753, 'Accepted', 'Good job'),
(8, 5, 'Define users and use cases', 'wdwqdwqd', 'qwdqwdwqd', 'qdqdqdqwdwqd', 'Define users and use cases', 0.5, 15000753, 'Accepted', 'Goes Fine'),
(9, 6, 'Define users and use cases', 'sfffawf', 'afasfasfasf', 'safsafsafsafsaf', 'Requirement Analysis', 0.5, 15000753, 'Rejected', 'Good '),
(10, 7, 'UI-Design', 'e12e21e12e', 'd23d2d2dd', '2d2d2d2erveewv', 'UI-Development', 0.5, 15000753, 'Rejected', NULL),
(11, 8, 'UI-Development', 'ssdvsdvsdv', 'sdvsdvdsv', 'dvsdvdsvdsvsdvds', 'Back-end Development', 0.5, 15000753, 'Accepted', NULL),
(12, 9, 'Back-end Development', 'fewfwefwefwefwef', 'wefwefewfwefwef', 'ewfwefefewfewfwef', 'Back-end Development', 0.5, 15000753, 'Accepted', NULL),
(17, 10, 'Feasibility Study', 'checking the feasibilty', 'no problem', 'everything is up to date', 'UI-Design', 0, 15000753, 'Pending', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `projectproposal`
--

CREATE TABLE `projectproposal` (
  `idProject Proposal` int(11) NOT NULL,
  `projectTitle` varchar(100) NOT NULL,
  `noOfAttempts` int(11) DEFAULT NULL,
  `previousDecision` varchar(45) DEFAULT NULL,
  `earlierProjectTitle` varchar(100) DEFAULT NULL,
  `motivationForTheProject` varchar(250) DEFAULT NULL,
  `objectives` varchar(250) DEFAULT NULL,
  `scope` varchar(250) DEFAULT NULL,
  `functionalities` varchar(250) DEFAULT NULL,
  `deliverables` varchar(250) DEFAULT NULL,
  `resources` varchar(250) DEFAULT NULL,
  `selfEvaluation` varchar(250) DEFAULT NULL,
  `Student_idStudent` int(10) NOT NULL,
  `supervisorApproval` varchar(45) DEFAULT 'Pending',
  `supervisorComment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectproposal`
--

INSERT INTO `projectproposal` (`idProject Proposal`, `projectTitle`, `noOfAttempts`, `previousDecision`, `earlierProjectTitle`, `motivationForTheProject`, `objectives`, `scope`, `functionalities`, `deliverables`, `resources`, `selfEvaluation`, `Student_idStudent`, `supervisorApproval`, `supervisorComment`) VALUES
(3, 'Project evaluation system', 3, 'Fail', 'Bus tracking System', 'i am really motivated', 'speed up the existing process and increasing the efficiency', 'from entering student details to evaluation of dissertation', 'automated marking of progress marking', 'eligible list as a pdf', 'software, language competencies', 'get advises from supervisor', 15000753, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `q_id` int(50) NOT NULL,
  `question` varchar(255) NOT NULL,
  `userName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`q_id`, `question`, `userName`) VALUES
(1, 'What is the total cost for BIT degree except for tuition fees?', '15000753'),
(2, 'What are the 3 stages of BIT degree?', '15020053'),
(3, 'When is the closing date for the next intake?', '12'),
(4, 'Is BIT a full-time degree or a part-time degree?', '12'),
(5, 'Tell me some institutes which conduct BIT lectures?', '15020008'),
(6, 'Does BIT degree provide a VLE?', '12'),
(7, 'What is the duration of the BIT degree?\r\n', '15020053');

-- --------------------------------------------------------

--
-- Table structure for table `removedstudent`
--

CREATE TABLE `removedstudent` (
  `id` int(11) NOT NULL,
  `studentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `idStudent` int(10) NOT NULL,
  `RegNo` varchar(15) NOT NULL,
  `NIC` varchar(15) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Initial` varchar(100) DEFAULT NULL,
  `SurName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `TelephoneNo` varchar(25) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `supervisorID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idStudent`, `RegNo`, `NIC`, `FullName`, `Initial`, `SurName`, `Email`, `TelephoneNo`, `password`, `supervisorID`) VALUES
(11111111, 'R23456', '989949425V', 'Dineth Kariyawasam', 'A B', 'SUBHANI KARUNARATHNA', 'nathashssfa@gmail.com', '775623985', '989949425V', NULL),
(15000123, 'R1500123', '951231237V', 'ATHAPATHTHU LIYANAGELAGE VINEETHA ATHAPATHTHU', 'A L', 'VINEETHA ATHAPATHTHU', 'vineetha@yahoo.com', '0713242230', 'test3', NULL),
(15000752, '15020010', '935625415V', 'KONARA MUDIYASELAGE OMALI KAVEETHA', 'K M', 'OMALI KAVEETHA', 'hytp67@gmail.com', '775623985', '935625415V', NULL),
(15000753, 'R15000753', '951391557V', 'KOROPPU APPUHAMILAGE THARINDU LAKSHAN', 'KA', 'THARINDU LAKSHAN', 'lakshankat@gmail.com', '0717594991', 'test', '28'),
(15000754, '15020008', '958965412V', 'KONARA MUDIYASELAGE RUVINI', 'K M', 'RUVINI', 'ruvini5@gmail.com', '714589326', '958965412V', NULL),
(15020020, '15020020', '954563215V', 'RATHNAYAKA  MUDIYASELAGE RAMESH BANDARA', 'R M', 'RAMESH BANDARA', 'rash987@gmail.com', '775623985', '954563215V', NULL),
(15020032, '15020032', '935214651V', 'GEMI GEDARA  AMALI KAWEETHA', 'G G', 'AMALI KAWEETHA', 'kws45@gmail.com', '775623985', '935214651V', NULL),
(15020065, '15020065', '951234569V', 'GEMI GEDARA  RUWAN GUNASEKARA', 'G G', 'RUWAN GUNASEKARA', 'nathasha@gmail.com', '775623985', '951234569V', NULL),
(15020069, '15020069', '942513658V', 'KONARA MUDIYASELAGE PAWANI NIMSARA', 'K M', 'PAWANI NIMSARA', 'ruwan@gmail.com', '775623985', '942513658V', NULL),
(15020074, '15020074', '941236587V', 'YAMASINGHA DEWALAGE THARUSHI EKANAYAKE', 'Y D', 'THARUSHI EKANAYAKE', 'ght9@gmail.com', '775623985', '941236587V', NULL),
(15020082, '15020082', '935214658V', 'RATHNAYAKA  MUDIYASELAGE JAYAMINI BANDARA', 'R M', 'JAYAMINI BANDARA', 'jhg957@gmail.com', '775623985', '935214658V', NULL),
(15020089, '15020089', '958741236V', 'JAYAKODI GE MAHESH SAMPATH', 'J G', 'MAHESH SAMPATH', 'ssl786@gmail.com', '775623985', '958741236V', NULL),
(15020096, '15020096', '954563218V', 'RATHNAYAKA  MUDIYASELAGE SUBHANI KARUNARATHNA', 'R M', 'SUBHANI KARUNARATHNA', 'hasini@gmail.com', '124587459', '954563218V', NULL),
(22222222, 'R12345', '989949426V', 'Sampath Dharamadasa', 'C D', 'RAMESH BANDARA', 'lwadas45@gmail.com', '775623986', '989949426V', NULL),
(33333333, 'R55694', '989949427V', 'Sumedhe Dissanayake', 'D E', 'PAWANI NIMSARA', 'adadada@gmail.com', '775623987', '989949427V', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `subID` int(10) NOT NULL,
  `Student_idStudent` int(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `supervisorID` varchar(200) DEFAULT NULL,
  `report` varchar(100) DEFAULT NULL,
  `approval` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`subID`, `Student_idStudent`, `name`, `supervisorID`, `report`, `approval`) VALUES
(1, 15000758, 'THARINDU LAKSHAN', 'sup01@gmail.com', 'project proposal', 'not'),
(2, 15000753, 'THARINDU LAKSHAN', 'lakh@gmail.com', 'interim report', 'not');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `idSupervisor` int(11) NOT NULL,
  `FIrstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobileNo` varchar(12) DEFAULT NULL,
  `AddressLine1` varchar(20) DEFAULT NULL,
  `AddressLine2` varchar(25) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `FormPath` varchar(50) DEFAULT NULL,
  `Student_idStudent` int(10) NOT NULL,
  `supervisorApproval` varchar(45) DEFAULT 'Pending',
  `supervisorComment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`idSupervisor`, `FIrstName`, `LastName`, `email`, `mobileNo`, `AddressLine1`, `AddressLine2`, `City`, `FormPath`, `Student_idStudent`, `supervisorApproval`, `supervisorComment`) VALUES
(0, 'Rohana', 'perera', 'rohana@gmail.com', '0714523562', 'No 134', 'Ratnapura road', 'Awissawella', 'Group_12.pdf', 15000753, NULL, NULL),
(28, 'Oshan', 'Wickramarathna', 'sup01@gmail.com', '0313313261', 'No 123', 'Duvulapitiya', 'Gampaha', '15000753_supervisorAgreement.pdf', 15000753, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userName` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `position` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userName`, `password`, `position`) VALUES
('11111111', '989949425V', 'student'),
('12', 'test', 'project'),
('123', 'test', 'project'),
('1234', 'test', 'viva'),
('15000753', 'test', 'student'),
('15001393', 'test', 'project'),
('15001396', 'test', 'supervisor'),
('15020008', 'test', 'student'),
('15020010', '935625415V', 'student'),
('15020020', 'test', 'student'),
('15020032', '935214651V', 'student'),
('15020053', 'test', 'student'),
('15020065', '951234569V', 'student'),
('15020069', '942513658V', 'student'),
('15020074', '941236587V', 'student'),
('15020082', '935214658V', 'student'),
('15020089', '958741236V', 'student'),
('15020096', '954563218V', 'student'),
('1532', 'test', 'project'),
('22222222', '989949426V', 'student'),
('28', 'test', 'supervisor'),
('33333333', '989949427V', 'student'),
('abc@gmail.com', 'ucsc@123', 'supervisor'),
('admin01', 'test', 'admin'),
('lakh@gmail.com', 'ucsc@123', 'supervisor'),
('lakshankat@gmail.com', 'ucsc@123', 'supervisor'),
('pro01', 'test', 'project'),
('pro03', 'test', 'project'),
('sup01@gmail.com', 'test', 'supervisor'),
('supervisor01', 'test', 'supervisor'),
('ttttt@gmail.com', 'ucsc@123', 'supervisor'),
('wcw@wefwe', 'ucsc@123', 'supervisor'),
('wick2@gmail.com', 'wick2@gmail.com', 'supervisor'),
('wick@gmail.com', 'ucsc@123', 'supervisor'),
('wonwick@gmail.com', 'ucsc@123', 'supervisor'),
('xyz@gmail.com', 'ucsc@123', 'supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `viva`
--

CREATE TABLE `viva` (
  `idViva` int(11) NOT NULL,
  `Examiner_idExaminer1` varchar(45) DEFAULT NULL,
  `Examiner_idExaminer2` varchar(45) DEFAULT NULL,
  `CodeCheckerID` varchar(45) DEFAULT NULL,
  `Comments` varchar(45) DEFAULT NULL,
  `CodisOkORnot` varchar(45) DEFAULT NULL,
  `FinalMarks` varchar(45) DEFAULT NULL,
  `Student_idStudent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `viva_has_examiner`
--

CREATE TABLE `viva_has_examiner` (
  `Viva_idViva` int(11) NOT NULL,
  `Examiner_idExaminer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `viva_member`
--

CREATE TABLE `viva_member` (
  `id` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `viva_member`
--

INSERT INTO `viva_member` (`id`, `fname`, `lname`, `email`, `department`, `position`) VALUES
('aaaa', 'saaca', 'sacasc', 'lakshaqqnkat@gmail.com', 'Science', 'senior'),
('viva002', 'Nimal', 'silva', 'n@gmail.com', 'Maths', 'senior');

-- --------------------------------------------------------

--
-- Table structure for table `viva_time`
--

CREATE TABLE `viva_time` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `selection` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`,`Student_idStudent`),
  ADD KEY `fk_Client_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `examinar`
--
ALTER TABLE `examinar`
  ADD PRIMARY KEY (`idExaminer`);

--
-- Indexes for table `examiner`
--
ALTER TABLE `examiner`
  ADD PRIMARY KEY (`idExaminer`);

--
-- Indexes for table `finaldissertation`
--
ALTER TABLE `finaldissertation`
  ADD PRIMARY KEY (`idFinalDissertation`,`Student_idStudent`),
  ADD KEY `fk_FinalDissertation_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `finaldissertation_has_examiner`
--
ALTER TABLE `finaldissertation_has_examiner`
  ADD PRIMARY KEY (`FinalDissertation_idFinalDissertation`,`Examiner_idExaminer`),
  ADD KEY `fk_FinalDissertation_has_Examiner_Examiner1_idx` (`Examiner_idExaminer`),
  ADD KEY `fk_FinalDissertation_has_Examiner_FinalDissertation1_idx` (`FinalDissertation_idFinalDissertation`);

--
-- Indexes for table `formsumissions`
--
ALTER TABLE `formsumissions`
  ADD PRIMARY KEY (`idformSumissions`);

--
-- Indexes for table `interimreport`
--
ALTER TABLE `interimreport`
  ADD PRIMARY KEY (`idInterim Report`,`Student_idStudent`),
  ADD KEY `fk_Interim Report_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idMessages`),
  ADD KEY `fk_Messages_User1_idx` (`User_userName`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`idPlan`,`Student_idStudent`),
  ADD KEY `fk_Plan_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `progressreportdetails`
--
ALTER TABLE `progressreportdetails`
  ADD PRIMARY KEY (`idprogressReportDetails`),
  ADD UNIQUE KEY `progressNo_UNIQUE` (`progressNo`);

--
-- Indexes for table `progressreports`
--
ALTER TABLE `progressreports`
  ADD PRIMARY KEY (`idProgressReports`),
  ADD KEY `fk_ProgressReports_Student1_idx` (`Student_idStudent`),
  ADD KEY `fk_ProgressReports_1_idx` (`reportNo`);

--
-- Indexes for table `projectproposal`
--
ALTER TABLE `projectproposal`
  ADD PRIMARY KEY (`idProject Proposal`),
  ADD KEY `fk_Project Proposal_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `removedstudent`
--
ALTER TABLE `removedstudent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idStudent`),
  ADD UNIQUE KEY `password_UNIQUE` (`password`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`subID`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`idSupervisor`),
  ADD KEY `fk_Supervisor_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `viva`
--
ALTER TABLE `viva`
  ADD PRIMARY KEY (`idViva`,`Student_idStudent`),
  ADD KEY `fk_Viva_Student1_idx` (`Student_idStudent`);

--
-- Indexes for table `viva_has_examiner`
--
ALTER TABLE `viva_has_examiner`
  ADD PRIMARY KEY (`Viva_idViva`,`Examiner_idExaminer`),
  ADD KEY `fk_Viva_has_Examiner_Examiner1_idx` (`Examiner_idExaminer`),
  ADD KEY `fk_Viva_has_Examiner_Viva1_idx` (`Viva_idViva`);

--
-- Indexes for table `viva_member`
--
ALTER TABLE `viva_member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `q_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `finaldissertation`
--
ALTER TABLE `finaldissertation`
  MODIFY `idFinalDissertation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `formsumissions`
--
ALTER TABLE `formsumissions`
  MODIFY `idformSumissions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `interimreport`
--
ALTER TABLE `interimreport`
  MODIFY `idInterim Report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `idMessages` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `idPlan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `progressreportdetails`
--
ALTER TABLE `progressreportdetails`
  MODIFY `idprogressReportDetails` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `progressreports`
--
ALTER TABLE `progressreports`
  MODIFY `idProgressReports` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `projectproposal`
--
ALTER TABLE `projectproposal`
  MODIFY `idProject Proposal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `q_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `removedstudent`
--
ALTER TABLE `removedstudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `subID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `idSupervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `finaldissertation`
--
ALTER TABLE `finaldissertation`
  ADD CONSTRAINT `fk_FinalDissertation_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `finaldissertation_has_examiner`
--
ALTER TABLE `finaldissertation_has_examiner`
  ADD CONSTRAINT `fk_FinalDissertation_has_Examiner_Examiner1` FOREIGN KEY (`Examiner_idExaminer`) REFERENCES `examinar` (`idExaminer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FinalDissertation_has_Examiner_FinalDissertation1` FOREIGN KEY (`FinalDissertation_idFinalDissertation`) REFERENCES `finaldissertation` (`idFinalDissertation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `interimreport`
--
ALTER TABLE `interimreport`
  ADD CONSTRAINT `fk_Interim Report_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_Messages_User1` FOREIGN KEY (`User_userName`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `fk_Plan_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `progressreports`
--
ALTER TABLE `progressreports`
  ADD CONSTRAINT `fk_ProgressReports_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `fk_Supervisor_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `viva`
--
ALTER TABLE `viva`
  ADD CONSTRAINT `fk_Viva_Student1` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `viva_has_examiner`
--
ALTER TABLE `viva_has_examiner`
  ADD CONSTRAINT `fk_Viva_has_Examiner_Examiner1` FOREIGN KEY (`Examiner_idExaminer`) REFERENCES `examinar` (`idExaminer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Viva_has_Examiner_Viva1` FOREIGN KEY (`Viva_idViva`) REFERENCES `viva` (`idViva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
