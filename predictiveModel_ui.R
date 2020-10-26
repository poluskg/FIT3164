#FILENAME: predictiveModel_ui.R
#PURPOSE: Store ui text/text-style for the two model types 'basic' and 'advanced'.
#         Include placeholder values and input limits for each input


#Define the inputs which will appear with the 'basic' model selection.
# The user inputs are forced to be within certain ranges to satisfy robustness
basic <- fluidRow(
          column(4, h4(tags$b("General Information:")),
              numericInput(inputId="userAge_basic", label="Select Age", min=30, max=100, value=50, step=1),
              numericInput(inputId="userWeight_basic", label="Enter Weight (Kg)", value=73, min=35, max=400, step=1),
              numericInput(inputId="userHeight_basic", label="Enter Height (cm)", value=164, min=100, max=250, step=1),
              radioButtons(inputId="userSex_basic", label="Sex:", choices=c("Male", "Female"), inline=T),
              radioButtons(inputId="smoker_basic", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))
          ),
          column(4, h4(tags$b("Heart and Chest Information:")),
              radioButtons(inputId="typicalchestpain_basic", label="Typical chest pain:", choices=c("Yes", "No")),
              numericInput(inputId="userBP_basic", label="Enter Blood Pressure", value=60, min=60, max=200, step=1),
              numericInput(inputId="userPR_basic", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1),
              radioButtons(inputId="htn_basic", label="Hypertension:", choices=c("Yes", "No"))
          ),
          div(
            actionButton(
              inputId="getResults_basic",
              label="GET RESULTS",
              style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
            )
          ),
          tags$br(tags$b(textOutput("result_basic")))
        )

#Define the inputs which will appear with the 'advanced' model selection.
advanced <- div(fluidRow(
              column(4, h4(tags$b("General Information:")),
               sliderInput(inputId="userAge_advanced", label="Select Age", min=30, max=100, value=50, step=1),
               numericInput(inputId="userWeight_advanced", label="Enter Weight (Kg)", value=73, min=35, max=400, step=1),
               numericInput(inputId="userHeight_advanced", label="Enter Height (cm)", value=164, min=100, max=250, step=1),
               radioButtons(inputId="userSex_advanced", label="Sex:", choices=c("Male", "Female"), inline=T),
               radioButtons(inputId="smoker_advanced", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))
              ),
              column(4, h4(tags$b("Chest Pain:")),
                radioButtons(inputId="nonanginal", label="Non anginal Chest Pain:", choices=c("Yes", "No")),
                radioButtons(inputId="typicalCP", label="Typical Chest Pain:", choices=c("Yes", "No")),
                radioButtons(inputId="atypical_advanced", label="Atypical Chest Pain:", choices=c("Yes", "No")),
                radioButtons(inputId="dyspnea", label="Dyspnea (shortness of breath):", choices=c("Yes", "No"))
              ),
              column(4, h4(tags$b("Scroll down for more...")),
                img(src="downArrow.png", height=100, width=75)
              )
            ),
            fluidRow(
              column(4, h4(tags$b("Blood Health Information:")),
                radioButtons(inputId="dlp_advanced", label="High Lipids:", choices=c("Yes", "No")),
                sliderInput(inputId="esr", label="Erythrocyte sedimentation rate mm/h:", min=1, max=100, value=19.5, step=0.2),
                sliderInput(inputId="hb", label="Hemoglobin g/dl:", min=8, max=18, value=13.1, step=0.1),
                sliderInput(inputId="k", label="Potassium mEq/lit:", min=3, max=7, value=4.2, step=0.1),
                sliderInput(inputId="Na", label="Sodium mEq/lit:", min=120, max=160, value=140, step=1),
                sliderInput(inputId="wbc", label="White blood cell cells/ml:", min=3700, max=18000, value=7100, step=100),
                sliderInput(inputId="lymph", label="Lymphocyte %:", min=5, max=60, value=31, step=1),
                sliderInput(inputId="neut", label="Neutrophil %:", min=30, max=90, value=60, step=1),
                sliderInput(inputId="plt", label="Platelet 1000/ml:", min=20, max=800, value=221, step=1),
                sliderInput(inputId="ef.tte", label="Ejection fraction %", min=10, max=60, value=47, step=1),
                sliderInput(inputId="fbs", label="Fasting blood sugar mg/dl:", min=55, max=400, value=75, step=1),
                sliderInput(inputId="cr", label="Creatine mg/dl:", min=0.5, max=2.5, value=1, step=0.1),
                sliderInput(inputId="tg", label="Triglycerides mg/dl:", min=30, max=1050, value=122, step=1),
                sliderInput(inputId="ldl", label="Low density lipoprotein mg/dl:", min=15, max=250, value=100, step=1),
                sliderInput(inputId="hdl", label="High density lipoprotein mg/dl:", min=10, max=120, value=40, step=1),
                sliderInput(inputId="bun", label="Blood urea nitrogen mg/dl:", min=5, max=60, value=16, step=1)
              ),
              column(4, h4(tags$b("Heart Health Information:")),
                numericInput(inputId="userBP_advanced", label="Enter Blood Pressure", value=129, min=60, max=200, step=1),
                numericInput(inputId="userPR_advanced", label="Enter Heart Rate (BPM)", value=75, min=60, max=200, step=1),
                radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No")),
                radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No")),
                radioButtons(inputId="htn_advanced", label="Hypertension:", choices=c("Yes", "No")),
                radioButtons(inputId="Qwave", label="ECG Abnormal Q waves recorded:", choices=c("Yes", "No")),
                radioButtons(inputId="lvh", label="ECG left ventricular hypertrophy:", choices=c("Yes", "No")),
                radioButtons(inputId="st.elevation", label="ECG high ST segment:", choices=c("Yes", "No")),
                radioButtons(inputId="st.depression", label="ECG low ST segment:", choices=c("Yes", "No")),
                radioButtons(inputId="tinversion", label="ECG abnormal T inversion:", choices=c("Yes", "No")),
                radioButtons(inputId="function_class", label="Function class (choose 0 if none/unknown):", choices=c("0", "1", "2", "3", "4")),
                radioButtons(inputId="region.rwma", label="Region with regional wall motion abnormality (choose 0 if none):", choices=c("0", "1", "2", "3", "4", "5")),       
                radioButtons(inputId="bbb", label="Bundle Branch Block:", choices=c("None", "Left", "Right"))
              ),
              column(4, h4(tags$b("Pre-Existing Conditions:")),
                radioButtons(inputId="thyroidDisease", label="Thyroid Disease:", choices=c("Yes", "No")),
                radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No")),
                radioButtons(inputId="fh_advanced", label="Family History of Cardiac Disease:", choices=c("Yes", "No")),
                radioButtons(inputId="crf_advanced", label="Kidney Failure:", choices=c("Yes", "No")),
                radioButtons(inputId="cva_advanced", label="Previous Stroke:", choices=c("Yes", "No")),
                radioButtons(inputId="chf_advanced", label="Congestive Heart Failure:", choices=c("Yes", "No")),
                radioButtons(inputId="edema", label="Edema:", choices=c("Yes", "No")),
                radioButtons(inputId="dm_advanced", label="Diabetic", choices=c("Yes", "No")),
                radioButtons(inputId="vhd", label="Valvular heart disease: ", choices=c("None", "Mild", "Moderate", "Severe"))
              ),
            ),
            div(
              actionButton(
               inputId="getResults_advanced",
               label="GET RESULTS",
               style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
              ),
              tags$br(tags$b(textOutput("result_advanced")))
            )
          )
