CREATE OR REPLACE PROCEDURE CloseResearch(p_ResearchID IN INT)
IS
    v_CurrentDate DATE := SYSDATE; -- current date
BEGIN
    -- Resetting the budget and updating the closing of the Research
    UPDATE Research
    SET Budget = 0,
        Research_End = v_CurrentDate
    WHERE Research_ID = p_ResearchID;

    -- Discharge of all patients assigned to the Research
    UPDATE Patient
    SET Research_ID = NULL
    WHERE Research_ID = p_ResearchID;

    -- Notice of the closure of the Research
    DBMS_OUTPUT.PUT_LINE('Study number ' || p_ResearchID || ' was successfully closed and all patients were discharged');
    COMMIT;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Study number ' || p_ResearchID || ' not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error closing study no ' || p_ResearchID || ': ' || SQLERRM);
END;
/
