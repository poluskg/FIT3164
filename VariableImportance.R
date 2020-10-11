attach(data)
variables = c("Age"="Age", "Weight (kg)"="Weight", "Height (cm)"="Length", "Sex"="Sex", "BMI"="BMI", 
     "DM"="DM", "HTN"="HTN", "Current Smoker"="Current.Smoker", "Ex Smoker"="EX.Smoker", 
     "FH"="FH", "Obesity"="Obesity", "CRF"="CRF", "CVA"="CVA", 
     "Airway Disease"="Airway.disease", "Thyroid Disease"="Thyroid.Disease", "CHF"="CHF", 
     "DLP"="DLP", "Blood Pressure"="BP", "PR"="PR", "Edema"="Edema", 
     "Weak Peripheral Pulse"="Weak.Peripheral.Pulse", "Lung Rales"="Lung.rales", 
     "Systolic Murmur"="Systolic.Murmur", "Diastolic Murmur"="Diastolic.Murmur", 
     "Function.Class"="Function.Class", "Atypical"="Atypical", "Nonanginal"="Nonanginal", 
     "Exertional.CP"="Exertional.CP", "LowTH.Ang"="LowTH.Ang", "Q.Wave"="Q.Wave", 
     "St.Elevation"="St.Elevation", "St.Depression"="St.Depression", 
     "Tinversion"="Tinversion", "LVH"="LVH","Poor.R.Progression"="Poor.R.Progression", 
     "BBB"="BBB", "FBS"="FBS", "CR"="CR", "TG"="TG", "LDL"="LDL", "HDL"="HDL", "ESR"="ESR", 
     "HB"="HB", "Potassium (K)"="K", "Sodium (Na)"="Na", "WBC"="WBC", "Lymph"="Lymph", 
     "Neut"="Neut", "PLT"="PLT", "EF.TTE"="EF.TTE", "Region.RWMA"="Region.RWMA", 
     "VHD"="VHD", "Cath"="Cath")
        
variablesList = c("Age", "Weight (kg)", "Height (cm)", "Sex", "BMI", "DM", "HTN", 
                  "Current Smoker", "Ex Smoker", "FH", "Obesity", "CRF", "CVA", 
                  "Airway Disease", "Thyroid Disease", "CHF", "DLP", "Blood Pressure", 
                  "PR", "Edema", "Weak Peripheral Pulse", "Lung Rales", "Systolic Murmur", 
                  "Diastolic Murmur", "Function.Class", "Atypical", "Nonanginal", 
                  "Exertional.CP", "LowTH.Ang", "Q.Wave", "St.Elevation", "St.Depression", 
                  "Tinversion", "LVH","Poor.R.Progression", "BBB", "FBS", "CR", "TG", "LDL",
                  "HDL", "ESR", "HB", "Potassium (K)", "Sodium (Na)", "WBC", "Lymph", 
                  "Neut", "PLT", "EF.TTE", "Region.RWMA", "VHD", "Cath")

definition = c("Ageasdfasdf", "Weightsddddd (kg)", "Heiasdfasdfasdfasdght (cm)", 
               "Seasdfasdfasdfax", "BMsdfgh sdfghjgfdsfghjI", "DMdsfghgfdsa", "HasdfghjkjhgfdsTN", 
               "Currentasdfasdfas Smoker", "Easdfasdfasdfasdfa asdfafasdfx Smoasdfasdasdfasdfasdfker", 
               "asdfasdfasdfasdfasdfFH", "Obe asdf asdf asdf asdfasdfasdfasdfassity", 
               "CRF asdasdfadsfa asdfasdfasdfwergehtjkujhgfd dfghjyujhtfg sdfghtyh fgdsaf", 
               "Casf asdf adfakdjhfaldskfjhal djfal jadshlf jalsd alsdjf alsjd laskjhf las VA",
               NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
               NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

varDefinition = data.frame(variablesList, definition)
varDefinition

getDefinition <- function(var){
    errorMessage = "Sorry, we couldn't find a definition for that."
    for (i in range(1, length(varDefinition))) {
        if(varDefinition$variablesList[i] == var)
            return(toString(varDefinition$definition[i]))
        else return(errorMessage)
    }
}
