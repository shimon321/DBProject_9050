
[General]
Version=1

[Preferences]
Username=
Password=2598
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=RESEARCH_DOCTOR
Count=300

[Record]
Name=DOCTOR_ID
Type=NUMBER
Size=
Data=List(select doctor_id from doctor)
Master=

[Record]
Name=RESEARCH_ID
Type=NUMBER
Size=
Data=List(select research_id from research)
Master=

