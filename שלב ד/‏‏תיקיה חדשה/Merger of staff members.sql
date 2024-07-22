--Step 1: Create the new Staff table
CREATE TABLE Staff (
    Staff_ID INT NOT NULL,
    FirstName VARCHAR2(30) NOT NULL,
    LastName VARCHAR2(30) NOT NULL,
    Role VARCHAR2(20) NOT NULL,
    Specialization VARCHAR2(20),
    PRIMARY KEY (Staff_ID)
);

-- Step 2: Migrate data from Doctor and Staff_Member to Staff
INSERT INTO Staff (Staff_ID, FirstName, LastName, Role, Specialization)
SELECT Doctor_ID, FirstName, LastName, 'Doctor', Specialization
FROM Doctor;

INSERT INTO Staff (Staff_ID, FirstName, LastName, Role)
SELECT SID, First_Name, Last_Name, 'Cleaning Staff' 
FROM Staff_Member;

-- Step 3: Modify Staff_Member_Info table
ALTER TABLE Staff_Member_Info
RENAME COLUMN SID TO Staff_ID;

ALTER TABLE Staff_Member_Info
ADD Email VARCHAR2(50);

-- Step 5: Modify existing tables to reference Staff instead of Doctor or Staff_Member
ALTER TABLE Research_Doctor
RENAME TO Research_Staff;

ALTER TABLE Research_Staff
RENAME COLUMN Doctor_ID TO Staff_ID;

ALTER TABLE Research_Staff
ADD CONSTRAINT FK_Research_Staff_Staff
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

ALTER TABLE Cleaning_Task
RENAME COLUMN SID TO Staff_ID;

ALTER TABLE Cleaning_Task
ADD CONSTRAINT FK_Cleaning_Task_Staff
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

ALTER TABLE Maintenance_Request
RENAME COLUMN SID TO Staff_ID;

ALTER TABLE Maintenance_Request
ADD CONSTRAINT FK_Maintenance_Request_Staff
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

ALTER TABLE Need_for
RENAME COLUMN SID TO Staff_ID;

ALTER TABLE Need_for
ADD CONSTRAINT FK_Need_for_Staff
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

-- Step 6: Drop old tables
DROP TABLE Doctor;
DROP TABLE Staff_Member;