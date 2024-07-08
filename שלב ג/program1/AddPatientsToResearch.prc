CREATE OR REPLACE PROCEDURE AddPatientsToResearch (
    p_ResearchID IN INT
)
IS
    v_Patient1ID INT;
    v_Patient2ID INT;
BEGIN
    -- Finding the first patient
    SELECT Patient_ID
    INTO v_Patient1ID
    FROM Patient
    WHERE Research_ID IS NULL
    AND ROWNUM = 1; 
    
    -- If there are no patients available
    IF v_Patient1ID IS not NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'No patients available for the study were found');
    END IF;

    -- Finding the second patient
    SELECT Patient_ID
    INTO v_Patient2ID
    FROM Patient
    WHERE Research_ID IS NULL
    AND Patient_ID != v_Patient1ID
    AND ROWNUM = 1; 
    
    -- If no second patient is found
    IF v_Patient2ID IS not NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Only one available patient was found');
    END IF;

    -- Adding the patients to the study
    UPDATE Patient
    SET Research_ID = p_ResearchID
    WHERE Patient_ID IN (v_Patient1ID, v_Patient2ID);

    -- Success message
    DBMS_OUTPUT.PUT_LINE('Two patients were successfully added to the study:' || p_ResearchID);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'There are no patients to add');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'Error in the process of adding patients: ' || SQLERRM);
END;
/
