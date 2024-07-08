PL/SQL Developer Test script 3.0
44

DECLARE
    v_cursor SYS_REFCURSOR;
    v_Research_ID Research.Research_ID%TYPE;
    v_Research_Name Research.Research_Name%TYPE;
     
    Research_released_budget NUMBER := 0;
    Researches_total_closed NUMBER:= 0 ;
    Research_released_budget_total NUMBER := 0;
BEGIN
  
    -- Receiving the Research intended for closure  and save in CURSOR
    v_cursor := GetResearchToClose();

    -- for any research
    LOOP
        FETCH v_cursor INTO v_Research_ID, v_Research_Name;
        EXIT WHEN v_cursor%NOTFOUND;
        
        Researches_total_closed := Researches_total_closed +1 ;
        
        -- Receiving the released budget
        SELECT Budget INTO Research_released_budget
        FROM Research
        WHERE Research_ID = v_Research_ID;
        
        -- The overall released budget scheme
        Research_released_budget_total := Research_released_budget_total + Research_released_budget;
        
        --Close the Research
        CloseResearch(v_Research_ID);
        
        DBMS_OUTPUT.PUT_LINE('Released budget: ' || Research_released_budget);    
        Research_released_budget := 0;
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('The sum of the closed Researches: ' || Researches_total_closed);
    DBMS_OUTPUT.PUT_LINE('as the total budget amount released: ' || Research_released_budget_total );

    -- CURSOR close
    CLOSE v_cursor;
END;
/
0
0
