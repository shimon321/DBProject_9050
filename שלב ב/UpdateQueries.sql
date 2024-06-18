-- update 1
UPDATE Research
SET Budget = Budget + 1000
WHERE Research_ID IN (
    SELECT Research_ID
    FROM Publication
    GROUP BY Research_ID
    HAVING COUNT(*) > 1
);

-- update 2
UPDATE MEDICINES
SET MANUFACTURER = 'Eisai Inc.'
where MEDICIN_NAME = 'EZ-OX' ;