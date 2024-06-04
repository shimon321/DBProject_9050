
[General]
Version=1

[Preferences]
Username=
Password=2631
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SHIMON
Name=PUBLICATION
Count=400

[Record]
Name=PUBLICATION_ID
Type=NUMBER
Size=
Data=Random(1000, 9999)
Master=

[Record]
Name=P_DATE
Type=DATE
Size=
Data=Random(01/01/2016, 01/05/2020)
Master=

[Record]
Name=MAGAZIN
Type=VARCHAR2
Size=30
Data=List('New England Journal of Medicine','The Lancet','JAMA','BMJ','Annals of Internal Medicine','Nature Medicine','Cell Metabolism','Pediatrics','American Journal of Psychiatry',
='Journal of Clinical Investigation','Circulation','PLOS Medicine','Journal of Pediatrics','American Journal of Epidemiology',
='Clinical Infectious Diseases','Neurology','Journal of Allergy and Clinical Immunology','Chest','Diabetes Care','JACC','Gut',
='The Journal of Neuroscience','Stroke','Diabetes','Arthritis and Rheumatism','Molecular Psychiatry','Cancer Cell',
='Journal of Neurology','Neurosurgery and Psychiatry','Hypertension','Blood','Gastroenterology',
='Journal of Bone and Mineral Research','American Journal of Gastroenterology','Journal of Clinical Endocrinology and Metabolism',
='Molecular Biology and Evolution','Endocrinology','Critical Care Medicine','Sleep','Journal of the American Society',
='Journal of Investigative Dermatology','Epilepsia','The American Journal of Sports Medicine','Journal of Hepatology',
='The American Journal of Surgical Pathology','The Journal of Physiology','Molecular Cell','Cell Stem Cell','Blood Advances',
='The American Journal of Pathology','Cancer Discovery','The Journal of Immunology','Pain','The Journal of Urology',
='The Journal of Clinical Psychiatry','Fertility and Sterility','Human Reproduction','European Respiratory Journal',
='The Journal of Rheumatology','Journal of the National Cancer Institute','NeuroImage','The Journal of Clinical Hypertension',
='Molecular Cancer Therapeutics','Movement Disorders','The Journal of Clinical Investigation','Journal of Bone and Joint Surgery',
='Neuro-Oncology','The Journal of Molecular Diagnostics','The Journal of Neuroscience Nursing','The Lancet Neurology',
='Nature Reviews Cancer','Journal of Neurosurgery','Nature Reviews Immunology','Neurotherapeutics','The New England Journal of Medicine',
='Journal of Neurology','The Journal of Pain','The Journal of Neuroscience','Nature Reviews Neurology','Trends in Immunology',
='Trends in Neurosciences','Current Opinion in Immunology','Current Opinion in Neurobiology','Current Opinion in Neurology',
='Current Opinion in Rheumatology','Current Opinion in Endocrinology','Diabetes and Obesity','Trends in Molecular Medicine',
='Trends in Genetics','Trends in Pharmacological Sciences','Trends in Cell Biology','Nature Reviews Genetics',
='Nature Reviews Molecular Cell Biology','Nature Reviews Drug Discovery','Cell Reports','Genome Research','Genome Biology',
='EMBO Journal','Trends in Cognitive Sciences','Nature Reviews Neuroscience','Current Biology' ) 
Master=

[Record]
Name=RESEARCH_ID
Type=NUMBER
Size=
Data=List(select research_id from research)
Master=

