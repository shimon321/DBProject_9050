
[General]
Version=1

[Preferences]
Username=
Password=2748
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=DOCTOR
Count=400

[Record]
Name=DOCTOR_ID
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
Name=SPECIALIZATION
Type=VARCHAR2
Size=20
Data=List('Bone Medicine','Plastic Neurosurgery','Cosmetic Dermatology','Geriatric Medicine','Cultural Oncology')
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

