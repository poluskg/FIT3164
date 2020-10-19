userInput = c(1,2,3,"M",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,0,0,0,0,0,0,0,0,0,0)

updateInput <- function(pos, val) {
  userInput[pos] = val
}

#BMI
calculateBMI <- function(w, h) {
  bmi = w/((h/100)^2)
  return(bmi)
}

#Obesity
isObese <- function(a) {
  if (a) {
    return("Y")
  } else {
    return("N")
  }
}

#DM

#FH

#<------Advanced Option------>#
#CRF

#CVA

#Airway Disease
airwayDisease = radioButtons(inputId="airwayDisease", label="Airway Disease:", choices=c("Yes", "No"))

#Thyroid Disease
thyroidDisease = radioButtons(inputId="thyroidDisease", label="Thyroid Disease:", choices=c("Yes", "No"))

#DLP

#Edema
edema = radioButtons(inputId="edema", label="Edema:", choices=c("Yes", "No"))

#Weak Peripheral Pulse
weakPeripheralPulse = radioButtons(inputId="weakPeripheralPulse", label="Weak Peripheral Pulse:", choices=c("Yes", "No"))

#Lung Rales
lungRales = radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No"))

#Systolic Murmur
systolicMurmur = radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No"))

#Diastolic Murmur
diastolicMurmur = radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No"))

#Function.Class
chestPainType = radioButtons(inputId="chestPainType", label="Chest Pain Type:", choices=c("1", "2", "3", "4"))

#Atypical
atypical = radioButtons(inputId="atypical", label="Atypical:", choices=c("Yes", "No"))

#Nonanginal
nonanginal = radioButtons(inputId="nonanginal", label="Nonanginal:", choices=c("Yes", "No"))

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