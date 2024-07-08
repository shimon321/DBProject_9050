 begin
  CREATE OR REPLACE FUNCTION AreAllMeasurementsWithinRange (
    p_ResearchID IN INT
) RETURN BOOLEAN
IS
    v_AllWithinRange BOOLEAN := TRUE;
BEGIN
    FOR r IN (SELECT p.Patient_ID
              FROM Patient p
              WHERE p.Research_ID = p_ResearchID)
    LOOP
        -- test for each patient
        FOR m IN (SELECT m.M_Type, m.M_Value
                  FROM Measurement m
                  WHERE m.Patient_ID = r.Patient_ID)
        LOOP
            -- Checking the correctness of the measurements according to the type of test
            CASE m.M_Type
                WHEN 'BMI calculation' THEN
                    IF m.M_Value < 18 OR m.M_Value > 25 THEN
                        v_AllWithinRange := FALSE;
                        EXIT; 
                    END IF;
                WHEN 'Oxygen saturation measure' THEN
                    IF m.M_Value < 95 OR m.M_Value > 100 THEN
                        v_AllWithinRange := FALSE;
                        EXIT; 
                    END IF;
                WHEN 'Pulse oximetry' THEN
                    IF m.M_Value < 95 OR m.M_Value > 100 THEN
                        v_AllWithinRange := FALSE;
                        EXIT; 
                    END IF;
                WHEN 'Respiratory rate measurem' THEN
                    IF m.M_Value < 12 OR m.M_Value > 20 THEN
                        v_AllWithinRange := FALSE;
                        EXIT; 
                    END IF;
                ELSE
                    -- For the rest of the measurements, check that the value is less than 100
                    IF m.M_Value >= 100 THEN
                        v_AllWithinRange := FALSE;
                        EXIT; 
                    END IF;
            END CASE;
        END LOOP;

        -- If there is a test that is out of range, exit the loop
        EXIT WHEN v_AllWithinRange = FALSE;
    END LOOP;

    RETURN v_AllWithinRange;
END;
