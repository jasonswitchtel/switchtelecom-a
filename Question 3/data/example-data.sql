/*
 Created example tables in phpMyAdmin and exported the structure and data as sql.
 */

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `name` varchar(128) NOT NULL,
  `age` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `classTeacher` varchar(128) NOT NULL,
  `subjects` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `age`, `grade`, `classTeacher`, `subjects`) VALUES
('Johnny Jones', 17, 12, 'Robin Smith', 'Eng/Afr/Math/Sci/Hist/Comp'),
('Susan King', 16, 11, 'John Doe', 'Afr/Eng/Math/Sci/Geo/Hist');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `name` varchar(128) NOT NULL,
  `subjects` varchar(128) NOT NULL,
  `headOfGrade` varchar(32) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`name`, `subjects`, `headOfGrade`, `salary`) VALUES
('John Doe', 'Hist/Math', 'No', 5000),
('Robin Smith', 'Hist', 'Yes', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`name`);
COMMIT;