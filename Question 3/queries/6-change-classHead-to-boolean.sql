-- Add a new `headOfGradeBool` column to the `teachers` table
ALTER TABLE teachers ADD headOfGradeBool BOOLEAN;

-- Update the `headOfGradeBool` column with the boolean values of the `headOfGrade` column
UPDATE teachers SET headOfGradeBool = (headOfGrade = 'Yes');

-- Remove the old `headOfGrade` column
ALTER TABLE teachers DROP COLUMN headOfGrade;

-- Rename the `headOfGradeBool` column to `headOfGrade`
ALTER TABLE teachers CHANGE COLUMN headOfGradeBool headOfGrade BOOLEAN NOT NULL DEFAULT FALSE;