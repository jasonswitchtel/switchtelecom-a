-- THIS FILE CONTAINS ALL THE QUERIES FROM FILES 1-7 IN THE /queries/ FOLDER.
-- Executing the queries inside /data/example-data.sql and then the queries from this file will result in /data/final-data.sql

-- 1
-- Add new auto-incrementing primary keys to students and teachers tables.
-- A unsigned medium int should suffice, but might need to be altered depending on the size of the school,
-- students table
ALTER TABLE students DROP PRIMARY KEY;
ALTER TABLE students ADD id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
-- teachers table
ALTER TABLE teachers DROP PRIMARY KEY;
ALTER TABLE teachers ADD id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;


-- 2
-- Create the new `subjects` table
CREATE TABLE subjects(
                         id   TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
                         name VARCHAR(12) NOT NULL,
                         PRIMARY KEY (id)
);
-- Insert the subject names into the new `subjects` table
INSERT INTO subjects (name) VALUES ('Eng'), ('Afr'), ('Math'), ('Sci'), ('Hist'), ('Comp'), ('Geo');
-- Create the pivot table for the `students` table
CREATE TABLE subjects_students(
                                  student_id MEDIUMINT UNSIGNED NOT NULL,
                                  subject_id TINYINT UNSIGNED NOT NULL,
                                  PRIMARY KEY (student_id, subject_id),
                                  FOREIGN KEY (student_id) REFERENCES students (id),
                                  FOREIGN KEY (subject_id) REFERENCES subjects (id)
);

-- Create the pivot table for the `teachers` table
CREATE TABLE subjects_teachers(
                                  teacher_id MEDIUMINT UNSIGNED NOT NULL,
                                  subject_id TINYINT UNSIGNED NOT NULL,
                                  PRIMARY KEY (teacher_id, subject_id),
                                  FOREIGN KEY (teacher_id) REFERENCES teachers (id),
                                  FOREIGN KEY (subject_id) REFERENCES subjects (id)
);


-- Insert the subject data from the `students` table into the `subjects_students` pivot table
INSERT INTO subjects_students (student_id, subject_id)
SELECT s.id, IFNULL(subj.id, (SELECT MAX(id) FROM subjects) + 1) AS subject_id
FROM students s
         LEFT JOIN (
    SELECT id, name FROM subjects WHERE name IN ('Eng', 'Afr', 'Math', 'Sci', 'Hist', 'Comp', 'Geo')
) subj ON FIND_IN_SET(subj.name, REPLACE(s.subjects, '/', ',')) > 0;


ALTER TABLE students DROP COLUMN subjects;


-- Insert the subject data from the `teachers` table into the `subjects_teachers` pivot table
INSERT INTO subjects_teachers (teacher_id, subject_id)
SELECT t.id, IFNULL(subj.id, (SELECT MAX(id) FROM subjects) + 1) AS subject_id
FROM teachers t
         LEFT JOIN (
    SELECT id, name FROM subjects WHERE name IN ('Eng', 'Afr', 'Math', 'Sci', 'Hist', 'Comp', 'Geo')
) subj ON FIND_IN_SET(subj.name, REPLACE(t.subjects, '/', ',')) > 0;

ALTER TABLE teachers DROP COLUMN subjects;

-- 3
-- students table
ALTER TABLE students ADD teacher_id MEDIUMINT UNSIGNED NOT NULL AFTER classTeacher;
UPDATE students s
    INNER JOIN teachers t ON s.classTeacher = t.name
    SET s.teacher_id = t.id;

ALTER TABLE students ADD CONSTRAINT fk_students_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(id);
ALTER TABLE students DROP COLUMN classTeacher;


-- 4
/**
  Adds a firstname, lastname, and middlename column.
  In South Africa I think it might be more common to have a multiple word middle name, such as "van de Merwe", so the first word in the name column will be used for the firstname, the rest will be the surname.
  This would mean that someone would have to go through the names and make corrections for potential middlenames.
 */
-- students table
ALTER TABLE students ADD firstname VARCHAR(32) NOT NULL AFTER id;
ALTER TABLE students ADD middlename VARCHAR(32) DEFAULT NULL AFTER firstname;
ALTER TABLE students ADD lastname VARCHAR(32) NOT NULL AFTER middlename;

UPDATE students
SET
    firstname = SUBSTRING_INDEX(name, ' ', 1),
    middlename = NULL,
    lastname = REPLACE(SUBSTRING_INDEX(name, ' ', -1), CONCAT(SUBSTRING_INDEX(name, ' ', 1), ' '), '');

ALTER TABLE students DROP COLUMN name;

-- teachers table
ALTER TABLE teachers ADD firstname VARCHAR(32) NOT NULL AFTER id;
ALTER TABLE teachers ADD middlename VARCHAR(32) DEFAULT NULL AFTER firstname;
ALTER TABLE teachers ADD lastname VARCHAR(32) NOT NULL AFTER middlename;

UPDATE teachers
SET
    firstname = SUBSTRING_INDEX(name, ' ', 1),
    middlename = NULL,
    lastname = REPLACE(SUBSTRING_INDEX(name, ' ', -1), CONCAT(SUBSTRING_INDEX(name, ' ', 1), ' '), '');

ALTER TABLE teachers DROP COLUMN name;

-- 5
-- Add a new `birthdate` column to the `students` table
ALTER TABLE students ADD birthdate DATE;
-- Update the `birthdate` column with the calculated birthdate values
UPDATE students SET birthdate = DATE_ADD(DATE_SUB(CURRENT_DATE(), INTERVAL age YEAR), INTERVAL (1 - DAYOFYEAR(CURRENT_DATE())) DAY);
-- Remove the old `age` column
ALTER TABLE students DROP COLUMN age;

-- 6
-- Add a new `headOfGradeBool` column to the `teachers` table
ALTER TABLE teachers ADD headOfGradeBool BOOLEAN;

-- Update the `headOfGradeBool` column with the boolean values of the `headOfGrade` column
UPDATE teachers SET headOfGradeBool = (headOfGrade = 'Yes');

-- Remove the old `headOfGrade` column
ALTER TABLE teachers DROP COLUMN headOfGrade;

-- Rename the `headOfGradeBool` column to `headOfGrade`
ALTER TABLE teachers CHANGE COLUMN headOfGradeBool headOfGrade BOOLEAN NOT NULL DEFAULT FALSE;

-- 7
-- Change the `salary` column to an unsigned mediumint
ALTER TABLE teachers MODIFY COLUMN salary MEDIUMINT UNSIGNED;