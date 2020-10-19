#age1 <- readline(userAge)
#weight1<-readline(prompt="Weight: ")
#length1<-readline(prompt="Height in cm: ")
#bmi1<-readline(prompt="BMI: ")
# means from FBS
userdata <- data.frame(
  Age = as.numeric(userAge),
  Weight = as.numeric(userWeight),
  Length = as.numeric(userHeight),
  Sex = toString(userSex)
  )
  #BMI = as.numeric(bmi1),
  #DM = 0,
  #HTN = 0,
  #Current.Smoker = "0",
  #Ex.Smoker = "1",
  #FH = 0, Obesity = "N", CRF= "N", CVA="N", Airway.disease= "N", Thyroid.Disease= "N", CHF= "N", DLP= "N", BP=as.numeric(140), PR=as.numeric(70), Edema= 0, Weak.Peripheral.Pulse= "N", Lung.rales= "N", Systolic.Murmur= "N", Diastolic.Murmur="N", Typical.Chest.Pain= 0, Dyspnea= "Y", Function.Class=0, Atypical= "Y", Nonanginal= "N", Exertional.CP="N", LowTH.Ang= "N", Q.Wave=0, St.Elevation=0, St.Depression= 0, Tinversion= 0, LVH= "N", Poor.R.Progression= "N", BBB="LBBB", FBS= 119, CR=1, TG=150, LDL=105, HDL=40.2,  BUN=17.5, ESR= 19.5, HB=13.1, K=4.2, Na= 141,WBC= 7562,  Lymph=31, Neut=60, PLT= 221, EF.TTE= 47, Region.RWMA=0, VHD= "mild")
# make sure column names are the same
#names(userdata) <- names(z[2,-56])
# bind the row of user data to one row from the original data set so that it inherits the factor levels
#userdata<-rbind(z[2,-56], userdata)
# predict the outcome
prediction <- predict(bagmodel, userdata[2,])
# Print Response
ifelse(prediction=="Normal", "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.", "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional.")
