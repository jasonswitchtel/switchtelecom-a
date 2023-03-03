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