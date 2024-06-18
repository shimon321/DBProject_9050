-- constrain 1
ALTER TABLE Patient
ADD CONSTRAINT CHK_FirstName_Length CHECK (LENGTH(FirstName) >= 2)
ADD CONSTRAINT CHK_LastName_Length CHECK (LENGTH(LastName) >= 2);

-- constrain 2
ALTER TABLE Measurement
MODIFY M_Value INT NOT NULL;

-- constrain 3
ALTER TABLE Research
MODIFY Budget INT DEFAULT 1000 NULL;