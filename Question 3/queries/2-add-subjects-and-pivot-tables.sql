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