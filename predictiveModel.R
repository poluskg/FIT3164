#Age
ageList = c(18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 
            43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67,
            68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92,
            93, 94, 95, 96, 97, 98, 99, 100)
varSelectInput("ageSelect", "Select Age", ageList)

#Weight
userWeight = numericInput("weightNI", "Enter Weight (Kg)", min=35, max=400, step=0.5)

#Height
userHeight = numericInput("heightNI", "Enter Height (cm)", min=100, max=250, step=0.5)

#Sex
radioButtons("sexRB", "Sex:", choiceValues=list("Male", "Female"))

#BMI
calculateBMI <- function(w, h) {
  bmi = w/((h/100)^2)
  return(bmi)
}

#DM

#HTN

#Current Smoker
radioButtons("cSmokerRB", "Current Smoker:", choiceValues=list("Yes", "No"))

#Ex Smoker
radioButtons("xSmokerRB", "Ex Smoker:", choiceValues=list("Yes", "No"))

#FH

#Obesity
isObese <- function(a) {
  if (a) {
    return("Y")
  } else {
    return("N")
  }
}

#CRF

#CVA

#Airway Disease
radioButtons("adRB", "Airway Disease:", choiceValues=list("Yes", "No"))

#Thyroid Disease
radioButtons("tdRB", "Thyroid Disease:", choiceValues=list("Yes", "No"))

#DLP

#Blood Pressure
userBP = numericInput("bpNI", "Enter Blood Pressure", min=60, max=200, step=1)

#PR
userPR = numericInput("prNI", "Enter PR", min=60, max=200, step=1)

#Edema
radioButtons("", "", choiceValues=list("Yes", "No"))
#Weak Peripheral Pulse
radioButtons("", "", choiceValues=list("Yes", "No"))
#Lung Rales
radioButtons("", "", choiceValues=list("Yes", "No"))
#Systolic Murmur
radioButtons("", "", choiceValues=list("Yes", "No"))
#Diastolic Murmur
radioButtons("", "", choiceValues=list("Yes", "No"))
#Function.Class
radioButtons("cpRB", "Chest Pain Type:", choiceValues=list("1", "2", "3", "4"))
#Atypical
radioButtons("", "", choiceValues=list("Yes", "No"))
#Nonanginal
radioButtons("", "", choiceValues=list("Yes", "No"))
#Exertional.CP
radioButtons("", "", choiceValues=list("Yes", "No"))
#LowTH.Ang
radioButtons("", "", choiceValues=list("Yes", "No"))
#Q.Wave
radioButtons("", "", choiceValues=list("Yes", "No"))
#St.Elevation
radioButtons("", "", choiceValues=list("Yes", "No"))
#St.Depression
radioButtons("", "", choiceValues=list("Yes", "No"))
#Tinversion
radioButtons("", "", choiceValues=list("Yes", "No"))
#LVH
radioButtons("", "", choiceValues=list("Yes", "No"))
#Poor.R.Progression
radioButtons("", "", choiceValues=list("Yes", "No"))
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