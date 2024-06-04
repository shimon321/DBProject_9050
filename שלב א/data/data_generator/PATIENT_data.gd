
[General]
Version=1

[Preferences]
Username=
Password=2339
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=PATIENT
Count=380

[Record]
Name=PATIENT_ID
Type=NUMBER
Size=
Data=Random(111111111, 999999999)
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=SEX
Type=VARCHAR2
Size=10
Data=List('male', 'female')
Master=

[Record]
Name=DATEOFBIRTH
Type=DATE
Size=
Data=Random(01/01/1970, 01/05/2010)
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=RESEARCH_ID
Type=NUMBER
Size=
Data=List(select research_id from research)
Master=

