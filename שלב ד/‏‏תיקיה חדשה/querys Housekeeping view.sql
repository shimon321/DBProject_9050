-- Queries for Housekeeping_Department_View

-- Query 1: Find rooms that haven't been inspected in the last 30 days
SELECT RID, Room_Type, Occupancy_Status, Cleaning_Status, MAX(Inspection_Date) as Last_Inspection_Date
FROM Housekeeping_Department_View
GROUP BY RID, Room_Type, Occupancy_Status, Cleaning_Status
HAVING MAX(Inspection_Date) < SYSDATE - 30 OR MAX(Inspection_Date) IS NULL
ORDER BY Last_Inspection_Date ASC NULLS FIRST;

-- Query 2: List the top 5 cleaning staff members with the most completed cleaning tasks in the last year
SELECT Staff_ID, Staff_FirstName, Staff_LastName, COUNT(*) as Completed_Tasks
FROM Housekeeping_Department_View
WHERE Cleaning_Task_Status = 'Completed' AND Cleaning_Task_ID IS NOT NULL 
  AND TRUNC(SYSDATE) - TRUNC(Inspection_Date) <= 365
GROUP BY Staff_ID, Staff_FirstName, Staff_LastName
ORDER BY Completed_Tasks DESC
FETCH FIRST 5 ROWS ONLY;