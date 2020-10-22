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
    return("Male")
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
changeValues<- function(a){
  if (a=="Yes"){
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

# convert VHD
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