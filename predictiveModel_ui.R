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
               div(radioButtons(inputId="weakPeripheralPulse", label="Weak Peripheral Pulse:", choices=c("Yes", "No")))
             ),
             column(4,
               div(numericInput(inputId="userWeight_advanced", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
               div(numericInput(inputId="userBP_advanced", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
               div(numericInput(inputId="userPR_advanced", label="Enter Heart Rate (BPM)", value=60, min=60, max=200, step=1)),
               div(radioButtons(inputId="systolicMurmur",label= "Systolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="diastolicMurmur", label="Diastolic Murmur", choices=c("Yes", "No"))),
               div(radioButtons(inputId="lungRales", label="Lung Rales:", choices=list("Yes", "No")))
             ),
             column(4,
               div(radioButtons(inputId="smoker_advanced", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker"))),
               div(radioButtons(inputId="airwayDisease_advanced", label="Airway Disease:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="atypical", label="Atypical Chest Pain:", choices=c("Yes", "No"))),
               div(radioButtons(inputId="nonanginal", label="Nonanginal Chest Pain:", choices=c("Yes", "No")))
             ),
             actionButton(
               inputId="getResults_advanced",
               label="GET RESULTS",
               style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
             ),
             tags$br(),
             tags$b(textOutput("result_advanced"))
          )
