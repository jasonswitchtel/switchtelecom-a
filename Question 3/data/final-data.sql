-- Final data after executing sql in example-data.sql and question-3.sql

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
                            `id` mediumint(8) UNSIGNED NOT NULL,
                            `firstname` varchar(32) NOT NULL,
                            `middlename` varchar(32) DEFAULT NULL,
                            `lastname` varchar(32) NOT NULL,
                            `grade` int(11) NOT NULL,
                            `teacher_id` mediumint(8) UNSIGNED NOT NULL,
                            `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `middlename`, `lastname`, `grade`, `teacher_id`, `birthdate`) VALUES
                                                                                                             (1, 'Johnny', NULL, 'Jones', 12, 2, '2006-01-01'),
                                                                                                             (2, 'Susan', NULL, 'King', 11, 1, '2007-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
                            `id` tinyint(3) UNSIGNED NOT NULL,
                            `name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
                                          (1, 'Eng'),
                                          (2, 'Afr'),
                                          (3, 'Math'),
                                          (4, 'Sci'),
                                          (5, 'Hist'),
                                          (6, 'Comp'),
                                          (7, 'Geo');

-- --------------------------------------------------------

--
-- Table structure for table `subjects_students`
--

CREATE TABLE `subjects_students` (
                                     `student_id` mediumint(8) UNSIGNED NOT NULL,
                                     `subject_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects_students`
--

INSERT INTO `subjects_students` (`student_id`, `subject_id`) VALUES
                                                                 (1, 1),
                                                                 (1, 2),
                                                                 (1, 3),
                                                                 (1, 4),
                                                                 (1, 5),
                                                                 (1, 6),
                                                                 (2, 1),
                                                                 (2, 2),
                                                                 (2, 3),
                                                                 (2, 4),
                                                                 (2, 5),
                                                                 (2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `subjects_teachers`
--

CREATE TABLE `subjects_teachers` (
                                     `teacher_id` mediumint(8) UNSIGNED NOT NULL,
                                     `subject_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects_teachers`
--

INSERT INTO `subjects_teachers` (`teacher_id`, `subject_id`) VALUES
                                                                 (1, 3),
                                                                 (1, 5),
                                                                 (2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
                            `id` mediumint(8) UNSIGNED NOT NULL,
                            `firstname` varchar(32) NOT NULL,
                            `middlename` varchar(32) DEFAULT NULL,
                            `lastname` varchar(32) NOT NULL,
                            `salary` mediumint(8) UNSIGNED DEFAULT NULL,
                            `headOfGrade` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `firstname`, `middlename`, `lastname`, `salary`, `headOfGrade`) VALUES
                                                                                                  (1, 'John', NULL, 'Doe', 5000, 0),
                                                                                                  (2, 'Robin', NULL, 'Smith', 10000, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_students_teachers` (`teacher_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects_students`
--
ALTER TABLE `subjects_students`
    ADD PRIMARY KEY (`student_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subjects_teachers`
--
ALTER TABLE `subjects_teachers`
    ADD PRIMARY KEY (`teacher_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
    MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
    MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
    MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
    ADD CONSTRAINT `fk_students_teachers` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `subjects_students`
--
ALTER TABLE `subjects_students`
    ADD CONSTRAINT `subjects_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `subjects_students_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `subjects_teachers`
--
ALTER TABLE `subjects_teachers`
    ADD CONSTRAINT `subjects_teachers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `subjects_teachers_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);
COMMIT;