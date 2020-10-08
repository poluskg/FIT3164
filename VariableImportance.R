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

varDefinition = data.frame(variablesList, "definition"=c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", 
                                   "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", 
                                   "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", 
                                   "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", 
                                   "17","18", "19", "20", "21", "22", "23", "24", "25", "26",
                                   "27"))

getDefinition <- function(var){
    for (i in range(1, length(varDefinition))) {
        if(varDefinition$variablesList[i] == var)
            return(varDefinition$definition[i])
        }
}
