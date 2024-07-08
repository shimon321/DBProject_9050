
DECLARE
    v_ResearchID INT;
    v_AreMeasurementsWithinRange BOOLEAN;
   
BEGIN
    --  Research ID for adding patients
    v_ResearchID := 792080;
    
    -- A call to a function that checks whether the tests are within the normal range
    v_AreMeasurementsWithinRange := AreAllMeasurementsWithinRange(v_ResearchID);

    -- Print the results of the range check
    IF v_AreMeasurementsWithinRange THEN
        DBMS_OUTPUT.PUT_LINE('The range of tests is normal for research ' || v_ResearchID);
        
        -- A procedure call that adds two new patients
        AddPatientsToResearch(v_ResearchID);
        
        DBMS_OUTPUT.PUT_LINE('Two patients were successfully added to the Research');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid testing range for research:' || v_ResearchID);
        DBMS_OUTPUT.PUT_LINE('Patients cannot be added to the Research');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main program: ' || SQLERRM);
END;
/
