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
      Age=as.numeric(input$userAge_basic), 
      Weight=as.numeric(input$userWeight_basic),
      Length=as.numeric(input$userHeight_basic), 
      Sex=toString(getGender(input$userSex_basic)),
      BMI=calculateBMI(input$userWeight_basic, input$userHeight_basic),
      DM=0, HTN=as.numeric(changeValues(input$htn_basic)), 
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_basic, "Ex.Smoker")),
      FH=0, Obesity=isObese(calculateBMI(input$userWeight_basic, input$userHeight_basic)),
      CRF= "N", CVA="N", Airway.disease= "N", Thyroid.Disease= "N", CHF= "N", DLP= "N",
      BP=as.numeric(input$userBP_basic), PR=as.numeric(input$userPR_basic), Edema= 0, 
      Weak.Peripheral.Pulse= "N", Lung.rales= "N", Systolic.Murmur="N", Diastolic.Murmur="N",
      Typical.Chest.Pain= as.numeric(changeValues(input$typicalchestpain_basic)),
      Dyspnea= "Y", Function.Class=0, Atypical= "Y", Nonanginal= "N", 
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
  # set exertional.cp, lowth.ang and CHF to "N" as there was limited data for these variables
  # set CRF, airway.disease, weak.peripheral.pulse and poor.r.progression to 'N' (these variables were less important)
  observeEvent(input$getResults_advanced, {
    userDataAdvanced <- data.frame(
      Age=input$userAge_advanced, 
      Weight=input$userWeight_advanced,
      Length=as.numeric(input$userHeight_advanced), 
      Sex=getGender(input$userSex_advanced),
      BMI=calculateBMI(input$userWeight_advanced, input$userHeight_advanced),
      DM=as.numeric(input$dm_advanced), 
      HTN=as.numeric(changeValues(input$htn_advanced)),
      Current.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Current.Smoker")),
      Ex.Smoker=as.numeric(getSmokingStatus(input$smoker_advanced, "Ex.Smoker")),
      FH=as.numeric(changeValues(input$fh_advanced)), 
      Obesity= isObese(calculateBMI(input$userWeight_advanced, input$userHeight_advanced)), 
      CRF= "N", 
      CVA=str_sub(input$cva_advanced, 1, 1),
      Airway.disease= "N", 
      Thyroid.Disease= str_sub(input$thyroidDisease, 1, 1),
      CHF= "N", 
      DLP= str_sub(input$dlp_advanced, 1, 1), 
      BP=as.numeric(input$userBP_advanced), 
      PR=as.numeric(input$userPR_advanced), 
      Edema= changeValues(input$edema), 
      Weak.Peripheral.Pulse= "N",
      Lung.rales= str_sub(input$lungRales, 1, 1), 
      Systolic.Murmur= str_sub(input$systolicMurmur, 1, 1),
      Diastolic.Murmur=str_sub(input$diastolicMurmur, 1, 1),
      Typical.Chest.Pain= changeValues(input$typicalCP), 
      Dyspnea= str_sub(input$dyspnea, 1, 1),
      Function.Class=as.numeric(input$function_class), 
      Atypical= str_sub(input$atypical, 1, 1), 
      Nonanginal= str_sub(input$nonanginal, 1, 1), 
      Exertional.CP="N", 
      LowTH.Ang= "N",
      Q.Wave=changeValues(input$Qwave), 
      St.Elevation=changeValues(input$st.elevation),
      St.Depression= changeValues(input$st.depression), 
      Tinversion= changeValues(input$tinversion), 
      LVH= str_sub(input$lvh, 1, 1),
      Poor.R.Progression= "N", 
      BBB=getBBB(input$bbb),  
      FBS= as.numeric(input$fbs), 
      CR=as.numeric(input$cr), 
      TG=as.numeric(input$tg),
      LDL=as.numeric(input$ldl), 
      HDL=as.numeric(input$hdl), 
      BUN=as.numeric(input$bun), 
      ESR= as.numeric(input$esr), 
      HB= as.numeric(input$hb), 
      K= as.numeric(input$k), 
      Na= as.numeric(input$Na),
      WBC= as.numeric(input$wbc), 
      Lymph=as.numeric(input$lymph),  
      Neut=as.numeric(input$neut), 
      PLT= as.numeric(input$plt), 
      EF.TTE= as.numeric(input$ef.tte),  
      Region.RWMA=as.numeric(input$region.rwma), 
      #VHD=getVHD(input$vhd) # this line makes it crash :O
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
