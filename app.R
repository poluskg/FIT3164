library(shiny)

data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

attach(data)

ui <- dashboardPage(
  header <- dashboardHeader(),
  sidebar <- dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Overview", tabName = "overview"),
      menuItem("Variable Importance", tabName = "variableImportance"),
      menuItem("Static Models", tabName = "staticModels"),
      menuItem("Predictive Models", tabName = "predictiveModels"),
      menuItem("Acknowledgements", tabName = "acknowledgements")
    )
  ),
  body <- dashboardBody(
    tabItems(
      tabItem("overview",
              div(p("Heart Disease"))
      ),
      tabItem("variableImportance",
              div(p("Select a variable to view its description and its impact on predictive diagnosis of heart disease."),
              selectInput("var", "Choose a Variable:",
                          list("Age"="Age", "Weight (kg)"="Weight", "Height (cm)"="Length", "Sex"="Sex", "BMI"="BMI", 
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
                          )
              )
      ),
      tabItem("staticModels",
              "Static Models"
      ),
      tabItem("predictiveModels",
              "Predictive Model"
      ),
      tabItem("acknowledgements",
              "Resources"
      )
    )
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
