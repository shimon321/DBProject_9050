-- querie 1
SELECT M.*
FROM Measurement M
JOIN Patient P ON M.Patient_ID = P.Patient_ID
WHERE P.Patient_ID = &<name= "patient_id" 
                       type = "integer" 
                       hint= "A 9-digit number"
                       required = true>
  AND M.M_Date BETWEEN &<name="measurement_from" 
                         type = "date" hint = "in format DD/MM/YYYY"
                         required = true > 
                          AND &<name="measurement_to" 
                          type = "date" hint = "in format DD/MM/YYYY"
                          required = true>;

-- querie 2
SELECT DISTINCT M.Medicin_Name
FROM Medicines M
JOIN Research_Medicines RM ON M.Medicin_ID = RM.Medicin_ID
JOIN Medicines MM ON RM.Medicin_ID = MM.Medicin_ID
WHERE MM.Manufacturer = &<name = "manufacturer_name" 
                          type ="string"
                          hint = "enter manufacturer full name"
                          required = true>;


-- querie 3
SELECT P.Patient_ID, P.FirstName, P.LastName
FROM Patient P
JOIN Research R ON P.Research_ID = R.Research_ID
JOIN Research_Doctor RD ON R.Research_ID = RD.Research_ID
WHERE RD.Doctor_ID = &<name = "doctor_id" 
                       type = "integer"
                       hint = "enter 9-digit number"
                       required = true>;

-- querie 4

SELECT R.Research_ID, R.Research_Name, P.P_Date, P.Publication_ID
FROM Publication P
JOIN Research R ON P.Research_ID = R.Research_ID
WHERE P.Magazin =&<name = "magazin_name" 
                   list = "SELECT DISTINCT Magazin FROM Publication"
                   type ="string"
                   required = true> ;