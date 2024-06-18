--Querie 1
SELECT m.Medicin_ID, m.Medicin_Name, COUNT(rm.Research_ID) AS Num_Research
FROM Medicines m
JOIN Research_Medicines rm ON m.Medicin_ID = rm.Medicin_ID
GROUP BY m.Medicin_ID, m.Medicin_Name
HAVING COUNT(rm.Research_ID) > 1;

--Querie 2
SELECT d.FirstName, d.LastName
FROM Doctor d
JOIN (
    SELECT rd.Doctor_ID
    FROM Research_Doctor rd
    JOIN Publication p ON rd.Research_ID = p.Research_ID
    GROUP BY rd.Doctor_ID
    HAVING COUNT(DISTINCT p.Publication_ID) > 1
)  Subquery ON d.Doctor_ID = Subquery.Doctor_ID;

--Querie 3

SELECT p.FirstName, p.LastName, m.M_Type
FROM Patient p
JOIN Measurement m ON p.Patient_ID = m.Patient_ID
JOIN Research r ON p.Research_ID = r.Research_ID
WHERE m.M_Date >= r.R_Start
  AND m.M_Value > (
    SELECT m_before.M_Value
    FROM Measurement m_before
    WHERE m_before.Patient_ID = p.Patient_ID
      AND m_before.M_Type = m.M_Type
      AND m_before.M_Date < r.R_Start
    ORDER BY m_before.M_Date DESC
    FETCH FIRST 1 ROWS ONLY
  );

--Querie 4
SELECT Research_ID, Research_Name
FROM Research
WHERE R_Start < TO_DATE('2020-01-01', 'YYYY-MM-DD')
AND Research_ID NOT IN (
    SELECT DISTINCT Research_ID
    FROM Publication
);

