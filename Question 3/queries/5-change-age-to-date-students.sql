-- Add a new `birthdate` column to the `students` table
ALTER TABLE students ADD birthdate DATE;
-- Update the `birthdate` column with the calculated birthdate values
UPDATE students SET birthdate = DATE_ADD(DATE_SUB(CURRENT_DATE(), INTERVAL age YEAR), INTERVAL (1 - DAYOFYEAR(CURRENT_DATE())) DAY);
-- Remove the old `age` column
ALTER TABLE students DROP COLUMN age;