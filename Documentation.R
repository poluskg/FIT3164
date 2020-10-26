#FILENAME: ui_helper.R
#PURPOSE: To load in all required libraries/files on app configuration.

#Load in all required libraries
require(shiny)
require(shinydashboard)
require(GGally)
require(psych)
require(plotly)
require(hash)
require(stringr)
require(tidyverse)
require(ggplot2)
require(ggpubr)


# VB_style is a function that is used to display the boxes
# @param: msg the sting that will be displayed
# @param: style the font size of the string
# @return: format of the message and style needed by the UI
VB_style <- function(msg = 'Hello', style="font-size: 100%;"){
  tags$p( msg , style = style )
}

# source all the R code needed
# check the files exist to satisfy robustness
file.exists("overview_ui.R")
source("overview_ui.R")

file.exists("dataOverview_ui.R")
source("dataOverview_ui.R")

file.exists("userInputs_ui.R")
source("userInputs_ui.R")

file.exists("modellingProcess_ui.R")
source("modellingProcess_ui.R")

file.exists("predictiveModel_ui.R")
source("predictiveModel_ui.R")

file.exists("references_ui.R")
source("references_ui.R")

#Load in predictive model & processed data
file.exists("z.Rdata")
load(file = "z.Rdata")

file.exists("baggingmodel.rda")
load(file = "baggingmodel.rda")

#Load original data for static model use
file.exists("Z-Alizadeh_sani_dataset.csv.R")
data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

# data frame for the scatterplot on data overview
za_cont <- data.frame(Age, Weight, Length, BMI, BP, PR, Function.Class, CR, TG, LDL,
                      HDL, BUN, ESR, HB, K, Na, WBC, Lymph)


#FILENAME: overview_ui.R
#PURPOSE: Removes cluter from ui.R by storing text/text-style in separate file.
#         Adhere to OOP development structure. Keep all relevant code for the
#         Introduction tab in the same file for simple code navigation.
overviewText1 <- div(
  p(tags$b("Heart disease"), "is usually caused by a",
    tags$b("buildup of cholesterol and other fatty acids"),
    "in major arteries, and is relatively common outcome from one or more factors such as: obesity,
                    diet, chronological age, smoking, congenital and chronic conditions and family history of cardiac disease. The prevalence of heart disease has also been increasing in recent years, now accounting for around",
    tags$b("30% of global deaths.")
  ),
  p("Due to the large amount of risk factors, medical research has largely focussed on",
    tags$b("identifying unique predictors and outcomes"), "of heart disease, including: genetics,
                    physiology, gender, ethnicity and behavious. As being able to identify and target specific risk factors can effectively improve patient outcomes and quality of life, this project delivers a",
    tags$b("statistical model to predict if one may have heart disease.")
  )
)

overviewText2 <- tags$br(
  div("This interactive application translates medical and statistical research into an",
      tags$b("accessible and user friendly exploration"), "of heart disease risks and outcomes in order 
                    to promoteawareness and prevention of heart disease. This", 
      tags$b("novel patient-centered approach"), 
      "allows one to explore and understand risks and symptoms of heart disease identified by our model and",
      tags$b("facilitate conversations and informed decision making"), 
      "between the user and appropriate medical professionals.",
      tags$br(em("This model is not a diagnostic tool, as it is outside the scope of knowledge of our development team, and therefore unethical to provide a medically sound tool."))
  )
)


#FILENAME: dataOverview_ui.R
#PURPOSE: Removes cluter from ui.R by storing text/text-style in separate file.
#         Adhere to OOP development structure. Keep all relevant code for the
#         Data Overview tab in the same file for simple code navigation.

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
                "DM: Diabetes Mellitus - whether there is a history of diabetes in the participant’s family or not. In the dataset, 0 indicates no history and 1 indicates some family history. ", 
                "HTN: Whether the participant has hypertension or not, which occurs when the individual’s blood pressure is too high. In the dataset, 0 indicates no hypertension and 1 indicates hypertension.", 
                "Current Smoker: Whether the participant currently smokes cigarettes or not. In the dataset, 0 indicates that the participant does not currently smoke and 1 indicates that they do.",
                "Ex Smoker: Whether the participant has previously smoked cigarettes or not. In the dataset, 0 indicates that the participant has not previously smoked cigarettes and 1 indicates that they have. ", 
                "FH: Family History - whether the participant has a family history of heart disease in first-degree relatives. In the dataset, 0 indicates no family history and 1 indicates some family history.",
                "Obesity: Determined by the participant’s BMI. Greater than 25 is classified as obese.",
                "CRF: Chronic Renal Failure - whether the participant has long-term kidney failure or not. In the dataset, ‘N’ indicates no CRF and ‘Y’ indicates CRF.",
                "CVA: Cerebrovascular Accident - whether the participant has had a stroke or not. In the dataset, ‘N’ indicates no stroke and ‘Y’ indicates a stroke.", 
                "Airway Disease: Whether the participant has any form of breathing difficulties such as asthma, bronchitis, or COPD. In the dataset, ‘N’ indicates no airway diseases and ‘Y’ indicates the presence of an airway disease.", 
                "Thyroid Disease: Whether the participant has any thyroid diseases. This includes hyperthyroidism (where the thyroid produces too many hormones) and hypothyroidism (too few hormones).   In the dataset, ‘N’ indicates no airway diseases and ‘Y’ indicates the presence of an airway disease.", 
                "CHF: Congestive Heart Failure - whether the participant has congestive heart failure or not. This occurs when the heart is unable to sufficiently pump blood to the rest of the body leading to a backwards congestion of blood.  In the dataset, ‘N’ indicates no CHF and ‘Y’ indicates the presence of CHF.", 
                "DLP: Dyslipidemia - whether the participant has high lipids such as cholesterol in their blood. This increases the risk of arteries becoming clogged. In the dataset, ‘N’ indicates no DLP and ‘Y’ indicates the presence of DLP.", 
                "BP: Blood Pressure - the participant’s blood pressure, consisting of systolic (the pressure during a heart pump) and diastolic (the pressure in between pumps). A normal healthy reading for adults is between 120/80 mmHg and 90/60 mmHg.", 
                "PR: Pulse Rate - the participant’s pulse rate - how many times a pulse is felt in a minute. A normal healthy resting rate for adults is between 60 and 100 ppm.", 
                "Edema: Whether the participant has any areas of swelling on their body or not. This often occurs when blood vessels leak fluid into surrounding tissues. n the dataset, 0 indicates no edema and 1 indicates the presence of edema.",
                "Weak Peripheral Pulse: Whether the patient has a weak pulse in peripheral areas such as hands and legs. In the dataset, ‘N’ indicated a normal or strong peripheral pulse and ‘Y’ indicates a weak peripheral pulse.", 
                "Lung Rales: Whether the participant has crackling sounds in the lungs when they inhale. In the dataset, ‘N’ indicates no lung rales and ‘Y’ indicates lung rales.",
                "Systolic Murmur: Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) that is caused by a stiffening of the aortic or pulmonary valves or a weakening of the mitral or tricuspid valves. Occur during ventricular contraction. In the dataset, ‘N’ indicates no systolic murmur and ‘Y’ indicates a systolic murmur.", 
                "Diastolic Murmur: Whether the participant has a murmur (abnormal sounds due to turbulent blood flow) often caused by a stiffening of the mitral or tricuspid valves or a weakening of the aortic or pulmonary valves. Occur during ventricular relaxation. In the dataset, ‘N’ indicates no diastolic murmur and ‘Y’ indicates a diastolic murmur.", 
                "Function Class: A specific class of heart failure the participant is categorized as depending on the progression of their condition. In the dataset, this can be 0 (normal/healthy) or 1,2,3, or 4 depending on the severity of the heart failure.",
                "Atypical: Whether the participant has experienced chest pain that is not attributable to typical causes or reliefs. In the dataset, ‘N’ indicates no atypical chest pain, and ‘Y’ indicates atypical chest pain.",
                "Nonanginal CP (chest pain): Whether the participant has experienced a squeezing chest pain but does not have heart disease. In the dataset, ‘N’ indicates no nonanginal chest pain, and ‘Y’ indicates nonanginal chest pain.", 
                "Exertional CP (chest pain): Whether the patient has chest pains that are brought on by physical exertion. In the dataset, ‘N’ indicates no exertional chest pain, and ‘Y’ indicates exertional chest pain.",
                "LowTH Ang: Low Threshold Angina - whether the participant has early onset angina that is brought on by relatively little exertion. In the dataset, ‘N’ indicates no low threshold angina, and ‘Y’ indicates low threshold angina.",
                "Q Wave: Whether an electrocardiogram (ECG) has recorded normal Q waves (less than 0.04 seconds) or abnormal. In the dataset, 0 indicates normal Q waves and 1 indicates abnormal Q waves.",
                "ST Elevation: Whether an electrocardiogram (ECG) has recorded an abnormally high ST segment, a common indicator of a heart attack. In the dataset, 0 indicates no ST elevation and 1 indicates ST elevation. ", 
                "ST Depression: Whether an electrocardiogram (ECG) has recorded an abnormally low ST segment, a common indicator of a heart attack. In the dataset, 0 indicates no ST depression and 1 indicates ST depression. ", 
                "T Inversion: Whether an electrocardiogram (ECG) has recorded an abnormal T wave inversion, which may indicate a heart attack. In the dataset, 0 indicates no T inversion and 1 indicates abnormal T inversion.", 
                "LVH: Left Ventricular Hypertrophy - whether an electrocardiogram (ECG) has recorded that the left chamber of the heart is not pumping effectively. In the dataset, ‘N’ indicates no LVH and ‘Y’ indicates LVH.",
                "Poor R Progression: Whether an electrocardiogram (ECG) has recorded R waves of less than or equal to 3mm. This can be a consequence of hypertrophy and indicate a heart attack but is also seen in healthy adults. In the dataset, ‘N’ indicates normal R wave progression and ‘Y’ indicates poor R wave progression.",
                "BBB: Bundle Branch Block - whether the participant had a blockage in the heart’s electrical branch bundles. This can decrease the heart’s efficiency. In the dataset, ‘N’ indicates no branch block and ‘Y’ indicates there is a branch blockage.", 
                "FBS: Fasting Blood Sugar - the amount of sugar in the participant’s blood when they have been fasting, in mg/dl. A normal fasting blood sugar level is less than 100 mg/dl.",
                "CR: Creatine - the participant’s levels of creatine (mg/dl), which is used in energy production in muscles.",
                "TG: Triglyceride - the participant’s levels of triglycerides (mg/dl), a type of fat used to store energy.", 
                "LDL: Low Density Lipoprotein - the participant’s levels of low density lipoproteins (mg/dl), a type of fat that transports cholesterol from the liver. High LDL increases risk of heart disease.",
                "HDL: High Density Lipoprotein - the participant’s levels of high density lipoproteins (mg/dl), a type of fat that transports cholesterol to the liver, which then removes cholesterol.",
                "ESR: Erythrocyte Sedimentation Rate - how quickly the participant’s blood cells settle in a test tube (mm/h). A high ESR may indicate inflammation", 
                "HB: Hemoglobin - the participant’s levels of hemoglobin (g/dl), a protein in red blood cells which transports oxygen. Low hemoglobin usually indicates anemia.", 
                "K: Potassium - the amount of potassium in the participant’s blood (mEq/lit). Abnormally low or high potassium can induce abnormal heart rhythms", 
                "Na: Sodium - the amount of sodium in the participant’s blood (mEq/lit). Low sodium can be caused by heart failure.", 
                " WBC: White Blood Cell - the number of white blood cells (leucocytes) in the participant’s blood (cells/ml), which are involved in protecting the body against disease.",
                "Lymph: Lymphocytes - the percentage of lymphocytes present in the participant’s blood. Lymphocytes are a type of white blood cell involved in the immune response to infection or inflammation.", 
                "Neut: Neutrophils - the percentage of neutrophils present in the participant’s blood. Neutrophils are a type of white blood cell involved in the immune response to infection.", 
                "PLT: Platelets - the number of platelets in the participant’s blood (1000/ml). Platelets are a type of cell involved in clotting blood.",
                "EF: Ejection Fraction - a measurement of how much blood the heart’s left ventricle pumps with each beat. A normal ejection fraction is over 55%, and an EF of under 40% can indicate heart failure.", 
                "Region with RWMA: Regional Wall Motion Abnormality - the areas of the participant’s heart which have a regional wall motion abnormality, which may indicate heart failure. In the dataset, this can be 0 (no RWMA), or 1,2,3 or 4 depending on the affected region.", 
                "VHD: Vascular Heart Disease - whether the participant has damage to the aortic, pulmonary, mitral or tricuspid valves. In the dataset, this can be ‘N’ (no VHD) or the severity of the VHD (mild, moderate or severe)",
                "Cath: Whether the participant has coronary artery disease, where arteries in the heart are narrow or blocked due to the buildup of cholesterol and other fats. In the dataset, this can be ‘normal’ (no heart disease) or ‘Cath’ (heart disease). ")

#Create a hash table of variables and their respective definition
varDefinition = hash(variablesList, definitions)

#getDefinition returns the corresponding definition for the selected variable. 
#If no definition exists, the function will instead output an error message to the ui (satistfy robustness of app).
# @param: Takes in a String value, 'var' which is a user selected input.
# @return: Returns a String of text to the ui.
getDefinition <- function(var){
  errorMessage = "Sorry, we couldn't find a definition for that."
  if(is.na(varDefinition[[var]]))
    return(errorMessage)
  else return(varDefinition[[var]])
}


#FILENAME: modellingProcess_ui.R
#PURPOSE: Store text/text-styles & table which appeear on the Model Process page.
modelText <- div("A range of models were generated, altered and tested against the dataset.
                 The resulting accuracy of these models can be viewed in the table below.
                 The final selected model - used for the prediction outcome on the next page - 
                 was the Bagging model, which has a predictive accuracy of 81.31%.")

#Create a table which displays the results of model testing completed during the development process.
modelComparison <- matrix(c("Accuracy", "59%", "75.82%", "79.12%", "79.1%", "80.2%", "81.31%",
                            "AUC/ROC", 0.6839, 0.7387, 0.7169, 0.7481, 0.7487, 0.796),
                          ncol=7, byrow=TRUE)

# Names of the models
colnames(modelComparison) <- c(" ", "Naive Bayes", "Decision Tree", "Random Forest", "XG2", "SVM Model", "Bagging Model")

#Define text/text-styles for each of the 6 models developed/tested for their corresponding side panel tab.
nb_ui <- div(tags$b("Naive bayes using e1071"),
             tags$br("This algorithm uses Bayes rule to classify data.
          The algorithm predicts the probability that a given datapoint would belong in any particular category,
          and the datapoint is assigned the category with the category with the highest probability.
          In R, this was implemented using the e1071 package."), 
             tags$br("Reference :  (Meyer, Dimitriadou, Hornik, Weingessel & Leisch, 2019)."))
dt_ui <- div(tags$b("Simple rpart Decision Tree"),
             tags$br("This algorithm uses a decision tree to classify data.
          A decision tree is somewhat like a flowchart, where nodes represent an attribute 
          and have branches representing outcomes. The final ‘leaf’ node then represents the class 
          the given datapoint is categorised into after following the appropriate branches. 
          In R, this was implemented using the rpart package."),
             tags$br("Reference : (Therneau, Atkinson & Ripley, 2019)."))
rf_ui <- div(tags$b("Random Forest"),
             tags$br("This ensemble algorithm uses a collection of decision trees, forming a ‘forest’, 
          to classify the data. By randomly generating multiple decision trees, the algorithm can 
          more accurately classify the data. In R, this was implemented using the randomForest package."), 
             tags$br("Reference (Breiman, Cutler, Liaw & Wiener, 2018).)"))
xgb_ui <- div(tags$b("Xgboost"),
              tags$br("The boosting classification algorithm is an ensemble method  generates many small, 
              ‘weak’ classifications of the data, and then ‘learns’ from previous failed classifications 
              to improve. In R, this was implemented using the gbm and XGBoost packages."),
              tags$br("Reference (Greenwell, Boehmke & Cunningham, 2019) (Chen et al., 2019)"))
svm_ui <- div(tags$b("SVM Model"),
              tags$br("A Support Vector Machine (SVM) model creates a ‘hyperplane’ - a line that 
              best separates the distinct categories of data points. Points are then classified 
              according to which side of this line that they fall on. In R, this was implemented 
              using the e1071 package."), 
              tags$br("Reference: An Introduction to Support Vector Machines (SVM). (2017, June 22). MonkeyLearn Blog."))
bag_ui <- div(tags$b("Bagging Model"),
              tags$br("Bagging using multiple classification trees adabag. This ensemble classification 
              algorithm generates bootstrapped (randomly drawn) samples from the dataset, and then applies 
              a decision tree to each of these samples. The average of each sample prediction is taken to 
              form the final classification. In R, this was implemented using the adabag package."),
              tags$br("Reference (Alfaro, Gamez  & Garcia, 2013)"))


#FILENAME: userInputs_ui.R
#PURPOSE: Store all functions which take in user inputs from the predictive model page
#         and derive values which are consistent with the model input requirements.  

#Derive BMI from weight and height inputs
# @param: w weight in kg
# @param: h height in cm
# @return: BMI (the body mass index calculated)
calculateBMI <- function(w, h) {
  bmi = w/((h/100)^2)
  return(bmi)
}

#Derive Obesity input
# BMI of 30+ is obese (source: heart foundation)
# @param: a bmi
# @return: "Y" if obese, "N" if not obese
isObese <- function(a) {
  if (a >= 30.0) {
    return("Y")
  } else {
    return("N")
  }
}

# Derive Gender input
# @param: a the gender selected Male/Female
# @return: Fmale if female and Male if male
getGender <- function(a) {
  if (a == "Female") {
    return("Fmale")
  } else {
    return("Male")
  }
}

# Derive Smoker value
# @param: user_input the input the user gave for smoker status
# @param: var_name the variable name (Current smoker or ex smoker)
# @return: 1 if they are in var_name, otherwise 0
getSmokingStatus <- function(user_input, var_name) {
  if (substr(user_input, 1, 2) == substr(var_name, 1, 2)) {
    return(1)
  } else {
    return(0)
  }
}

# Change Yes/No to 1 or 0
# @param: a the users input ("Yes" or "No")
# @return: 1 if yes or 0 if no
changeValues<- function(a){
  if (a=="Yes"){
    return(1)
  }
  else{
    return(0)
  }
}

# convert BBB
# @param: bbb the user input (Left, Right or None)
# @return: LBBB if left, RBBB if right, N if none
getBBB <- function(bbb) {
  if (substr(bbb, 1, 1) == "L") {
    return("LBBB")
  } else if (substr(bbb, 1, 1) == "R"){
    return("RBBB")
  } else{
    return("N")
  }
}

# convert VHD
# @param: vhd the user input for VHD (Mild, Moderate, None or Severe)
# @return: mild if Mild, Moderate if Moderate, N if None, Severe if Severe
getVHD <- function(vhd) {
  if (vhd=="Mild") {
    return("mild")
  } else if (vhd=="Moderate"){
    return("Moderate")
  } else if (vhd == "None"){
    return("N")
  } else if(vhd== "Severe"){
    return("Severe")
  }
}

#FILENAME: predictiveModel_ui.R
#PURPOSE: Store ui text/text-style for the two model types 'basic' and 'advanced'.
#         Include placeholder values and input limits for each input.

#Define the inputs which will appear with the 'basic' model selection.
# The user inputs are forced to be within certain ranges to satisfy robustness
basic <- fluidRow(
  column(4, h4(tags$b("General Information:")),
         numericInput(inputId="userAge_basic", label="Select Age", min=30, max=100, value=50, step=1),
         numericInput(inputId="userWeight_basic", label="Enter Weight (Kg)", value=73, min=35, max=400, step=1),
         numericInput(inputId="userHeight_basic", label="Enter Height (cm)", value=164, min=100, max=250, step=1),
         radioButtons(inputId="userSex_basic", label="Sex:", choices=c("Male", "Female"), inline=T),
         radioButtons(inputId="smoker_basic", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))
  ),
  column(4, h4(tags$b("Heart and Chest Information:")),
         radioButtons(inputId="typicalchestpain_basic", label="Typical chest pain:", choices=c("Yes", "No")),
         numericInput(inputId="userBP_basic", label="Enter Blood Pressure", value=129, min=60, max=200, step=1),
         numericInput(inputId="userPR_basic", label="Enter Heart Rate (BPM)", value=75, min=60, max=200, step=1),
         radioButtons(inputId="htn_basic", label="Hypertension:", choices=c("Yes", "No"))
  ),
  div(
    actionButton(
      inputId="getResults_basic",
      label="GET RESULTS",
      style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
    )
  ),
  tags$br(tags$b(textOutput("result_basic")))
)

#Define the inputs which will appear with the 'advanced' model selection.
advanced <- div(fluidRow(
  column(4, h4(tags$b("General Information:")),
         sliderInput(inputId="userAge_advanced", label="Select Age", min=30, max=100, value=50, step=1),
         numericInput(inputId="userWeight_advanced", label="Enter Weight (Kg)", value=73, min=35, max=400, step=1),
         numericInput(inputId="userHeight_advanced", label="Enter Height (cm)", value=164, min=100, max=250, step=1),
         radioButtons(inputId="userSex_advanced", label="Sex:", choices=c("Male", "Female"), inline=T),
         radioButtons(inputId="smoker_advanced", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))
  ),
  column(4, h4(tags$b("Chest Pain:")),
         radioButtons(inputId="nonanginal", label="Non anginal Chest Pain:", choices=c("Yes", "No")),
         radioButtons(inputId="typicalCP", label="Typical Chest Pain:", choices=c("Yes", "No")),
         radioButtons(inputId="atypical_advanced", label="Atypical Chest Pain:", choices=c("Yes", "No")),
         radioButtons(inputId="dyspnea", label="Dyspnea (shortness of breath):", choices=c("Yes", "No"))
  ),
  column(4, h4(tags$b("Scroll down for more...")),
         img(src="downArrow.png", height=100, width=75)
  )
),
fluidRow(
  column(4, h4(tags$b("Blood Health Information:")),
         radioButtons(inputId="dlp_advanced", label="High Lipids:", choices=c("Yes", "No")),
         sliderInput(inputId="esr", label="Erythrocyte sedimentation rate mm/h:", min=1, max=100, value=19.5, step=0.2),
         sliderInput(inputId="hb", label="Hemoglobin g/dl:", min=8, max=18, value=13.1, step=0.1),
         sliderInput(inputId="k", label="Potassium mEq/lit:", min=3, max=7, value=4.2, step=0.1),
         sliderInput(inputId="Na", label="Sodium mEq/lit:", min=120, max=160, value=140, step=1),
         sliderInput(inputId="wbc", label="White blood cell cells/ml:", min=3700, max=18000, value=7100, step=100),
         sliderInput(inputId="lymph", label="Lymphocyte %:", min=5, max=60, value=31, step=1),
         sliderInput(inputId="neut", label="Neutrophil %:", min=30, max=90, value=60, step=1),
         sliderInput(inputId="plt", label="Platelet 1000/ml:", min=20, max=800, value=221, step=1),
         sliderInput(inputId="ef.tte", label="Ejection fraction %", min=10, max=60, value=47, step=1),
         sliderInput(inputId="fbs", label="Fasting blood sugar mg/dl:", min=55, max=400, value=75, step=1),
         sliderInput(inputId="cr", label="Creatine mg/dl:", min=0.5, max=2.5, value=1, step=0.1),
         sliderInput(inputId="tg", label="Triglycerides mg/dl:", min=30, max=1050, value=122, step=1),
         sliderInput(inputId="ldl", label="Low density lipoprotein mg/dl:", min=15, max=250, value=100, step=1),
         sliderInput(inputId="hdl", label="High density lipoprotein mg/dl:", min=10, max=120, value=40, step=1),
         sliderInput(inputId="bun", label="Blood urea nitrogen mg/dl:", min=5, max=60, value=16, step=1)
  ),
  column(4, h4(tags$b("Heart Health Information:")),
         numericInput(inputId="userBP_advanced", label="Enter Blood Pressure", value=60, min=60, max=200, step=1),
         numericInput(inputId="userPR_advanced", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1),
         radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No")),
         radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No")),
         radioButtons(inputId="htn_advanced", label="Hypertension:", choices=c("Yes", "No")),
         radioButtons(inputId="Qwave", label="ECG Abnormal Q waves recorded:", choices=c("Yes", "No")),
         radioButtons(inputId="lvh", label="ECG left ventricular hypertrophy:", choices=c("Yes", "No")),
         radioButtons(inputId="st.elevation", label="ECG high ST segment:", choices=c("Yes", "No")),
         radioButtons(inputId="st.depression", label="ECG low ST segment:", choices=c("Yes", "No")),
         radioButtons(inputId="tinversion", label="ECG abnormal T inversion:", choices=c("Yes", "No")),
         radioButtons(inputId="region.rwma", label="Region with regional wall motion abnormality:", choices=c("0", "1", "2", "3", "4", "5")),       
         radioButtons(inputId="bbb", label="Bundle Branch Block:", choices=c("None", "Left", "Right"))
  ),
  column(4, h4(tags$b("Pre-Existing Conditions:")),
         radioButtons(inputId="thyroidDisease", label="Thyroid Disease:", choices=c("Yes", "No")),
         radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No")),
         radioButtons(inputId="fh_advanced", label="Family History of Cardiac Disease:", choices=c("Yes", "No")),
         radioButtons(inputId="crf_advanced", label="Kidney Failure:", choices=c("Yes", "No")),
         radioButtons(inputId="cva_advanced", label="Previous Stroke:", choices=c("Yes", "No")),
         radioButtons(inputId="chf_advanced", label="Congestive Heart Failure:", choices=c("Yes", "No")),
         radioButtons(inputId="edema", label="Edema:", choices=c("Yes", "No")),
         radioButtons(inputId="dm_advanced", label="Diabetic", choices=c("Yes", "No")),
         radioButtons(inputId="vhd", label="Valvular heart disease: ", choices=c("None", "Mild", "Moderate", "Severe"))
  ),
),
div(
  actionButton(
    inputId="getResults_advanced",
    label="GET RESULTS",
    style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
  ),
  tags$br(tags$b(textOutput("result_advanced")))
)
)


#FILENAME: references.R
#PURPOSE: Removes clutter from ui.R by storing text/text-style in separate file.
#         Adhere to OOP development structure.

library(shiny)
references <- div(
  tags$ul("Meyer, D., Dimitriadou, E., Hornik, K., Weingessel, A., & Leisch, F. (2019). e1071: Misc Functions of the Department of Statistics, Probability Theory Group (Formerly: E1071), TU Wien. R package version 1.7-3. https://CRAN.R-project.org/package=e1071"),
  tags$ul("Therneau, T., Atkinson, B., & Ripley, B. (2019). rpart: Recursive Partitioning and Regression Trees. R package version 4.1-15. https://CRAN.R-project.org/package=rpart"),
  tags$ul("Breiman, L., Cutler, A., Liaw, A., and Wiener, M. (2018). randomForest: Breiman and Cutler’s Random Forests for Classification and Regression. R package version 4.6-14. https://CRAN.R-project.org/package=randomForest"),
  tags$ul("Greenwell, B., Boehmke, B., Cunningham, J., & GBM Developers. (2019). gbm: Generalized Boosted Regression Models. R package version 2.1.5. https://CRAN.Rproject.org/package=gbm"),
  tags$ul("Chen, T., He, T.,  Benesty, M.,  Khotilovich, V., Tang, Y.,  Cho, H.,  Chen, K., Mitchell, R.,  Cano, I., Zhou, T., Li, M., Xie, J., Lin, M., Geng, Y., and Li, Y. (2019). xgboost: Extreme Gradient Boosting. R package version 0.90.0.2. https://CRAN.R-project.org/package=xgboost"),
  tags$ul("Alfaro, E., Gamez, M., & Garcia, N. (2013). adabag: An R Package for Classification with Boosting and Bagging. Journal of Statistical Software, 54(2), 1-35. Retrieved from http://www.jstatsoft.org/v54/i02/"),
  tags$ul("CSS Text. (n.d.). Https://Www.W3schools.Com/Css/Css_text.Asp. https://www.w3schools.com/css/css_text.asp"),
  tags$ul("Shiny - Tutorial. (n.d.). Https://Shiny.Rstudio.Com/Tutorial/. https://shiny.rstudio.com/tutorial/"),
  tags$ul("Unit Testing in R Programming. (n.d.). GeeksforGeeks. https://www.geeksforgeeks.org/unit-testing-in-r-programming/"),
  tags$ul("Shiny - observeEvent. (n.d.). Https://Shiny.Rstudio.Com/Reference/Shiny/1.0.5/ObserveEvent.Html.")
)


#FILENAME: ui.R
#PURPOSE: The user interface file contains an object (ui) which controls the layout
#         and appearance of the app.

#Load in helper file which contains code for loading in all other files/libraries/data
source("ui_helper.R")

#Define overall design structure of app
header <- dashboardHeader()
sidebar <- dashboardSidebar(
  #Define the labels and idNames for the sidebar tabs
  sidebarMenu(
    id = "tabs",
    menuItem("Introduction", tabName = "introduction"),
    menuItem("Data Overview", tabName = "dataOverview"),
    menuItem("Modelling Process", tabName = "modellingProcess"),
    menuItem("Predictive Model", tabName = "predictiveModel"),
    menuItem("Acknowledgements", tabName = "acknowledgements")
  )
)

body <- dashboardBody(
  tabItems(
    #Define the Introduction page, accessible via the introduction side tab
    tabItem("introduction",
            h1("Predicting Heart Disease in Patients", align="center"),
            #Insert pre-defined text from 'overview_ui.R' file
            div(overviewText1),
            tags$br(HTML('<center><img src="heartImage.png" width="400"></center>')),
            tags$br(div(overviewText2, align="center"))
    ),
    #Define the Data Overview page, accessible via the dataOverview side tab
    tabItem("dataOverview",
            h1("Overview"),
            h3("Below is a summary of the dataset used in this application:"),
            #Define layout of page via column() function. Call server to render valueBoxOutput.
            column(3, valueBoxOutput("DataTotBox", width=100)),
            column(3, valueBoxOutput("DataVarBox", width=100)),
            column(3, valueBoxOutput("DataMaleBox", width=100)),
            column(3, valueBoxOutput("DataFmaleBox", width=100)),
            h3(p("To understand the data in more detail, select a variable to view its definition:")),
            div(
              selectInput("var",
                          label = "Select a Variable:",
                          choices = variablesList,
                          selected = "Age"
              )
            ),
            #Call server to render definition as text output and define output style.
            textOutput("var_definition"),
            tags$head(tags$style("#var_definition {
                           color: black;
                           font-size: 20px;
                           font-style: bold;
                            }"
            )
            )
    ),
    # Information for scatterplot
    tags$br(
      h3("Interactive Scatterplot"),
      h4("Included below is an interactive scatterplot, which plots two continous variables from the dataset against eachother to display the relationship between the variables. You can select the two variables - one for the x axis, and one for the y axis using the drop down menus.")),
    # Insert scatterplot on page and let server know what to output - plotlyOutput('plot', ...)
    tags$br(
      selectInput('xcol','X Variable', names(za_cont)),
      selectInput('ycol','Y Variable', names(za_cont)),
      selected = names(za_cont)[[2]]),
    plotlyOutput('plot', width="50%", height="350px"), 
    tags$br(
      #Adjust text style - size/emphasis
      h5(tags$b("Data Set Information:"),
         tags$br("Each patient could be in two possible categories CAD or Normal. 
            A patient is categorized as CAD, if his/her diameter narrowing is greater than or equal to 50%, 
            and otherwise as Normal."),
         tags$br(
           tags$b("Attribute Information:"),
           tags$br("The Z-Alizadeh Sani dataset contains the records of 303 patients, 
              each of which have 54 features. The features are arranged in four groups: 
              demographic, symptom and examination, ECG, and laboratory and echo features.")),
         tags$br(em("Z.A.S. (2017, November 17). UCI Machine Learning Repository: Z-Alizadeh Sani Data Set.Https://Archive.Ics.Uci.Edu/Ml/Datasets/Z-Alizadeh+Sani. 
                      https://archive.ics.uci.edu/ml/datasets/Z-Alizadeh+Sani"))
      )
    )
  ),
  #Define the Modelling Process page, accessible via the modellingProcess side tab
  tabItem("modellingProcess",
          h2("Generating the Predictive Model"),
          #Insert pre-defined text for page.
          div(modelText),
          tags$br(),
          fluidRow(
            #Define page layout and insert horizontal tabs within page.
            column(7, tableOutput('model_table'),
                   tags$br(tabsetPanel(
                     type="tabs",
                     tabPanel(tags$b("Naive Bayes"), tags$br(), nb_ui),
                     tabPanel(tags$b("Decision Tree"), tags$br(), dt_ui),
                     tabPanel(tags$b("Random Forest"), tags$br(), rf_ui),
                     tabPanel(tags$b("XG Boosting"), tags$br(), xgb_ui),
                     tabPanel(tags$b("SVM Model"), tags$br(), svm_ui),
                     tabPanel(tags$b("Bagging"), tags$br(), bag_ui)
                   ))
            ),
            #Insert image of AUC plot.
            column(5, align="center", img(src="AUC.png", height=300, width=475))
          )
  ),
  #Define the Predictive Model page, accessible via the predictiveModel side tab
  tabItem("predictiveModel",
          h2("Test the Predictive Model"),
          h3("Enter the required information then click", tags$b('Get Results'), "to view your Heart Disease prediction."),
          h4("Select a model type below, for more detailed inputs, select the", tags$b('Advanced'), "option."),
          h5(em("Note that for the advanced model, the user is required to have details about their general health,
         family history and blood test results.")),
          tags$br(),
          #Insert horizontal tabs for model type toggling.
          tabsetPanel(
            type="tabs",
            tabPanel(tags$b("Basic"), tags$br(), basic),
            tabPanel(tags$b("Advanced"), tags$br(), advanced)
          ),
  ),
  #Define the References page, accessible via the acknowledgments side tab
  tabItem("acknowledgements",
          div(h3("References")),
          #Insert pre-defined text from references_ui.R
          tags$ul(references),
          tags$br(),
          div(h3("Contributors")),
          #Define layout, insert image and make it a clickable link.
          fluidRow(
            column(4, align="center", a(img(src="cassieGit.png", height=200, width=200), href="https://github.com/Cassandra344")),
            column(4, align="center", a(img(src="juliaGit.png", height=200, width=200), href="https://github.com/juliapaterson")),
            column(4, align="center", a(img(src="katieGit.png", height=200, width=200), href="https://github.com/poluskg"))
          ),
          fluidRow(
            column(4, align="center", tags$b("Cassandra Elliott", align="center")),
            column(4, align="center", tags$b("Julia Paterson", align="center")),
            column(4, align="center", tags$b("Katie Polus", align="center"))
          )
  )
)
)

#Define the ui object which will be parsed through the server.
ui <- dashboardPage(header, sidebar, body)


#FILENAME: server.R
#PURPOSE: The server function contains the instructions which the computer needs to build 
#         the app and compile all interactive components.

#The server function takes in input values for interactive components and renders the output type for a given session.
server <- function(input, output, session) {
  #*****DATA OVERVIEW PAGE*****#
  #Renders the 4 value boxes on the data-overview page, specifying colour/text-style.
  output$DataTotBox <- renderValueBox({
    valueBox(
      VB_style("303", "font-size: 60%;"),
      "Total Instances", 
      color = "blue"
    )
  })
  
  output$DataVarBox <- renderValueBox({
    valueBox(
      VB_style("56", "font-size: 60%;"),
      "Unique Variables", 
      color = "blue"
    )
  })
  
  #DataMaleBox and DataFmaleBox take in the pre-calculated values totalMales/totalFemales from
  #the dataOverview_ui.R file.
  output$DataMaleBox <- renderValueBox({
    valueBox(
      VB_style(paste0(format(round(totalMales, 1), nsmall=1), "%"), "font-size: 60%;"),
      "Males", 
      color = "blue"
    )
  })
  
  output$DataFmaleBox <- renderValueBox({
    valueBox(
      VB_style(paste0(format(round(totalFemales, 1), nsmall=1), "%"), "font-size: 60%;"),
      "Females", 
      color = "blue"
    )
  })
  
  # Reactive parts of the plotly scatterplot
  x <- reactive({
    za_cont[,input$xcol]
  })
  y <- reactive({
    za_cont[,input$ycol]
  })
  # Render the plot given the user selection
  output$plot <- renderPlotly(
    plot1 <- plot_ly(
      x = x(),
      y = y(),
      type = 'scatter',
      mode = 'markers') %>% layout(title="Correlation Scatterplot")
  )
  
  #Render the text for the getDefinition function which return the corressponding definition 
  #for the user-selected variable input.
  output$var_definition <- renderText({
    getDefinition(input$var)
  }
  )
  
  #*****MODEL COMPARISON PAGE*****#
  #Render the table which displays model accuracy/performance information
  #defined in the modelComparison_ui.R file.
  output$model_table <- renderTable({
    modelComparison
  })
  
  #*****PREDICTIVE MODEL PAGE*****#
  #Wait until user has entered in information and selected 'GET RESULTS' button.
  observeEvent(input$getResults_basic, {
    userDataBasic <- data.frame(
      Age=as.numeric(input$userAge_basic), 
      Weight=as.numeric(input$userWeight_basic),
      Length=as.numeric(input$userHeight_basic), 
      Sex=toString(getGender(input$userSex_basic)),
      BMI=calculateBMI(input$userWeight_basic, input$userHeight_basic),
      DM=0, HTN=as.numeric(changeValues(input$htn_basic)), 
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Ex.Smoker")),
      FH=0, Obesity=isObese(calculateBMI(input$userWeight_basic, input$userHeight_basic)),
      CRF= "N", CVA="N", Airway.disease= "N", Thyroid.Disease= "N", CHF= "N", DLP= "N",
      BP=as.numeric(input$userBP_basic), PR=as.numeric(input$userPR_basic), Edema= 0, 
      Weak.Peripheral.Pulse= "N", Lung.rales= "N", Systolic.Murmur="N", Diastolic.Murmur="N",
      Typical.Chest.Pain= as.numeric(changeValues(input$typicalchestpain_basic)),
      Dyspnea= "Y", Function.Class=0, Atypical= "Y", Nonanginal= "N", 
      Exertional.CP="N", LowTH.Ang= "N", Q.Wave=0, St.Elevation=0, St.Depression= 0, Tinversion= 0, 
      LVH= "N", Poor.R.Progression= "N", BBB="LBBB", FBS= 119, CR=1, TG=150, LDL=105, HDL=40.2, 
      BUN=17.5, ESR= 19.5, HB=13.1, K=4.2, Na= 141,WBC= 7562,  Lymph=31, Neut=60, PLT= 221, EF.TTE= 47, 
      Region.RWMA=0, VHD= "mild"
    )
    
    
    #Check that userDataBasic data frame has the same column names as the data frame required
    # for the predictive model - z is the dataset used to train the model.
    names(userDataBasic) <- names(z[2,-56])
    #Bind the two data frames together to be parsed through the model.
    userDataBasic <- rbind(z[2,-56], userDataBasic)
    #Make prediction on user input against model and store in 'prediction' variable.
    prediction <- predict(bagmodel, userDataBasic[2,])
    
    #Where the ui requests a text output, render the result of 'prediction' variable 
    #with ifelse statement.
    output$result_basic <- renderText({
      ifelse(prediction=="Normal", 
             "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.",
             "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional."
      )
    })
  }
  )
  
  #Advanced Model Prediction
  # set exertional.cp, lowth.ang and CHF to "N" as there was limited data for these variables
  # set CRF, airway.disease, weak.peripheral.pulse and poor.r.progression to 'N' (these variables were less important)
  observeEvent(input$getResults_advanced, {
    userDataAdvanced <- data.frame(
      Age=input$userAge_advanced, 
      Weight=input$userWeight_advanced,
      Length=as.numeric(input$userHeight_advanced), 
      Sex=getGender(input$userSex_advanced),
      BMI=calculateBMI(input$userWeight_advanced, input$userHeight_advanced),
      DM=as.numeric(changeValues(input$dm_advanced)), 
      HTN=as.numeric(changeValues(input$htn_advanced)),
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Ex.Smoker")),
      FH=as.numeric(changeValues(input$fh_advanced)), 
      Obesity= isObese(calculateBMI(input$userWeight_advanced, input$userHeight_advanced)), 
      CRF= "N", 
      CVA=str_sub(input$cva_advanced, 1, 1),
      Airway.disease= "N", 
      Thyroid.Disease= str_sub(input$thyroidDisease, 1, 1),
      CHF= "N", 
      DLP= str_sub(input$dlp_advanced, 1, 1), 
      BP=as.numeric(input$userBP_advanced), 
      PR=as.numeric(input$userPR_advanced), 
      Edema= changeValues(input$edema), 
      Weak.Peripheral.Pulse= "N",
      Lung.rales= str_sub(input$lungRales, 1, 1), 
      Systolic.Murmur= str_sub(input$systolicMurmur, 1, 1),
      Diastolic.Murmur=str_sub(input$diastolicMurmur, 1, 1),
      Typical.Chest.Pain= changeValues(input$typicalCP), 
      Dyspnea= str_sub(input$dyspnea, 1, 1),
      Function.Class=as.numeric(input$function_class), 
      Atypical= str_sub(input$atypical_advanced, 1, 1), 
      Nonanginal= str_sub(input$nonanginal, 1, 1), 
      Exertional.CP="N", 
      LowTH.Ang= "N",
      Q.Wave=changeValues(input$Qwave), 
      St.Elevation=changeValues(input$st.elevation),
      St.Depression= changeValues(input$st.depression), 
      Tinversion= changeValues(input$tinversion), 
      LVH= str_sub(input$lvh, 1, 1),
      Poor.R.Progression= "N", 
      BBB=getBBB(input$bbb),  
      FBS= as.numeric(input$fbs), 
      CR=as.numeric(input$cr), 
      TG=as.numeric(input$tg),
      LDL=as.numeric(input$ldl), 
      HDL=as.numeric(input$hdl), 
      BUN=as.numeric(input$bun), 
      ESR= as.numeric(input$esr), 
      HB= as.numeric(input$hb), 
      K= as.numeric(input$k), 
      Na= as.numeric(input$Na),
      WBC= as.numeric(input$wbc), 
      Lymph=as.numeric(input$lymph),  
      Neut=as.numeric(input$neut), 
      PLT= as.numeric(input$plt), 
      EF.TTE= as.numeric(input$ef.tte),  
      Region.RWMA=as.numeric(input$region.rwma), 
      VHD=getVHD(input$vhd) 
    )
    #Same as basic model, compare data frame names, bind together and make prediction.
    names(userDataAdvanced) <- names(z[2,-56])
    userDataAdvanced <- rbind(z[2,-56], userDataAdvanced)
    prediction <- predict(bagmodel, userDataAdvanced[2,])
    
    #Render output as text.
    output$result_advanced <- renderPrint({ 
      ifelse(prediction=="Normal", 
             "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.",
             "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional."
      )
    })
  }
  )
}

#FILENAME: data.Rmd
#PURPOSE: To alter the Z Alizedeh Sani dataset into a usable format

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# load the packages
library(tidyverse)
library(readtext)
library(stringr)
library(readxl)
```


Read in z alizedeh sani dataset
```{r}
z<- read_excel("Z-Alizadeh_sani_dataset.xlsx", sheet=1)

# column names are not working properly- change them
names(z) <- make.names(names(z))


# change z ali sani chr to factor
z$Sex<-as.factor(z$Sex)
z$Current.Smoker<-as.factor(z$Current.Smoker)
z$EX.Smoker<-as.factor(z$EX.Smoker)
z$Cath<-as.factor(z$Cath)
z$Obesity <-as.factor(z$Obesity)
z$CRF <-as.factor(z$CRF)
z$CVA <-as.factor(z$CVA)
z$Airway.disease <-as.factor(z$Airway.disease)
z$Thyroid.Disease <-as.factor(z$Thyroid.Disease)
z$CHF <-as.factor(z$CHF)
z$DLP <-as.factor(z$DLP)
z$Weak.Peripheral.Pulse <-as.factor(z$Weak.Peripheral.Pulse)
z$Lung.rales <-as.factor(z$Lung.rales)
z$Systolic.Murmur <-as.factor(z$Systolic.Murmur)
z$Diastolic.Murmur <-as.factor(z$Diastolic.Murmur)
z$Dyspnea <-as.factor(z$Dyspnea)
z$Atypical <-as.factor(z$Atypical)
z$Nonanginal <-as.factor(z$Nonanginal)
z$Exertional.CP <-as.factor(z$Exertional.CP)
z$LowTH.Ang <-as.factor(z$LowTH.Ang)
z$LVH <-as.factor(z$LVH)
z$Poor.R.Progression <-as.factor(z$Poor.R.Progression)
z$BBB <-as.factor(z$BBB)
z$VHD <-as.factor(z$VHD)


# make test and training set
set.seed(1111) #random seed for reproducability
train.row = sample(1:nrow(z), 0.7*nrow(z))  
data.train = z[train.row,]  
data.test = z[-train.row,]

```

```{r}
# save the data for easy access
save(z, file="z.Rdata")

```

#FILENAME: models.Rmd
#PURPOSE: To create and test different predictive models

---
  title: "models"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

#Loading the packages
library(tidyverse)
library(readtext)
library(stringr)
library(rpart)
library(adabag)
library(randomForest)
library(gbm)
library(xgboost)
library(ipred)
library(pROC)
library(e1071)
```

## models.Rmd

These models use the z alizadehsani set.

Separate testing and training data
```{r}
load("z.Rdata")

set.seed(1111) #random seed  

# 70% of the data is training, 30% is testing
train.row = sample(1:nrow(z), 0.7*nrow(z))  
data.train = z[train.row,]  
data.test = z[-train.row,]

```

# Naive Bayes
Implement a Naive bayes model using the e1071 package.
Inputs: data.train data set, data.test data set
outputs: naiveb the naive bayes model
nb_predictions the predicted outcomes of the data.test set
a confusion matrix of the results
```{r}
library(e1071)

naiveb<- naiveBayes(Cath~., data=data.train)

# predict outcome of the test data set
nb_Predictions=predict(naiveb,data.test)

#Confusion matrix to check accuracy
table(nb_Predictions,data.test$Cath)

# Calculate area under the ROC curve
roc_nb <- roc(as.numeric(data.test$Cath), as.numeric(nb_Predictions))
auc(roc_nb)

plot.roc(roc_nb)

```
59% accuracy
Area under the curve: 0.6839

# decision tree
Implement a decision tree using the rpart package.
Inputs: data.train data set, data.test data set
outputs: tree the tree model
nb_predictions the predicted outcomes of the data.test set
a confusion matrix of the results
```{r}

tree<- rpart(Cath~., data.train, method="class")

tree

plot(tree)
text(tree)

set.seed(1234)

tree_prediction<- predict(tree, data.test, type = "class")
table(actual	=	data.test$Cath,	predicted	=	tree_prediction)

# Area under ROC curve
roc_tree <- roc(as.numeric(data.test$Cath), as.numeric(tree_prediction))
auc(roc_tree)
```

75.82% accuracy
Area under the curve: 0.7387




## Random Forest 

```{r}
set.seed(1234)
forest<- randomForest(as.factor(Cath)~., data = data.train, ntree=1000)

forest

table(actual	=	data.test$Cath,	predicted	=	predict(forest, data.test))


# Area under ROC curve
roc_rf <- roc(as.numeric(data.test$Cath), as.numeric(predict(forest, data.test)))
auc(roc_rf)
```

79.12% accurate 
Area under the curve: 0.7169


##XG boost

```{r}
xg.train<-data.train
xg.test<- data.test

# XG boost takes a matrix of numeric values, so these variables need to be changed
# to numeric
xg.train$Obesity <-as.numeric(xg.train$Obesity)
xg.train$CRF <-as.numeric(xg.train$CRF)
xg.train$CVA <-as.numeric(xg.train$CVA)
xg.train$Airway.disease <-as.numeric(xg.train$Airway.disease)
xg.train$Thyroid.Disease <-as.numeric(xg.train$Thyroid.Disease)
xg.train$CHF <-as.numeric(xg.train$CHF)
xg.train$DLP <-as.numeric(xg.train$DLP)
xg.train$Weak.Peripheral.Pulse <-as.numeric(xg.train$Weak.Peripheral.Pulse)
xg.train$Lung.rales <-as.numeric(xg.train$Lung.rales)
xg.train$Systolic.Murmur <-as.numeric(xg.train$Systolic.Murmur)
xg.train$Diastolic.Murmur <-as.numeric(xg.train$Diastolic.Murmur)
xg.train$Dyspnea <-as.numeric(xg.train$Dyspnea)
xg.train$Atypical <-as.numeric(xg.train$Atypical)
xg.train$Nonanginal <-as.numeric(xg.train$Nonanginal)
xg.train$Exertional.CP <-as.numeric(xg.train$Exertional.CP)
xg.train$LowTH.Ang <-as.numeric(xg.train$LowTH.Ang)
xg.train$LVH <-as.numeric(xg.train$LVH)
xg.train$Poor.R.Progression <-as.numeric(xg.train$Poor.R.Progression)
xg.train$BBB <-as.numeric(xg.train$BBB)
xg.train$VHD <-as.numeric(xg.train$VHD)
xg.train$Sex <-as.numeric(xg.train$Sex)
xg.train$Current.Smoker <-as.numeric(xg.train$Current.Smoker)
xg.train$Cath <-as.numeric(xg.train$Cath)

# to numeric
xg.test$Obesity <-as.numeric(xg.test$Obesity)
xg.test$CRF <-as.numeric(xg.test$CRF)
xg.test$CVA <-as.numeric(xg.test$CVA)
xg.test$Airway.disease <-as.numeric(xg.test$Airway.disease)
xg.test$Thyroid.Disease <-as.numeric(xg.test$Thyroid.Disease)
xg.test$CHF <-as.numeric(xg.test$CHF)
xg.test$DLP <-as.numeric(xg.test$DLP)
xg.test$Weak.Peripheral.Pulse <-as.numeric(xg.test$Weak.Peripheral.Pulse)
xg.test$Lung.rales <-as.numeric(xg.test$Lung.rales)
xg.test$Systolic.Murmur <-as.numeric(xg.test$Systolic.Murmur)
xg.test$Diastolic.Murmur <-as.numeric(xg.test$Diastolic.Murmur)
xg.test$Dyspnea <-as.numeric(xg.test$Dyspnea)
xg.test$Atypical <-as.numeric(xg.test$Atypical)
xg.test$Nonanginal <-as.numeric(xg.test$Nonanginal)
xg.test$Exertional.CP <-as.numeric(xg.test$Exertional.CP)
xg.test$LowTH.Ang <-as.numeric(xg.test$LowTH.Ang)
xg.test$LVH <-as.numeric(xg.test$LVH)
xg.test$Poor.R.Progression <-as.numeric(xg.test$Poor.R.Progression)
xg.test$BBB <-as.numeric(xg.test$BBB)
xg.test$VHD <-as.numeric(xg.test$VHD)
xg.test$Sex <-as.numeric(xg.test$Sex)
xg.test$Current.Smoker <-as.numeric(xg.test$Current.Smoker)
xg.test$Cath <-as.numeric(xg.test$Cath)
# make into a matrix
xg.train<- data.matrix(xg.train)
xg.test<-data.matrix(xg.test)
Cath<- as.numeric(data.train$Cath)


```

This is the first xgboost using linear regression, then classifying each prediction as Cath or not Cath with split on 0.5
```{r}
xg<- xgboost(data=xg.train[,-56], label = Cath, max.depth=6, nrounds = 25)


importance <- xgb.importance(feature_names = colnames(xg.train), model = xg)
importance

pred <- predict(xg, xg.test[,-56])
prediction <- as.numeric(pred > 1.5)
err <- mean(as.numeric(pred > 1.5) != xg.test[,56]-1)
print(paste("test-error=", err))

# for Cath column 1= Cad, 2=Normal

table(actual	=	xg.test[,56]-1,	predicted	=	prediction)
```
73.6% accuracy. This Xgboost probably is not the best model because it does not estimate binary variables.

This Xgboost uses binary/logistic regression:
  ```{r}
Cath=Cath-1
xg2<- xgboost(data=xg.train[,-56], label = Cath, max.depth=4, nrounds = 25, objective = "binary:logistic")


importance <- xgb.importance(feature_names = colnames(xg.train), model = xg2)
importance

pred <- predict(xg2, xg.test[,-56])
prediction <- as.numeric(pred > 0.50)

table(actual	=	xg.test[,56]-1,	predicted	=	prediction)




roc_xg <- roc(xg.test[,56]-1, prediction)
auc(roc_xg)
```
76.9% accuracy for max.depth=6, nround=25
75.8% accuracy for max.depth=7, nround=25
75.8% accuracy for max.depth=7, nround=50
79.1% accuracy for max.depth=4/3, nround=25

Area under ROC curve= 0.7481

# SVM 
SVM model
```{r}


# SVM takes a matrix
# also remove  CHR ,Exertional.CP , LowTH.Ang
svm.train<-data.train[ -c(16, 30, 31) ]
svm.test<-data.test[ -c(16, 30, 31) ]
svm.train<- data.matrix(svm.train)
svm.test<-data.matrix(svm.test)

# this is the model
svmmodel<-svm(Cath~., data=svm.train)

# predict the test set
pred<-predict(svmmodel, svm.test)
prediction <- as.numeric(pred > 1.5)
table(actual	=	xg.test[,56]-1,	predicted	=	prediction)

roc_svm <- roc(xg.test[,56]-1, prediction)
auc(roc_svm)
```
80.2% accurate

area under ROC curve 0.7487


```{r}
library("ISLR")
library("tree")

tree.2 = tree(Cath~., data=data.train)
cv.tree = cv.tree(tree.2, FUN = prune.misclass)

plot(cv.tree)
```
```{r}
# pick tree size=11
prune.tree2 = prune.misclass(tree.2, best = 11)
plot(prune.tree2)
text(prune.tree2, pretty=0)

treep<- predict(prune.tree2, data.test, type = "class")
table(actual	=	data.test$Cath,	predicted	=	treep)

roc_obj <- roc(as.numeric(data.test$Cath),as.numeric(treep))
auc(roc_obj)
```
70.3% accuracy
AUC ROC 0.6737

# Bagging
```{r}
set.seed(12345)

bagmodel<-bagging(Cath~., data=data.train, m = 5, ntree = 1000, mtry = NULL, trace = T)


bagpred<- predict(bagmodel, data.test)
table(actual	=	data.test$Cath,	predicted	=	bagpred)

roc_bag <- roc(as.numeric(data.test$Cath),as.numeric(bagpred))
auc(roc_bag)

save(bagmodel, file="baggingmodel.rda")
```
81.31% Accuracy
Area under the curve: 0.796




# variable importance
```{r}
# tree
tree$variable.importance

# boosting
boost$importance

# random forest
forest$importance


```

## Testing Results
The models are:
  - naiveb: Naive bayes using e1071
- tree: simple rpart decision tree
- forest: random forest 
- xg2: Xgboost 79.1% accuracy for max.depth=4/3, nround=25
- svmmodel: SVM 80.2% accuracy 
- bagmodel: Bagging using multiple classification trees


Model       Accuracy        AUC ROC
naiveb      59%             0.6839
tree        75.82%          0.7387
forest      79.12%          0.7169
xg2         79.1%           0.7481
svmmodel    80.2%           0.7487
bagmodel    81.31%          0.796


# Making Predictions
This is a prototype of the function to create predictions in the final web application. It takes inputs from the user and uses the best model (bagging) to predict Cad or Normal.
Inputs: bagmodel, the bagging model
age1, weight1, length1, bmi1 the user inputs
Outputs: Cad statement or Normal statement
```{r}
# load the model
load(file = "baggingmodel.rda")

# Ask for inputs

print("Please enter the following details")
age1 <- readline(prompt="Age: ")
weight1<-readline(prompt="Weight: ")
length1<-readline(prompt="Height in cm: ")
bmi1<-readline(prompt="BMI: ")

# means from FBS

userdata<-data.frame(Age=as.numeric(age1), Weight=as.numeric(weight1), Length=as.numeric(length1), Sex= "Male", BMI=as.numeric(bmi1), DM=0, HTN=0, Current.Smoker= "0", Ex.Smoker="1", FH=0, Obesity= "N", CRF= "N", CVA="N", Airway.disease= "N", Thyroid.Disease= "N", CHF= "N", DLP= "N", BP=as.numeric(140), PR=as.numeric(70), Edema= 0, Weak.Peripheral.Pulse= "N", Lung.rales= "N", Systolic.Murmur= "N", Diastolic.Murmur="N", Typical.Chest.Pain= 0, Dyspnea= "Y", Function.Class=0, Atypical= "Y", Nonanginal= "N", Exertional.CP="N", LowTH.Ang= "N", Q.Wave=0, St.Elevation=0, St.Depression= 0, Tinversion= 0, LVH= "N", Poor.R.Progression= "N", BBB="LBBB", FBS= 119, CR=1, TG=150, LDL=105, HDL=40.2,  BUN=17.5, ESR= 19.5, HB=13.1, K=4.2, Na= 141,WBC= 7562,  Lymph=31, Neut=60, PLT= 221, EF.TTE= 47, Region.RWMA=0, VHD= "mild")

# make sure column names are the same
names(userdata) <- names(z[2,-56])

# bind the row of user data to one row from the original data set so that it inherits the factor levels
userdata<-rbind(z[2,-56], userdata)

# predict the outcome
prediction<-predict(bagmodel, userdata[2,])

# Print Response
ifelse(prediction=="Normal", "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.", "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional.")
```

Exertional.CP , LowTH.Ang and CHF do nott have enough variation in the training set, so all have been set to N (the training mean for each one is N).

# AUC ROC
This makes the area under the ROC curve graph in the web app
inputs: roc_nb ROC of naive bayes model
        roc_rf ROC of random forest model
        roc_xg ROC of random xg boost model
        roc_bag ROC of bagging model
        roc_svm ROC of SVM model
output: Graph of AUC of ROC for each model
```{r}
plot(roc_nb, col = "blue", xlim=c(1,0))
lines(roc_tree, col="dark green")
lines(roc_rf, col="yellow")
lines(roc_xg, col="navy")
lines(roc_bag, col="red")
lines(roc_svm, col="green")
legend(0, 0.4, legend=c("Naive Bayes", "Decision Tree", "Random Forest", "Xgboost", "Bagging", "SVM"),
       col=c("blue", "dark green", "yellow", "navy", "red", "green"), lty=1, cex=0.8)
title("Area Under ROC Curve")
```

#FILENAME: unittesting.RMD
#Purpose: to test the functions

Load all the functions from the user interface
```{r}
#setwd("~/fit3164/webapp/")
source("userInputs_ui.R")
library(testthat)
```

Unit testing for calculateBMI
This will test the accuracy of the calculateBMI function, by comparing the outputs of the function to expected BMI
inputs: calculateBMI() function, 
        these weight/height combinations: (118, 167), (124.6, 217), (49.88472,153.7757)
expected output: No output if all the tests are correct

```{r}

test_that("BMI of user",
          { expect_equal(calculateBMI(118, 167), 42.310588404)
            expect_equal(calculateBMI(124.6, 217), 26.4605321837)
            expect_equal(calculateBMI(49.88472,153.7757),21.0956112462)

          })
```

Unit testing for isObese
This will test the accuracy of the isObese function, by comparing the outputs of the function to expected output
inputs: isObese() function, 
        these BMIs: 42, 30, 29.5, 26
expected output: No output if all the tests are correct
```{r}
test_that("Obesity of user",
          { expect_equal(isObese(42), "Y")
            expect_equal(isObese(30), "Y")
            expect_equal(isObese(29.5),"N")
            expect_equal(isObese(26),"N")

          })
```


Unit testing for getGender
This will test the accuracy of the getGender function, by comparing the outputs of the function to expected gender
inputs: getGender() function, 
        "Female"
        "Male"
expected output: No output if all the tests are correct
```{r}
test_that("Gender of user",
          { expect_equal(getGender("Female"), "Fmale")
            expect_equal(getGender("Male"), "Male")

          })
```

Unit testing for changeValues
This will test the accuracy of the changeValues function, by comparing the outputs of the function to expected output
inputs: changeValues() function, 
        "Yes"
        "No"
expected output: No output if all the tests are correct
```{r}
test_that("Changing values",
          { expect_equal(changeValues("Yes"), 1)
            expect_equal(changeValues("No"), 0)

          })
```

Unit testing for getBBB
This will test the accuracy of the getBBB function, by comparing the outputs of the function to expected output
inputs: getBBB() function, 
        "Left"
        "Right"
        "None"
expected output: No output if all the tests are correct
```{r}
test_that("BBB",
          { expect_equal(getBBB("Left"), "LBBB")
            expect_equal(getBBB("None"), "N")
            expect_equal(getBBB("Right"), "RBBB")

          })
```

Unit testing for getVHD
This will test the accuracy of the getVHD function, by comparing the outputs of the function to expected output
inputs: getVHD() function 
        "Mild"
        "Moderate"
        "None"
        "Severe"
expected output: No output if all the tests are correct
```{r}
test_that("VHD",
          { expect_equal(getVHD("Mild"), "mild")
            expect_equal(getVHD("None"), "N")
            expect_equal(getVHD("Moderate"), "Moderate")
            expect_equal(getVHD("Severe"), "Severe")

          })
```

#FILENAME: unusedcode.RMD
#Purpose: all the unused parts of our code

---
title: "unusedcode"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

The following code is not used for our project.

# Data processing:

Hungary data set
```{r}

# this is the 76 variable set
h<-readtext("hungarian.data")
h<- h[-1]

#split rows
h<-h %>% 
  separate_rows(text, sep = "name")
# split columns

# remove \n from row2:
h<-h %>%
  mutate(text = str_replace(text, "\n",""))

h<-h %>% separate(text, c("id","ccf", "age" ,"sex", "painloc" ,"painexer" ,"relrest" ,"pncaden" ,"cp", "trestbps","htn" , "chol","smoke" ,"cigs" , "years" ,"fbs", "dm" ,"famhist" ,"restecg", "ekgmo" ,"ekgday" , "ekgyr" ,"dig" ,"prop" ,"nitr" ,"pro" ,"diuretic" ,"proto" ,"thaldur" , "thaltime" ,"mets" ,"thalach","thalrest" ,"tpeaksbps" ,"tpeaksbpd" , "dummy" ,"trestbpd" ,"exang","xhypo" , "oldpeak", "slope", "r1dv5" ,"r1dv5e" ,"ca", "restckm" ,"exerckm" ,"restef" ,"restwm" ,"exeref", "exerwm"  ,"thal", "thalsev" , "thalpul" ,"earlobe" ,"cmo" ,"cday" ,"cyr" ,"num", "lmt" ,"ladprox" ,"laddist" , "diag" ,"cxmain" , "ramus" ,"om1" ,"om2" ,"rcaprox" ,"rcadist" ,"lvx1" ,"lvx2" ,"lvx3" ,"lvx4" ,"lvf" ,"cathef" ,"junk"))

# we are not using this anymore so we will not save it
#write.csv(h,'hungary_large.csv')
hungarian<-h
```

Cleveland set
```{r}
# large set
# this is the 76 variable set

c<-readtext("cleveland.data")
c<- c[-1]

#split rows
c<-c %>% 
  separate_rows(text, sep = "name")
# split columns

# remove \n from row2:
c<-c %>%
  mutate(text = str_replace(text, "\n",""))

c<-c %>% separate(text, c("id","ccf", "age" ,"sex", "painloc" ,"painexer" ,"relrest" ,"pncaden" ,"cp", "trestbps","htn" , "chol","smoke" ,"cigs" , "years" ,"fbs", "dm" ,"famhist" ,"restecg", "ekgmo" ,"ekgday" , "ekgyr" ,"dig" ,"prop" ,"nitr" ,"pro" ,"diuretic" ,"proto" ,"thaldur" , "thaltime" ,"mets" ,"thalach","thalrest" ,"tpeaksbps" ,"tpeaksbpd" , "dummy" ,"trestbpd" ,"exang","xhypo" , "oldpeak", "slope", "r1dv5" ,"r1dv5e" ,"ca", "restckm" ,"exerckm" ,"restef" ,"restwm" ,"exeref", "exerwm"  ,"thal", "thalsev" , "thalpul" ,"earlobe" ,"cmo" ,"cday" ,"cyr" ,"num", "lmt" ,"ladprox" ,"laddist" , "diag" ,"cxmain" , "ramus" ,"om1" ,"om2" ,"rcaprox" ,"rcadist" ,"lvx1" ,"lvx2" ,"lvx3" ,"lvx4" ,"lvf" ,"cathef" ,"junk"))

#write.csv(c,'cleveland_large.csv')
cleveland<-c
```

switzerland set
```{r}
# large set

# this is the 76 variable set
c<-readtext("switzerland.data")
c<- c[-1]

#split rows
c<-c %>% 
  separate_rows(text, sep = "name")
# split columns

# remove \n from row2:
c<-c %>%
  mutate(text = str_replace(text, "\n",""))


c<-c %>% separate(text, c("id","ccf", "age" ,"sex", "painloc" ,"painexer" ,"relrest" ,"pncaden" ,"cp", "trestbps","htn" , "chol","smoke" ,"cigs" , "years" ,"fbs", "dm" ,"famhist" ,"restecg", "ekgmo" ,"ekgday" , "ekgyr" ,"dig" ,"prop" ,"nitr" ,"pro" ,"diuretic" ,"proto" ,"thaldur" , "thaltime" ,"mets" ,"thalach","thalrest" ,"tpeaksbps" ,"tpeaksbpd" , "dummy" ,"trestbpd" ,"exang","xhypo" , "oldpeak", "slope", "r1dv5" ,"r1dv5e" ,"ca", "restckm" ,"exerckm" ,"restef" ,"restwm" ,"exeref", "exerwm"  ,"thal", "thalsev" , "thalpul" ,"earlobe" ,"cmo" ,"cday" ,"cyr" ,"num", "lmt" ,"ladprox" ,"laddist" , "diag" ,"cxmain" , "ramus" ,"om1" ,"om2" ,"rcaprox" ,"rcadist" ,"lvx1" ,"lvx2" ,"lvx3" ,"lvx4" ,"lvf" ,"cathef" ,"junk"))
#write.csv(c,'switzerland_large.csv')

switzerland<-c
```

long beach set
```{r}
# large set

# this is the  76 variable set

c<-readtext("long-beach-va.data")
c<- c[-1]

#split rows
c<-c %>% 
  separate_rows(text, sep = "name")
# split columns

# remove \n from row2:
c<-c %>%
  mutate(text = str_replace(text, "\n",""))


c<-c %>% separate(text, c("id","ccf", "age" ,"sex", "painloc" ,"painexer" ,"relrest" ,"pncaden" ,"cp", "trestbps","htn" , "chol","smoke" ,"cigs" , "years" ,"fbs", "dm" ,"famhist" ,"restecg", "ekgmo" ,"ekgday" , "ekgyr" ,"dig" ,"prop" ,"nitr" ,"pro" ,"diuretic" ,"proto" ,"thaldur" , "thaltime" ,"mets" ,"thalach","thalrest" ,"tpeaksbps" ,"tpeaksbpd" , "dummy" ,"trestbpd" ,"exang","xhypo" , "oldpeak", "slope", "r1dv5" ,"r1dv5e" ,"ca", "restckm" ,"exerckm" ,"restef" ,"restwm" ,"exeref", "exerwm"  ,"thal", "thalsev" , "thalpul" ,"earlobe" ,"cmo" ,"cday" ,"cyr" ,"num", "lmt" ,"ladprox" ,"laddist" , "diag" ,"cxmain" , "ramus" ,"om1" ,"om2" ,"rcaprox" ,"rcadist" ,"lvx1" ,"lvx2" ,"lvx3" ,"lvx4" ,"lvf" ,"cathef" ,"junk"))

write.csv(c,'longbeach_large.csv')

longbeach<-c
```
Intergrating the datasets:
#Z sani set                4 data sets
Typical.Chest.Pain        derive from cp value 1
Atypical                  derive from cp value 2
Age                       age
HTN                       hypertension- blood pressure above 130/80 - 140/90mmgg(mayo clinic definition)
                          I am making it trestbpd>80 AND trestbps>130 = YES
BP                        blood pressure- most likely trestbps
Current.Smoker            smoke 1 = yes; 0 = no 
FBS                       fbs (fasting blood sugar > 120 mg/dl)  (1 = true; 0 = false)


```{r}
# Add all the extra data together

other <- rbind(cleveland, switzerland)
other<- rbind(other, longbeach)
other<- rbind(other, hungarian)


# delete repeated rows
other<-distinct(other)

# formatting
other$id<-NULL
other$ccf<-NULL
other$painloc<-NULL
other$dummy<-NULL
other$lvx1<-NULL
other$lvx2<-NULL
other$lvx3<-NULL
other$lvx4<-NULL
other$cathef<-NULL
other$junk<-NULL

# change age to numeric, then delete incorrect rows
other$age<- as.numeric(other$age)

# change sex to factor form
other$sex[other$sex == 1]<- "Male"
other$sex[other$sex == 0]<- "Fmale"
other$sex<-as.factor(other$sex)

# change painexer
# 9 is the NA value
other$painexer[other$painexer == 9]<- NA
# 1=Y 0=N
other$painexer[other$painexer == 1]<- "Y"
other$painexer[other$painexer == 0]<- "N"

# rename some columns
#HTN  =hypertension- blood pressure above 130/80 - 140/90mmgg(mayo clinic definition)

other <- other %>% rename(Exertional.CP= painexer, Age=age, Sex=sex, HTN=htn)

#Typical.Chest.Pain -derive from cp=value 1
other$Typical.Chest.Pain <- 0
other$Typical.Chest.Pain[other$cp == 1]<- 1

# Atypical                  derive from cp value 2
other$Atypical<- 0
other$Atypical[other$cp == 2]<- 1

#BP                        blood pressure- most likely trestbps
other <- other %>% rename(BP=trestbps)
#Current.Smoker            smoke 1 = yes; 0 = no 
other <- other %>% rename(Current.Smoker=smoke)

# Cath  Cad or Normal        =          num Value 0: < 50% diameter narrowing, Value 1: > 50% diameter narrowing
# most of the num values are not 1 or 0? I am choosing to delete those rows
other$Cath<- 0
# if not 1 or 0 set to NA
other$Cath[other$num>1]<-NA
other$Cath[other$num==0]<- "Normal"
other$Cath[other$num==1]<- "Cath"

# select the columns of the other data sets to use
suplementary<- other %>%select(Sex, Age, Exertional.CP, HTN, Atypical, Typical.Chest.Pain, BP, Current.Smoker, fbs, Cath)

# change the z sani data set to the form in the comment above
# fbs (fasting blood sugar > 120 mg/dl)  (1 = true; 0 = false)
z2<-z
z2$fbs<-0
z2$fbs[z2$FBS>120]<-1


# select the columns
z3 <- select(z2, Sex, Age, Exertional.CP, HTN, Atypical, Typical.Chest.Pain, BP, Current.Smoker, fbs, Cath)
# join the two sets
# s=factor age=num ext=factor htn=num (change to fact) atyp=factor typ=num (change fac) bp=num current=factor fbs=num (fac) Cath=factor
z3$HTN<-as.factor(z3$HTN)
z3$Typical.Chest.Pain<- as.factor(z3$Typical.Chest.Pain)
z3$fbs<- as.factor(z3$fbs)

# supplementary sex remove invalid
 

combined<- rbind(z3, suplementary)
```
We will not use these data sets as there are too many missing values and some important variables are not there.

# Additional unused code relating to UI

#Show variable summary on Data Overview page
getVariableSummary <- function(var){
  varName = variables[var]
  value = eval(parse(text = varName))
  # CHANGE FOR THOSE WITH NO MIN/MAX ELIGIBLE VALUES
  variable_summary = data.frame("Min"=round(min(value), digits=2), "Max"=round(max(value), digits=2), "Mean"=round(mean(value), digits=2), "Median"=round(median(value), digits=2))
  return(variable_summary)
}

#Static violin model showing gender distribution/HD
fig <- data %>%
  plot_ly(type = 'violin') 
fig <- fig %>%
  add_trace(
    x = ~Cath[data$Sex == 'Male'],
    y = ~Age[data$Sex == 'Male'],
    ylim(0,1),
    legendgroup = 'Yes',
    scalegroup = 'Yes',
    name = 'Male',
    side = 'negative',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    ),
    color = I("blue")
  ) 
fig <- fig %>%
  add_trace(
    x = ~Cath[data$Sex == 'Fmale'],
    y = ~Age[data$Sex == 'Fmale'],
    ylim(0,1),
    legendgroup = 'No',
    scalegroup = 'No',
    name = 'Female',
    side = 'positive',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    ),
    color = I("green")
  ) 

fig <- fig %>%
  layout(
    xaxis = list(
      title = ""  
    ),
    yaxis = list(
      title = "",
      zeroline = F
    ),
    violingap = 0,
    violingroupgap = 0,
    violinmode = 'overlay'
  )

#### original scatterplot of continuous variables ####
za_cont <- data.frame(Age, Weight, Length, BMI, BP, PR, CR, TG, LDL,
                      HDL, BUN, ESR, HB, K, Na, WBC, Lymph)

pearson_cor_func <- function(var_1, var_2) {
  #correlate
  cor_result <- cor.test(var_1, var_2, method = 'pearson')
  #make an interactive plot
  fig <- plot_ly(data = za_cont,
                 x = ~var_1,
                 y = ~var_2,
                 type = 'scatter',
                 text = ~paste('Variable 1:', var_1, '<br>Variable 2:', var_2), 
                 size = ~var_1)
  #return results
  result_list <- list('result' = cor_result,'int_plot' = fig)
  return(result_list)
}

pearson_cor_func(Age, Weight)

ggscatter(za, x = "Weight", y = "BMI", add = 'reg.line', 
                       conf.int = TRUE, cor.coef = TRUE, cor.methods = 'pearson',
                       xlab = 'Weight', ylab = 'BMI')

#### original bar plot of binary variables, split between healthy and heart disease ####
library(plotly)
#library(dpylr)
attach(za)

yes_cath <- filter(za, Cath == 'Cad')
no_cath <- filter(za, Cath == 'Normal')

yes_small <- data.frame(yes_cath$DM,yes_cath$Current.Smoker,yes_cath$EX.Smoker,yes_cath$FH,yes_cath$Obesity,yes_cath$CRF,yes_cath$CVA,
                       yes_cath$Airway.disease,yes_cath$Thyroid.Disease,yes_cath$CHF,yes_cath$DLP,yes_cath$Edema,yes_cath$Weak.Peripheral.Pulse,
                      yes_cath$Lung.rales,yes_cath$Systolic.Murmur,yes_cath$Diastolic.Murmur,yes_cath$Typical.Chest.Pain,yes_cath$Dyspnea,
                       yes_cath$Atypical,yes_cath$Nonanginal,yes_cath$Exertional.CP,yes_cath$LowTH.Ang,yes_cath$Q.Wave,yes_cath$St.Elevation,
                       yes_cath$St.Depression,yes_cath$Tinversion,yes_cath$LVH,yes_cath$Poor.R.Progression,yes_cath$BBB)
                        
no_small <- data.frame(no_cath$DM,no_cath$Current.Smoker,no_cath$EX.Smoker,no_cath$FH,no_cath$Obesity,no_cath$CRF,no_cath$CVA,
                       no_cath$Airway.disease,no_cath$Thyroid.Disease,no_cath$CHF,no_cath$DLP,no_cath$Edema,no_cath$Weak.Peripheral.Pulse,
                       no_cath$Lung.rales,no_cath$Systolic.Murmur,no_cath$Diastolic.Murmur,no_cath$Typical.Chest.Pain,no_cath$Dyspnea,
                       no_cath$Atypical,no_cath$Nonanginal,no_cath$Exertional.CP,no_cath$LowTH.Ang,no_cath$Q.Wave,no_cath$St.Elevation,
                       no_cath$St.Depression,no_cath$Tinversion,no_cath$LVH,no_cath$Poor.R.Progression,no_cath$BBB)

new <- merge(data.frame(yes_small, row.names = NULL), data.frame(no_small, row.names = NULL), by = 0, all = TRUE)[-1]

Variables <- c('DM','Current.Smoker','EX.Smoker','FH','Obesity','CRF','CVA',
          'Airway.disease','Thyroid.Disease','CHF','DLP','Edema','Weak.Peripheral.Pulse',
          'Lung.rales','Systolic.Murmur','Diastolic.Murmur','Typical.Chest.Pain','Dyspnea',
          'Atypical','Nonanginal','Exertional.CP','LowTH.Ang','Q.Wave','St.Elevation',
          'St.Depression','Tinversion','LVH','Poor.R.Progression','BBB')

yes_vars <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29)
no_vars <- c(30,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59)

plot_data <- data.frame(vars, yes_vars, no_vars)
fig <- plot_ly(plot_data, x = ~Variables, y = ~yes_vars, type = 'bar', name = 'Heart Disease')
fig <- fig %>% add_trace(y = ~no_vars, name = 'Healthy')
fig <- fig %>% layout(yaxis = list(title = 'Total Number'), barmode = 'group')

fig

#### testing regression + interaction models for some initial exploration ####
#regression models
library(ggplot2)
library(car)
library(QuantPsyc)
library(lmSupport)
library(psych)
library(haven)
library(rockchalk)

#change cath to factor
z$Cath<-as.factor(z$Cath)

####simple model####
#lm(dependent variable ~ independent variable)
simple_reg <- lm(z$BP~z$Typical.Chest.Pain)

par(mfrow = c(2,2))
plot(simple_reg)

dwt(simple_reg)

summary(simple_reg, confint = TRUE)

#plot with regression line using coefficients
par(mfrow = c(1,1))
plot(z$Typical.Chest.Pain, z$BP)
abline(lm(z$BP~z$Typical.Chest.Pain))

####interaction model####
z$Cath <- to_factor(z$Cath)
z$Cath <-as.numeric(z$Cath)

interact_reg <- lm(Cath ~ BP*Typical.Chest.Pain, data = z)

par(mfrow = c(2,2))
plot(interact_reg)

dwt(interact_reg)
vif(interact_reg)

summary(interact_reg, confint = TRUE)
lm.beta(interact_reg)
lm.sumSquares(interact_reg)

#plot 
par(mfrow = c(1,1))

#library(sjPlot)
#library(sjmisc)
#theme_set(theme_sjplot())
#plot_model(interact_reg, type = 'pred')

plotSlopes(interact_reg, plotx = "BP", modx = "Typical.Chest.Pain", modxVals = "std.dev", main = 'simple slopes plot')

#interaction.plot(z$BP, z$Typical.Chest.Pain, z$Cath)
