<<<<<<< HEAD
modelText <- div("A range of models were generated, altered and tested against the dataset.
                 The resulting accuracy of these models can be viewed in the table below.
                 The final selected model - used for the prediction outcome on the next page - 
                 was the Bagging model, which has a predictive accuracy of 81.31%.")

modelComparison <- matrix(c("59%", "75.82%", "79.12%", "79.1%", "80.2%", "81.31%",
                            0.6839, 0.7387, 0.7169, 0.7481, 0.7487, 0.796), ncol=6, byrow=TRUE)
rownames(modelComparison) <- c("Accuracy", "AUC/ROC")
colnames(modelComparison) <- c("Naive Bayes", "Decision Tree", "Random Forest", "XG2", "SVM Model", "Bagging Model")

basic <- div(
          column(4,
            div(sliderInput(inputId="userAge_basic", label="Select Age", min=30, max=100, value=50, step=1)),
            div(numericInput(inputId="userWeight_basic", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
            div(numericInput(inputId="userHeight_basic", label="Enter Height (cm)", value=100, min=100, max=250, step=1))
          ),
          column(4,
            div(radioButtons(inputId="userSex_basic", label="Sex:", choices=c("Male", "Female"), inline=T)),
            div(numericInput(inputId="userBP_basic", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
            div(numericInput(inputId="userPR_basic", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1))
          ),
          column(4,
            div(radioButtons(inputId="smoker_basic", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker")))
          ),
          actionButton(
            inputId="getResults_basic",
            label="GET RESULTS",
            style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
          ),
          tags$br(),
          tags$b(textOutput("result_basic"))
        )

advanced <- div(
             column(4,
               div(sliderInput(inputId="userAge_advanced", label="Select Age", min=30, max=100, value=50, step=1)),
               div(radioButtons(inputId="userSex_advanced", label="Sex:", choices=c("Male", "Female"), inline=T)),
               div(numericInput(inputId="userHeight_advanced", label="Enter Height (cm)", value=100, min=100, max=250, step=1)),
               div(radioButtons(inputId="thyroidDisease", label="Thyroid Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="edema", label="Edema:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="weakPeripheralPulse", label="Weak Peripheral Pulse:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="dm_advanced", label="Diabetic", choices=c("Yes", "No"))),
               div(radioButtons(inputId="lowTHAng_advanced", label="Early onset Angina:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="qWave_advanced", label="Normal Q Waves:", choices=c("Yes", "No")))
             ),
             column(4,
               div(numericInput(inputId="userWeight_advanced", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
               div(numericInput(inputId="userBP_advanced", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
               div(numericInput(inputId="userPR_advanced", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1)),
               div(radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No"))),
               div(radioButtons(inputId="dlp_advanced", label="High Lipids:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="exertionalCP_advanced", label="Exertional Chest Pain:", choices=c("Yes", "No")))
             ),
             column(4,
               div(radioButtons(inputId="smoker_advanced", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))),
               div(radioButtons(inputId="airwayDisease_advanced", label="Airway Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="atypical_advanced", label="Atypical Chest Pain:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="nonanginal_advanced", label="Nonanginal Chest Pain:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="htn_advanced", label="Hypertension:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="fh_advanced", label="Family History of Cardiac Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="crf_advanced", label="Kidney Failure:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="cva_advanced", label="Previous Stroke:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="chf_advanced", label="Congestive Heart Failure:", choices=c("Yes", "No")))
             ),
             actionButton(
               inputId="getResults_advanced",
               label="GET RESULTS",
               style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
             ),
             tags$br(),
             tags$b(textOutput("result_advanced"))
          )
=======
modelText <- div("A range of models were generated, altered and tested against the dataset.
                 The resulting accuracy of these models can be viewed in the table below.
                 The final selected model - used for the prediction outcome on the next page - 
                 was the Bagging model, which has a predictive accuracy of 81.31%.")

modelComparison <- matrix(c("59%", "75.82%", "79.12%", "79.1%", "80.2%", "81.31%",
                            0.6839, 0.7387, 0.7169, 0.7481, 0.7487, 0.796), ncol=6, byrow=TRUE)
rownames(modelComparison) <- c("Accuracy", "AUC/ROC")
colnames(modelComparison) <- c("Naive Bayes", "Decision Tree", "Random Forest", "XG2", "SVM Model", "Bagging Model")

# change basic to HTN, typical.chest.pain, 
basic <- div(
          column(4,
            div(sliderInput(inputId="userAge_basic", label="Select Age", min=30, max=100, value=50, step=1)),
            div(numericInput(inputId="userWeight_basic", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
            div(numericInput(inputId="userHeight_basic", label="Enter Height (cm)", value=100, min=100, max=250, step=1)),
            div(radioButtons(inputId="typicalchestpain_basic", label="Typical chest pain:", choices=c("Yes", "No")))
          ),
          column(4,
            div(radioButtons(inputId="userSex_basic", label="Sex:", choices=c("Male", "Female"), inline=T)),
            div(numericInput(inputId="userBP_basic", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
            div(numericInput(inputId="userPR_basic", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1)),
            div(radioButtons(inputId="htn_basic", label="Hypertension:", choices=c("Yes", "No")))
          ),
          column(4,
            div(radioButtons(inputId="smoker_basic", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker")))
          ),
          actionButton(
            inputId="getResults_basic",
            label="GET RESULTS",
            style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
          ),
          tags$br(),
          tags$b(textOutput("result_basic"))
        )

advanced <- div(
             column(4,
               div(sliderInput(inputId="userAge_advanced", label="Select Age", min=30, max=100, value=50, step=1)),
               div(radioButtons(inputId="userSex_advanced", label="Sex:", choices=c("Male", "Female"), inline=T)),
               div(numericInput(inputId="userHeight_advanced", label="Enter Height (cm)", value=100, min=100, max=250, step=1)),
               div(radioButtons(inputId="thyroidDisease", label="Thyroid Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="edema", label="Edema:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="dm_advanced", label="Diabetic", choices=c("Yes", "No")))
             ),
             column(4,
               div(numericInput(inputId="userWeight_advanced", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
               div(numericInput(inputId="userBP_advanced", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
               div(numericInput(inputId="userPR_advanced", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1)),
               div(radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No"))),
               div(radioButtons(inputId="dlp_advanced", label="High Lipids:", choices=c("Yes", "No")))
               
             ),
             column(4,
               div(radioButtons(inputId="smoker_advanced", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))),
               div(radioButtons(inputId="atypical_advanced", label="Atypical Chest Pain:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="htn_advanced", label="Hypertension:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="fh_advanced", label="Family History of Cardiac Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="crf_advanced", label="Kidney Failure:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="cva_advanced", label="Previous Stroke:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="chf_advanced", label="Congestive Heart Failure:", choices=c("Yes", "No")))
             ),
             column(4,
                div(radioButtons(inputId="typicalCP", label="Typical Chest Pain:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="dyspnea", label="Dyspnea (shortness of breath):", choices=c("Yes", "No"))),
                div(radioButtons(inputId="function_class", label="Function class:", choices=c("1", "2", "3", "4"))),
                div(radioButtons(inputId="atypical", label="Atypical Chest Pain:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="nonanginal", label="Non anginal Chest Pain:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="Qwave", label="ECG Abnormal Q waves recorded:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="st.elevation", label="ECG high ST segment:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="st.depression", label="ECG low ST segment:", choices=c("Yes", "No"))),
                div(radioButtons(inputId="tinversion", label="ECG abnormal T inversion:", choices=c("Yes", "No")))
                    
             ),
             column(4,
                    div(radioButtons(inputId="lvh", label="ECG left ventricular hypertrophy:", choices=c("Yes", "No"))),
                    div(radioButtons(inputId="bbb", label="Bundle Branch Block:", choices=c("None", "Left", "Right"))),
                    div(sliderInput(inputId="fbs", label="Fasting blood sugar mg/dl:", min=55, max=400, value=75, step=1)),
                    div(sliderInput(inputId="cr", label="Creatine mg/dl:", min=0.5, max=2.5, value=1, step=0.1)),
                    div(sliderInput(inputId="tg", label="Triglycerides mg/dl:", min=30, max=1050, value=122, step=1)),
                    div(sliderInput(inputId="ldl", label="Low density lipoprotein mg/dl:", min=15, max=250, value=100, step=1)),
                    div(sliderInput(inputId="hdl", label="High density lipoprotein mg/dl:", min=10, max=120, value=40, step=1)),
                    div(sliderInput(inputId="bun", label="Blood urea nitrogen mg/dl:", min=5, max=60, value=16, step=1))
             ),
             column(4,
                    div(sliderInput(inputId="esr", label="Erythrocyte sedimentation rate mm/h:", min=1, max=100, value=19.5, step=0.2)),
                    div(sliderInput(inputId="hb", label="Hemoglobin g/dl:", min=8, max=18, value=13.1, step=0.1)),
                    div(sliderInput(inputId="k", label="Potassium mEq/lit:", min=3, max=7, value=4.2, step=0.1)),
                    div(sliderInput(inputId="Na", label="Sodium mEq/lit:", min=120, max=160, value=140, step=1)),
                    div(sliderInput(inputId="wbc", label="White blood cell cells/ml:", min=3700, max=18000, value=7100, step=100)),
                    div(sliderInput(inputId="lymph", label="Lymphocyte %:", min=5, max=60, value=31, step=1))
             ),
             column(4,
                    div(sliderInput(inputId="neut", label="Neutrophil %:", min=30, max=90, value=60, step=1)),
                    div(sliderInput(inputId="plt", label="Platelet 1000/ml:", min=20, max=800, value=221, step=1)),
                    div(sliderInput(inputId="ef.tte", label="Ejection fraction %", min=10, max=60, value=47, step=1)),
                    div(radioButtons(inputId="region.rwma", label="Region with regional wall motion abnormality:", choices=c("0", "1", "2", "3", "4", "5"))),
                    div(radioButtons(inputId="vhd", label="Valvular heart disease: ", choices=c("None", "Mild", "Moderate", "Severe")))
             ),
             actionButton(
               inputId="getResults_advanced",
               label="GET RESULTS",
               style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
             ),
             tags$br(),
             tags$b(textOutput("result_advanced"))
          )
>>>>>>> ac6db7dd803f009bdac3c194dc2cdfc3bd7be5f9
