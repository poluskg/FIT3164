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