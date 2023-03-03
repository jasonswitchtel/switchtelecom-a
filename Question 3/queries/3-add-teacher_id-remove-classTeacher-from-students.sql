-- students table
ALTER TABLE students ADD teacher_id MEDIUMINT UNSIGNED NOT NULL AFTER classTeacher;
UPDATE students s
    INNER JOIN teachers t ON s.classTeacher = t.name
    SET s.teacher_id = t.id;

ALTER TABLE students ADD CONSTRAINT fk_students_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(id);
ALTER TABLE students DROP COLUMN classTeacher;