totalMales = sum(data$Sex == "Male")/303*100
totalFemales = sum(data$Sex == "Fmale")/303*100

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

definitions = c(
  "The age of the participant in years.", "The weight of the participant in kilograms.", "The height of the participant in centimeters", "The biological sex of participant.", "The Body Mass Index of the participant. A measurement of weight in regards to height (Kg/m^2), to categorise an individual as underweight, healthy, overweight or obese.", "Whether there is a history of diabetes in the participant’s family. ", "Whether the participant has hypertension or not, which occurs when the individual’s blood pressure is too high.", 
  "Whether the participant currently smokes cigarettes or not.", "Whether the participant currently smokes cigarettes or not.", "Whether the participant has a family history of heart disease in first-degree relatives.", "Determined by the participant’s BMI. Greater than 25 indicates obesity.", "Whether the participant has long-term kidney failure or not. ", "Whether the participant has had a stroke or not.", 
  "Whether the participant has any form of breathing difficulties such as asthma, bronchitis, or COPD", "Whether the participant has any thyroid diseases. This includes hyperthyroidism (where the thyroid produces too many hormones) and hypothyroidism (too few hormones).", "Whether the participant has congestive heart failure or not. This occurs when the heart is unable to sufficiently pump blood to the rest of the body leading to a backwards congestion of blood..", "Whether the participant has high lipids such as cholesterol in their blood. This increases the risk of arteries becoming clogged.", "The participant’s blood pressure, consisting of systolic (the pressure during a heart pump) and diastolic (the pressure in between pumps). A normal healthy reading for adults is between 120/80 mmHg and 90/60 mmHg.", 
  "The participant’s pulse rate - how many times a pulse is felt in a minute. A normal healthy resting rate for adults is between 60 and 100 ppm.", "Whether the participant has any areas of swelling on their body or not. This often occurs when blood vessels leak fluid into surrounding tissues.", "Whether the patient has a weak pulse in peripheral areas such as hands and legs. ", "Whether the participant has crackling sounds in the lungs when they inhal", "Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) that is caused by a stiffening of the aortic or pulmonary valves or a weakening of the mitral or tricuspid valves. Occur during ventricular contraction.", 
  "Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) often caused by a stiffening of the mitral or tricuspid valves or a weakening of the aortic or pulmonary valves. Occur during ventricular relaxation.", "A specific class of heart failure the participant is categorized as depending on the progression of their condition.", "Whether the participant has experienced chest pain that is not attributable to typical causes or reliefs. ", "Whether the participant has experienced a squeezing chest pain but does not have heart disease.", 
  "Whether the patient has chest pains that are brought on by physical exertion.", "Whether the participant has early onset angina.", "Whether an electrocardiogram (ECG) has recorded normal Q waves (less than 0.04 seconds) or abnormal.", "Whether an electrocardiogram (ECG) has recorded an abnormally high ST segment, a common indicator of a heart attack. ", "Whether an electrocardiogram (ECG) has recorded an abnormally low ST segment, a common indicator of a heart attack. ", 
  "Whether an electrocardiogram (ECG) has recorded an abnormal T inversion, which may indicate a heart attack.", "Whether an electrocardiogram (ECG) has recorded that the left chamber of the heart is not pumping effectively. ","Whether an electrocardiogram (ECG) has recorded R waves of less than or equal to 3mm. This can be a consequence of hypertrophy and indicate a heart attack but is also seen in healthy adults.", "Whether the participant had a blockage in the heart’s electrical branch bundles. This can decrease the heart’s efficiency.", "The amount of sugar in the participant’s blood when they have been fasting, in mg/dl. A normal fasting blood sugar level is less than 100 mg/dl.", "The participant’s levels of creatine (mg/dl), which is used in energy production in muscles. ", "The participant’s levels of triglycerides (mg/dl), a type of fat used to store energy.", "The participant’s levels of low density lipoproteins (mg/dl), a type of fat that transports cholesterol from the liver. High LDL increases risk of heart disease.",                  "The participant’s levels of high density lipoproteins (mg/dl), a type of fat that transports cholesterol to the liver, which then removes cholesterol.", "How quickly the participant’s blood cells settle in a test tube (mm/h). A high ESR may indicate inflammation", "The participant’s levels of hemoglobin (g/dl), a protein in red blood cells which transports oxygen. Low hemoglobin usually indicates anemia.", "The amount of potassium in the participant’s blood (mEq/lit). Abnormally low or high potassium can induce abnormal heart rhythms", "The amount of sodium in the participant’s blood (mEq/lit). Low sodium can be caused by heart failure.", "The number of white blood cells (leucocytes) in the participant’s blood (cells/ml), which are involved in protecting the body against disease.", "The percentage of lymphocytes present in the participant’s blood. Lymphocytes are a type of white blood cell involved in the immune response to infection or inflammation.", 
  "The percentage of neutrophils present in the participant’s blood. Neutrophils are a type of white blood cell involved in the immune response to infection.", "The number of platelets in the participant’s blood (1000/ml). Platelets are a type of cell involved in clotting blood.", "A measurement of how much blood the heart’s left ventricle pumps with each beat. A normal ejection fraction is over 55%, and an EF of under 40% can indicate heart failure.", "The areas of the participant’s heart which have a regional wall motion abnormality, which may indicate heart failure. ", "Whether the participant has damage to the aortic, pulmonary, mitral or tricuspid valves. Also includes the severity (mild, moderate or severe)", "Whether the participant has coronary artery disease, where arteries in the heart are narrow or blocked due to the buildup of cholesterol and other fats. ")

varDefinition = hash(variablesList, definitions)

getDefinition <- function(var){
  errorMessage = "Sorry, we couldn't find a definition for that."
  if(is.na(varDefinition[[var]]))
    return(errorMessage)
  else return(varDefinition[[var]])
}

getVariableSummary <- function(var){
  varName = variables[var]
  value = eval(parse(text = varName))
  # CHANGE FOR THOSE WITH NO MIN/MAX ELIGIBLE VALUES
  variable_summary = data.frame("Min"=round(min(value), digits=2), "Max"=round(max(value), digits=2), "Mean"=round(mean(value), digits=2), "Median"=round(median(value), digits=2))
  return(variable_summary)
}