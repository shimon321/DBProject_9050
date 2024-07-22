
[General]
Version=1

[Preferences]
Username=
Password=2366
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=ROOM_ASSIGNMENT
Count=100

[Record]
Name=ASSIGNMENT_ID
Type=NUMBER
Size=
Data=Random(1000, 9999)
Master=

[Record]
Name=PATIENT_ID
Type=NUMBER
Size=
Data=List(select patient_id from patient)
Master=

[Record]
Name=RID
Type=NUMBER
Size=
Data=List(select rid from room)
Master=

[Record]
Name=ADMISSION_DATE
Type=DATE
Size=
Data=Random(01/01/2020, 01/05/2021)
Master=

[Record]
Name=DISCHARGE_DATE
Type=DATE
Size=
Data=Random(01/01/2022, 01/05/2023)
Master=

