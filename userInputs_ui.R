#Derive BMI input
calculateBMI <- function(w, h) {
  bmi = w/((h/100)^2)
  return(bmi)
}

#Derive Obesity input
# BMI of 30+ is obese (source: heart foundation)
isObese <- function(a) {
  if (a >= 30.0) {
    return("Y")
  } else {
    return("N")
  }
}

#Derive Gender input
getGender <- function(a) {
  if (a == "Female") {
    return("Fmale")
  } else {
    return(a)
  }
}

#Derive Smoker value
getSmokingStatus <- function(user_input, var_name) {
  if (substr(user_input, 1, 2) == substr(var_name, 1, 2)) {
    return(1)
  } else {
    return(0)
  }
}

# Change Yes/No to 1 or 0
changeValues<- function(htn_advanced){
  if (htn_advanced=="Yes"){
    return(1)
  }
  else{
    return(0)
  }
}

# convert BBB
getBBB <- function(bbb) {
  if (substr(bbb, 1, 1) == "L") {
    return("LBBB")
  } else if (substr(bbb, 1, 1) == "R"){
    return("RBBB")
  } else{
    return("N")
  }
}

#DM
#FH
#<------Advanced Option------>#
#CVA
#DLP
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