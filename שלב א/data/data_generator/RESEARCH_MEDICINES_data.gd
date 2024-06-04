
[General]
Version=1

[Preferences]
Username=
Password=2599
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=RESEARCH_MEDICINES
Count=400

[Record]
Name=RESEARCH_ID
Type=NUMBER
Size=
Data=List(select research_id from research)
Master=

[Record]
Name=MEDICIN_ID
Type=NUMBER
Size=
Data=List(select medicin_id from medicines)
Master=

