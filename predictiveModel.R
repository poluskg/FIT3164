#Predictive Function:
getPrediction <- function() {
  return("YOU HAVE HEART DISEASE")
}

#Top Variables:
#Age
userAge = sliderInput("userAge", "Select Age", min=30, max=100, value=50, step=1)

#Weight
userWeight = numericInput("userWeight", "Enter Weight (Kg)", value=35, min=35, max=400, step=1)

#Height
userHeight = numericInput("userHeight", "Enter Height (cm)", value=100, min=100, max=250, step=1)

#Sex
userSex = radioButtons(inputId="userSex", label="Sex:", choices=c("Male", "Female"), inline=T)

#BMI
calculateBMI <- function(w, h) {
  bmi = w/((h/100)^2)
  return(bmi)
}

#Blood Pressure
userBP = numericInput("userBP", "Enter Blood Pressure", value=60, min=60, max=200, step=1)

#Obesity
isObese <- function(a) {
  if (a) {
    return("Y")
  } else {
    return("N")
  }
}

#PR
userPR = numericInput("userPR", "Enter PR", value=60, min=60, max=200, step=1)

#DM

#HTN
smoker = radioButtons("smoker", "Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))

#FH

#<------Advanced Option------>#
#CRF

#CVA

#Airway Disease
airwayDisease = radioButtons("airwayDisease", "Airway Disease:", choices=c("Yes", "No"))

#Thyroid Disease
thyroidDisease = radioButtons("thyroidDisease", "Thyroid Disease:", choices=c("Yes", "No"))

#DLP

#Edema
edema = radioButtons("edema", "Edema:", choices=c("Yes", "No"))

#Weak Peripheral Pulse
weakPeripheralPulse = radioButtons("weakPeripheralPulse", "Weak Peripheral Pulse:", choices=c("Yes", "No"))

#Lung Rales
lungRales = radioButtons("lungRales", "Lung Rales:", choices=list("Yes", "No"))

#Systolic Murmur
systolicMurmur = radioButtons("systolicMurmur", "Systolic Murmur", choices=c("Yes", "No"))

#Diastolic Murmur
diastolicMurmur = radioButtons("diastolicMurmur", "Diastolic Murmur", choices=c("Yes", "No"))

#Function.Class
chestPainType = radioButtons("chestPainType", "Chest Pain Type:", choices=c("1", "2", "3", "4"))

#Atypical
atypical = radioButtons("atypical", "Atypical:", choices=c("Yes", "No"))

#Nonanginal
nonanginal = radioButtons("nonanginal", "Nonanginal:", choices=c("Yes", "No"))

#Exertional.CP
#radioButtons("", "", choices=c("Yes", "No"))

#LowTH.Ang
#radioButtons("", "", choices=c("Yes", "No"))

#Q.Wave
#radioButtons("", "", choices=c("Yes", "No"))

#St.Elevation
#adioButtons("", "", choices=c("Yes", "No"))

#St.Depression
#radioButtons("", "", choices=c("Yes", "No"))

#Tinversion
#radioButtons("", "", choices=c("Yes", "No"))

#LVH
#radioButtons("", "", choices=c("Yes", "No"))

#Poor.R.Progression
#radioButtons("", "", choices=c("Yes", "No"))

#BBB

#FBS

#CR

#TG

#LDL

#HDL

#ESR

#HB

#Potassium (K)

#Sodium (Na)

#WBC

#Lymph

#Neut

#PLT

#EF.TTE

#Region.RWMA

#VHD