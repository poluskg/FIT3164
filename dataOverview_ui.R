#FILENAME: dataOverview_ui.R
#PURPOSE: Removes cluter from ui.R by storing text/text-style in separate file.
#         Adhere to OOP development structure. Keep all relevant code for the
#         Data Overview tab in the same file for simple code navigation.

#********RUN THIS LINE**********
data<- list()
attach(data)

#Calculate the total number of Males/Females using the original dataset
totalMales = sum(data$Sex == "Male")/303*100
totalFemales = sum(data$Sex == "Fmale")/303*100

#Create a list of all 56 variables in data
variablesList = c(
  "Age", "Weight (kg)", "Height (cm)", "Sex", "BMI", "DM", "HTN", 
  "Current Smoker", "Ex Smoker", "FH", "Obesity", "CRF", "CVA", 
  "Airway Disease", "Thyroid Disease", "CHF", "DLP", "Blood Pressure", 
  "PR", "Edema", "Weak Peripheral Pulse", "Lung Rales", "Systolic Murmur", 
  "Diastolic Murmur", "Function.Class", "Atypical", "Nonanginal", 
  "Exertional.CP", "LowTH.Ang", "Q.Wave", "St.Elevation", "St.Depression", 
  "Tinversion", "LVH","Poor.R.Progression", "BBB", "FBS", "CR", "TG", "LDL",
  "HDL", "ESR", "HB", "Potassium (K)", "Sodium (Na)", "WBC", "Lymph", 
  "Neut", "PLT", "EF.TTE", "Region.RWMA", "VHD", "Cath"
)

#Create a list of all 56 variable definitions
definitions = c("Age: The chronological age of the participant in years.",
                "Weight: The weight of the participant in kilograms.",
                "Height: The height of the participant in centimeters", 
                "Sex: The biological sex of participant.", 
                "BMI: The Body Mass Index of the participant. A measurement of weight in regards to height (Kg/m^2), to categorise an individual as underweight, healthy, overweight or obese.",
                "DM: Diabetes Mellitus - whether there is a history of diabetes in the participant's family or not. In the dataset, 0 indicates no history and 1 indicates some family history. ", 
                "HTN: Whether the participant has hypertension or not, which occurs when the individual's blood pressure is too high. In the dataset, 0 indicates no hypertension and 1 indicates hypertension.", 
                "Current Smoker: Whether the participant currently smokes cigarettes or not. In the dataset, 0 indicates that the participant does not currently smoke and 1 indicates that they do.",
                "Ex Smoker: Whether the participant has previously smoked cigarettes or not. In the dataset, 0 indicates that the participant has not previously smoked cigarettes and 1 indicates that they have. ", 
                "FH: Family History - whether the participant has a family history of heart disease in first-degree relatives. In the dataset, 0 indicates no family history and 1 indicates some family history.",
                "Obesity: Determined by the participant's BMI. Greater than 25 is classified as obese.",
                "CRF: Chronic Renal Failure - whether the participant has long-term kidney failure or not. In the dataset, 'N' indicates no CRF and 'Y' indicates CRF.",
                "CVA: Cerebrovascular Accident - whether the participant has had a stroke or not. In the dataset, 'N' indicates no stroke and 'Y' indicates a stroke.", 
                "Airway Disease: Whether the participant has any form of breathing difficulties such as asthma, bronchitis, or COPD. In the dataset, 'N' indicates no airway diseases and 'Y' indicates the presence of an airway disease.", 
                "Thyroid Disease: Whether the participant has any thyroid diseases. This includes hyperthyroidism (where the thyroid produces too many hormones) and hypothyroidism (too few hormones).   In the dataset, 'N' indicates no airway diseases and 'Y' indicates the presence of an airway disease.", 
                "CHF: Congestive Heart Failure - whether the participant has congestive heart failure or not. This occurs when the heart is unable to sufficiently pump blood to the rest of the body leading to a backwards congestion of blood.  In the dataset, 'N' indicates no CHF and 'Y' indicates the presence of CHF.", 
                "DLP: Dyslipidemia - whether the participant has high lipids such as cholesterol in their blood. This increases the risk of arteries becoming clogged. In the dataset, 'N' indicates no DLP and 'Y' indicates the presence of DLP.", 
                "BP: Blood Pressure - the participant's blood pressure, consisting of systolic (the pressure during a heart pump) and diastolic (the pressure in between pumps). A normal healthy reading for adults is between 120/80 mmHg and 90/60 mmHg.", 
                "PR: Pulse Rate - the participant's pulse rate - how many times a pulse is felt in a minute. A normal healthy resting rate for adults is between 60 and 100 ppm.", 
                "Edema: Whether the participant has any areas of swelling on their body or not. This often occurs when blood vessels leak fluid into surrounding tissues. In the dataset, 0 indicates no edema and 1 indicates the presence of edema.",
                "Weak Peripheral Pulse: Whether the patient has a weak pulse in peripheral areas such as hands and legs. In the dataset, 'N' indicated a normal or strong peripheral pulse and 'Y' indicates a weak peripheral pulse.", 
                "Lung Rales: Whether the participant has crackling sounds in the lungs when they inhale. In the dataset, 'N' indicates no lung rales and 'Y' indicates lung rales.",
                "Systolic Murmur: Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) that is caused by a stiffening of the aortic or pulmonary valves or a weakening of the mitral or tricuspid valves. Occur during ventricular contraction. In the dataset, 'N' indicates no systolic murmur and 'Y' indicates a systolic murmur.", 
                "Diastolic Murmur: Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) often caused by a stiffening of the mitral or tricuspid valves or a weakening of the aortic or pulmonary valves. Occur during ventricular relaxation. In the dataset, 'N' indicates no diastolic murmur and 'Y' indicates a diastolic murmur.", 
                "Function Class: A specific class of heart failure the participant is categorized as depending on the progression of their condition. In the dataset, this can be 0 (normal/healthy) or 1,2,3, or 4 depending on the severity of the heart failure.",
                "Atypical: Whether the participant has experienced chest pain that is not attributable to typical causes or reliefs. In the dataset, 'N' indicates no atypical chest pain, and 'Y' indicates atypical chest pain.",
                "Nonanginal CP (chest pain): Whether the participant has experienced a squeezing chest pain but does not have heart disease. In the dataset, 'N' indicates no nonanginal chest pain, and 'Y' indicates nonanginal chest pain.", 
                "Exertional CP (chest pain): Whether the patient has chest pains that are brought on by physical exertion. In the dataset, 'N' indicates no exertional chest pain, and 'Y' indicates exertional chest pain.",
                "LowTH Ang: Low Threshold Angina - whether the participant has early onset angina that is brought on by relatively little exertion. In the dataset, 'N' indicates no low threshold angina, and 'Y' indicates low threshold angina.",
                "Q Wave: Whether an electrocardiogram (ECG) has recorded normal Q waves (less than 0.04 seconds) or abnormal. In the dataset, 0 indicates normal Q waves and 1 indicates abnormal Q waves.",
                "ST Elevation: Whether an electrocardiogram (ECG) has recorded an abnormally high ST segment, a common indicator of a heart attack. In the dataset, 0 indicates no ST elevation and 1 indicates ST elevation. ", 
                "ST Depression: Whether an electrocardiogram (ECG) has recorded an abnormally low ST segment, a common indicator of a heart attack. In the dataset, 0 indicates no ST depression and 1 indicates ST depression. ", 
                "T Inversion: Whether an electrocardiogram (ECG) has recorded an abnormal T wave inversion, which may indicate a heart attack. In the dataset, 0 indicates no T inversion and 1 indicates abnormal T inversion.", 
                "LVH: Left Ventricular Hypertrophy - whether an electrocardiogram (ECG) has recorded that the left chamber of the heart is not pumping effectively. In the dataset, 'N' indicates no LVH and 'Y' indicates LVH.",
                "Poor R Progression: Whether an electrocardiogram (ECG) has recorded R waves of less than or equal to 3mm. This can be a consequence of hypertrophy and indicate a heart attack but is also seen in healthy adults. In the dataset, 'N' indicates normal R wave progression and 'Y' indicates poor R wave progression.",
                "BBB: Bundle Branch Block - whether the participant had a blockage in the heart's electrical branch bundles. This can decrease the heart's efficiency. In the dataset, 'N' indicates no branch block and 'Y' indicates there is a branch blockage.", 
                "FBS: Fasting Blood Sugar - the amount of sugar in the participant's blood when they have been fasting, in mg/dl. A normal fasting blood sugar level is less than 100 mg/dl.",
                "CR: Creatine - the participant's levels of creatine (mg/dl), which is used in energy production in muscles.",
                "TG: Triglyceride - the participant's levels of triglycerides (mg/dl), a type of fat used to store energy.", 
                "LDL: Low Density Lipoprotein - the participant's levels of low density lipoproteins (mg/dl), a type of fat that transports cholesterol from the liver. High LDL increases risk of heart disease.",
                "HDL: High Density Lipoprotein - the participant's levels of high density lipoproteins (mg/dl), a type of fat that transports cholesterol to the liver, which then removes cholesterol.",
                "ESR: Erythrocyte Sedimentation Rate - how quickly the participant's blood cells settle in a test tube (mm/h). A high ESR may indicate inflammation", 
                "HB: Hemoglobin - the participant's levels of hemoglobin (g/dl), a protein in red blood cells which transports oxygen. Low hemoglobin usually indicates anemia.", 
                "K: Potassium - the amount of potassium in the participant's blood (mEq/lit). Abnormally low or high potassium can induce abnormal heart rhythms", 
                "Na: Sodium - the amount of sodium in the participant's blood (mEq/lit). Low sodium can be caused by heart failure.", 
                " WBC: White Blood Cell - the number of white blood cells (leucocytes) in the participant's blood (cells/ml), which are involved in protecting the body against disease.",
                "Lymph: Lymphocytes - the percentage of lymphocytes present in the participant's blood. Lymphocytes are a type of white blood cell involved in the immune response to infection or inflammation.", 
                "Neut: Neutrophils - the percentage of neutrophils present in the participant's blood. Neutrophils are a type of white blood cell involved in the immune response to infection.", 
                "PLT: Platelets - the number of platelets in the participant's blood (1000/ml). Platelets are a type of cell involved in clotting blood.",
                "EF: Ejection Fraction - a measurement of how much blood the heart's left ventricle pumps with each beat. A normal ejection fraction is over 55%, and an EF of under 40% can indicate heart failure.", 
                "Region with RWMA: Regional Wall Motion Abnormality - the areas of the participant's heart which have a regional wall motion abnormality, which may indicate heart failure. In the dataset, this can be 0 (no RWMA), or 1,2,3 or 4 depending on the affected region.", 
                "VHD: Vascular Heart Disease - whether the participant has damage to the aortic, pulmonary, mitral or tricuspid valves. In the dataset, this can be 'N' (no VHD) or the severity of the VHD (mild, moderate or severe)",
                "Cath: Whether the participant has coronary artery disease, where arteries in the heart are narrow or blocked due to the buildup of cholesterol and other fats. In the dataset, this can be 'normal' (no heart disease) or 'Cath' (heart disease). ")

varDefinition = hash(variablesList, definitions)


#FUNCTION: getDefinition
#DESCRIPTION: Returns the corresponding definition for the selected variable. If no definition
#             exists, the function will instead output an error message to the ui.
# @param: Takes in a String value, 'var' which is a user selected input.
getDefinition <- function(var){
  errorMessage = "Sorry, we couldn't find a definition for that."
  if(is.na(varDefinition[[var]]))
    return(errorMessage)
  else return(varDefinition[[var]])
}
# error message is to satisfy robustness

