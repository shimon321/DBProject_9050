-- delete 1
delete FROM Patient
WHERE dateofbirth < TO_DATE('1973-02-12', 'YYYY-MM-DD');

-- delete 2
delete FROM Publication
WHERE Magazin = 'Current Biology' AND P_Date = TO_DATE('2020-03-14', 'YYYY-MM-DD');