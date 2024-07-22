-- Queries for Research_Department_View

-- Query 1: Find the top 3 researches with the highest number of patients
SELECT Research_ID, Research_Name, COUNT(DISTINCT Patient_ID) as Patient_Count
FROM Research_Department_View
GROUP BY Research_ID, Research_Name
ORDER BY Patient_Count DESC
FETCH FIRST 3 ROWS ONLY;

-- Query 2: List all doctors involved in researches with a budget over 900000 
-- along with their contact information
SELECT DISTINCT Doctor_ID, Doctor_FirstName, Doctor_LastName, Doctor_Phone, Doctor_Email, Research_Name, Budget
FROM Research_Department_View
WHERE Budget > 900000
ORDER BY Budget DESC;
