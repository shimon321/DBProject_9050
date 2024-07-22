CREATE VIEW Housekeeping_Department_View AS
SELECT 
    R.RID, 
    R.Type AS Room_Type, 
    R.Occupancy_Status, 
    R.Cleaning_Status,
    CT.TID AS Cleaning_Task_ID, 
    CT.Status AS Cleaning_Task_Status,
    MR.MID AS Maintenance_Request_ID, 
    MR.Issue_Description, 
    MR.Date_Reported AS Maintenance_Date_Reported,
    IL.LID AS Inspection_Log_ID, 
    IL.Inspection_Date, 
    IL.Inspection_Result,
    S.Staff_ID, 
    S.FirstName AS Staff_FirstName, 
    S.LastName AS Staff_LastName,
    SMI.Phone_Number AS Staff_Phone, 
    SMI.Email AS Staff_Email,
    CS.SUID AS Cleaning_Supply_ID, 
    CS.Name AS Cleaning_Supply_Name, 
    CS.Total_Quantity AS Cleaning_Supply_Total_Quantity, 
    CS.Location AS Cleaning_Supply_Location,
    NF.Quantity AS Supply_Quantity_Needed
FROM Room R
LEFT JOIN Cleaning_Task CT ON R.RID = CT.RID
LEFT JOIN Maintenance_Request MR ON R.RID = MR.RID
LEFT JOIN Inspection_Logs IL ON R.RID = IL.RID
LEFT JOIN Staff S ON (CT.Staff_ID = S.Staff_ID OR MR.Staff_ID = S.Staff_ID)
LEFT JOIN Staff_Member_Info SMI ON S.Staff_ID = SMI.Staff_ID
LEFT JOIN Need_for NF ON (CT.TID = NF.TID AND CT.RID = NF.RID AND CT.Staff_ID = NF.Staff_ID)
LEFT JOIN Cleaning_Supply CS ON NF.SUID = CS.SUID
WHERE S.Role = 'Cleaning Staff';