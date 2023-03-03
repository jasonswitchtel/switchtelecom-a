-- Add new auto-incrementing primary keys to students and teachers tables.
-- A unsigned medium int should suffice, but might need to be altered depending on the size of the school,
-- students table
ALTER TABLE students DROP PRIMARY KEY;
ALTER TABLE students ADD id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
-- teachers table
ALTER TABLE teachers DROP PRIMARY KEY;
ALTER TABLE teachers ADD id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;