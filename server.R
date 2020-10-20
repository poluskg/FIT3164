server <- function(input, output, session) {
  #DataOverview Page
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
  
  #VariableImportance Page
  output$var_definition <- renderText({
      getDefinition(input$var)
    }
  )
  
  output$var_summary <- renderTable({
      getVariableSummary(input$var)
    }
  )
  
  #PredictiveModel Page
  #Basic Model Prediction
  output$model_table <- renderTable({
    modelComparison
  })
  
  observeEvent(input$getResults_basic, {
    userDataBasic <- data.frame(
      Age=as.numeric(input$userAge_basic), Weight=as.numeric(input$userWeight_basic),
      Length=as.numeric(input$userHeight_basic), Sex=toString(getGender(input$userSex_basic)),
      BMI=calculateBMI(input$userWeight_basic, input$userHeight_basic), DM=0, HTN=0, 
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Ex.Smoker")),
      FH=0, Obesity=isObese(calculateBMI(input$userWeight_basic, input$userHeight_basic)),
      CRF= "N", CVA="N", Airway.disease= "N", Thyroid.Disease= "N", CHF= "N", DLP= "N",
      BP=as.numeric(input$userBP_basic), PR=as.numeric(input$userPR_basic), Edema= 0,
      Weak.Peripheral.Pulse= "N", Lung.rales= "N", Systolic.Murmur= "N", Diastolic.Murmur="N",
      Typical.Chest.Pain= 0, Dyspnea= "Y", Function.Class=0, Atypical= "Y", Nonanginal= "N", 
      Exertional.CP="N", LowTH.Ang= "N", Q.Wave=0, St.Elevation=0, St.Depression= 0, Tinversion= 0, 
      LVH= "N", Poor.R.Progression= "N", BBB="LBBB", FBS= 119, CR=1, TG=150, LDL=105, HDL=40.2, 
      BUN=17.5, ESR= 19.5, HB=13.1, K=4.2, Na= 141,WBC= 7562,  Lymph=31, Neut=60, PLT= 221, EF.TTE= 47, 
      Region.RWMA=0, VHD= "mild"
    )
    names(userDataBasic) <- names(z[2,-56])
    userDataBasic <- rbind(z[2,-56], userDataBasic)
    prediction <- predict(bagmodel, userDataBasic[2,])
    
    output$result_basic <- renderText({
      ifelse(prediction=="Normal", 
        "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.",
        "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional."
        )
      })
    }
  )
  
  #Advanced Model Prediction
  observeEvent(input$getResults_advanced, {
    userDataAdvanced <- data.frame(
      Age=as.numeric(input$userAge_advanced), Weight=as.numeric(input$userWeight_advanced),
      Length=as.numeric(input$userHeight_advanced), Sex=toString(getGender(input$userSex_advanced)),
      BMI=calculateBMI(input$userWeight_advanced, input$userHeight_advanced), DM=0, HTN=0,
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Ex.Smoker")),
      FH=0, Obesity= "N", CRF= "N", CVA="N", Airway.disease= "N", 
      Thyroid.Disease= "N", CHF= "N", DLP= "N", BP=as.numeric(input$userBP_basic), 
      PR=as.numeric(input$userPR_basic), Edema= 0, Weak.Peripheral.Pulse= "N", Lung.rales= "N", 
      Systolic.Murmur= "N", Diastolic.Murmur="N", Typical.Chest.Pain= 0, Dyspnea= "Y", 
      Function.Class=0, Atypical= "Y", Nonanginal= "N", Exertional.CP="N", LowTH.Ang= "N", 
      Q.Wave=0, St.Elevation=0, St.Depression= 0, Tinversion= 0, LVH= "N", Poor.R.Progression= "N", 
      BBB="LBBB", FBS= 119, CR=1, TG=150, LDL=105, HDL=40.2,  BUN=17.5, ESR= 19.5, HB=13.1, K=4.2, 
      Na= 141,WBC= 7562,  Lymph=31, Neut=60, PLT= 221, EF.TTE= 47, Region.RWMA=0, VHD= "mild"
    )
    names(userDataAdvanced) <- names(z[2,-56])
    userDataAdvanced <- rbind(z[2,-56], userDataAdvanced)
    prediction <- predict(bagmodel, userDataAdvanced[2,])
    
    output$result_advanced <- renderPrint({
      ifelse(prediction=="Normal", 
        "Your test result is normal. You most likely do not have coronary artery disease, but please see a doctor if you have any concerns.",
        "Your test result is Coronary artery disease. Please note that this test is not 100% accurate, and you can only be diagnosed by a medical professional."
        )
      })
    }
  )
}
