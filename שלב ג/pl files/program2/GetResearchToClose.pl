CREATE OR REPLACE FUNCTION GetResearchToClose
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT Research_ID, Research_Name
        FROM Research
                -- #Open for more than 5 years and have not published anything in the last two years
        WHERE ( R_Start < ADD_MONTHS(SYSDATE, -60) 
                AND Research_End IS NULL
                AND NOT EXISTS (
                    SELECT 1
                    FROM Publication
                    WHERE Publication.Research_ID = Research.Research_ID
                    AND P_Date > ADD_MONTHS(SYSDATE, -24)                    
                )
                -- #Studies on 3 or more Medicines
               OR 
               (SELECT COUNT(*)
                FROM Research_Medicines
                WHERE Research_Medicines.Research_ID = Research.Research_ID
               ) >= 3
               AND Research_End IS  NULL
               OR --# Studies that were opened more than two years ago and have no patients
               (R_Start < ADD_MONTHS(SYSDATE, -24)
                AND Research_End IS NULL
                AND NOT EXISTS (
                                 SELECT 1
                                 FROM Patient
                                 WHERE Patient.Research_ID = Research.Research_ID
                                )
               )
              );
    RETURN v_cursor;
END;

