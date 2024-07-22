CREATE VIEW Research_Department_View AS
SELECT 
    R.Research_ID, 
    R.Research_Name, 
    R.Budget, 
    R.R_Start AS Research_Start_Date,
    P.Patient_ID, 
    P.FirstName AS Patient_FirstName, 
    P.LastName AS Patient_LastName,
    P.Sex AS Patient_Sex, 
    P.DateOfBirth AS Patient_DOB,
    M.Measurement_ID, 
    M.M_Date AS Measurement_Date, 
    M.M_Type AS Measurement_Type, 
    M.M_Value AS Measurement_Value,
    D.Staff_ID AS Doctor_ID, 
    D.FirstName AS Doctor_FirstName, 
    D.LastName AS Doctor_LastName, 
    D.Specialization AS Doctor_Specialization, 
    SMI.Phone_Number AS Doctor_Phone, 
    SMI.Email AS Doctor_Email,
    PUB.Publication_ID, 
    PUB.P_Date AS Publication_Date, 
    PUB.Magazin AS Publication_Magazine,
    RM.Medicin_ID
FROM Research R
LEFT JOIN Patient P ON R.Research_ID = P.Research_ID
LEFT JOIN Measurement M ON P.Patient_ID = M.Patient_ID
LEFT JOIN Research_Staff RS ON R.Research_ID = RS.Research_ID
LEFT JOIN Staff D ON RS.Staff_ID = D.Staff_ID
LEFT JOIN Staff_Member_Info SMI ON D.Staff_ID = SMI.Staff_ID
LEFT JOIN Publication PUB ON R.Research_ID = PUB.Research_ID
LEFT JOIN Research_Medicines RM ON R.Research_ID = RM.Research_ID
WHERE D.Role = 'Doctor';
