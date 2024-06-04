CREATE TABLE Research
(
  Research_ID INT NOT NULL,
  Research_Name VARCHAR(30) NOT NULL,
  Budget INT NOT NULL,
  R_Start DATE NOT NULL,
  PRIMARY KEY (Research_ID)
);

CREATE TABLE Medicines
(
  Medicin_ID INT NOT NULL,
  Medicin_Name VARCHAR2(30) NOT NULL,
  Manufacturer VARCHAR2(30) NOT NULL,
  PRIMARY KEY (Medicin_ID)
);

CREATE TABLE Patient
(
  Patient_ID INT NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  Sex VARCHAR2(10) NOT NULL,
  DateOfBirth DATE NOT NULL,
  LastName VARCHAR2(20) NOT NULL,
  Research_ID INT,
  PRIMARY KEY (Patient_ID),
  FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID)
);

CREATE TABLE Measurement
(
  Measurement_ID INT NOT NULL,
  M_Date DATE NOT NULL,
  M_Type VARCHAR2(25) NOT NULL,
  M_Value INT NOT NULL,
  Patient_ID INT NOT NULL,
  PRIMARY KEY (Measurement_ID, Patient_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Doctor
(
  Doctor_ID INT NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  Specialization VARCHAR2(20) NOT NULL,
  LastName VARCHAR2(20) NOT NULL,
  PRIMARY KEY (Doctor_ID)
);

CREATE TABLE Publication
(
  Publication_ID INT NOT NULL,
  P_Date DATE NOT NULL,
  Magazin VARCHAR2(30) NOT NULL,
  Research_ID INT NOT NULL,
  PRIMARY KEY (Publication_ID),
  FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID)
);

CREATE TABLE Research_Medicines
(
  Research_ID INT NOT NULL,
  Medicin_ID INT NOT NULL,
  PRIMARY KEY (Research_ID, Medicin_ID),
  FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID),
  FOREIGN KEY (Medicin_ID) REFERENCES Medicines(Medicin_ID)
);

CREATE TABLE Research_Doctor
(
  Doctor_ID INT NOT NULL,
  Research_ID INT NOT NULL,
  PRIMARY KEY (Doctor_ID, Research_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
  FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID)
);