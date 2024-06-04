
[General]
Version=1

[Preferences]
Username=
Password=2183
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=MEASUREMENT
Count=400

[Record]
Name=MEASUREMENT_ID
Type=NUMBER
Size=
Data=Random(1000,9999)
Master=

[Record]
Name=M_DATE
Type=DATE
Size=
Data=Random(01/01/2010, 01/05/2020)
Master=

[Record]
Name=M_TYPE
Type=VARCHAR2
Size=25
Data=List('Blood pressure measurement', 'Body temperature measurement', 'Height measurement', 'Weight measurement', 'Pulse rate measurement',
=    'Respiratory rate measurement', 'Oxygen saturation measurement', 'Growth chart measurement', 'Waist circumference measurement', 'Hip circumference measurement',
=    'Gait analysis', 'Visual acuity measurement', 'Hearing test', 'Fingerstick glucose measurement', 'Peak flow measurement',
=    'Skinfold thickness measurement', 'Head circumference measurement', 'Chest circumference measurement', 'Abdominal circumference measurement', 'BMI calculation',
=    'Neck circumference measurement', 'Hand grip strength measurement', 'Range of motion measurement', 'Pulse oximetry', 'Capillary refill time measurement',
=    'Pupil size measurement', 'Edema grading', 'Wound size measurement', 'Joint circumference measurement', 'Tongue depressor test')
Master=

[Record]
Name=M_VALUE
Type=NUMBER
Size=
Data=Random(20, 150)
Master=

[Record]
Name=PATIENT_ID
Type=NUMBER
Size=
Data=List(select patient_id from patient)
Master=

