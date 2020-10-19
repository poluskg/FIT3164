source("ui_helper.R")

header <- dashboardHeader()
sidebar <- dashboardSidebar(
  sidebarMenu(
    id = "tabs",
    menuItem("Introduction", tabName = "introduction"),
    menuItem("Data Overview", tabName = "dataOverview"),
    menuItem("Predictive Model", tabName = "predictiveModel"),
    menuItem("Acknowledgements", tabName = "acknowledgements")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("introduction",
      div(h1("Heart Disease", align="center")),
      div(p(overviewText1, align="center")),
      br(HTML('<center><img src="heartImage.png" width="400"></center>')),
      br(div(p(overviewText2, align="center"))),
      br(div(p(overviewText3, align="center")))
    ),
    tabItem("dataOverview",
      h1("Overview"),
      h3("Below is a summary of the dataset used in this application:"),
      column(3, valueBoxOutput("DataTotBox", width=100)),
      column(3, valueBoxOutput("DataVarBox", width=100)),
      column(3, valueBoxOutput("DataMaleBox", width=100)),
      column(3, valueBoxOutput("DataFmaleBox", width=100)),
      h4(p("To understand the data in more detail, select a variable to view its definition:")),
      div(
        selectInput("var",
          label = "Select a Variable:",
          choices = variablesList
        )
      ),
      textOutput("var_definition"),
      div("Below are the summary statistics of the variable:"),
      tableOutput("var_summary"),
      tags$head(tags$style("#var_definition {
                           color: black;
                           font-size: 20px;
                           font-style: bold;
                            }"
                          )
                )
    ),
    tabItem("predictiveModel",
      h3("Enter the following information then click", tags$b('Get Results'), "to view your Heart Disease prediction."),
      tags$br(),
      h4("Select a model type below, for more detailed inputs, select the", tags$b('Advanced'), "option."),
      selectInput(
        "modelType", "Model Type:",
        c(Basic = "basic", Advanced = "advanced")
      ),
      conditionalPanel(
        condition="input.modelType=='basic'",
        div(
          column(4,
            div(sliderInput(inputId="userAge", label="Select Age", min=30, max=100, value=50, step=1)),
            div(numericInput(inputId="userWeight", label="Enter Weight (Kg)", value=35, min=35, max=400, step=1)),
            div(numericInput(inputId="userHeight", label="Enter Height (cm)", value=100, min=100, max=250, step=1))
          ),
          column(4,
            div(radioButtons(inputId="userSex", label="Sex:", choices=c("Male", "Female"), inline=T)),
            div(numericInput(inputId="userBP", label="Enter Blood Pressure", value=60, min=60, max=200, step=1)),
            div(numericInput(inputId="userPR", label="Enter PR", value=60, min=60, max=200, step=1))
          ),
          column(4,
            div(radioButtons(inputId="smoker", label="Smoking Status:", choices=c("Current Smoker", "Ex Smoker", "Non Smoker")))
          )
        )
      ),
      conditionalPanel(
        condition="input.modelType=='advanced'",
        div(
           column(4,
             div(userAge),
             div(userSex),
             div(userHeight),
             div(thyroidDisease),
             div(edema),
             div(weakPeripheralPulse)
            ),
            column(4,
             div(userWeight),
             div(userBP),
             div(userPR),
             div(systolicMurmur),
             div(diastolicMurmur),
             div(chestPainType)
            ),
            column(4,
             div(smoker),
             div(radioButtons(inputId="airwayDisease", label="Airway Disease:", choices=c("Yes", "No"))),
             div(atypical),
             div(nonanginal)
            )
          )
        ),
      tags$br(),
      actionButton(
          inputId="getResults",
          label="GET RESULTS",
          style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
      ),
      textOutput("user_data")
    ),
    tabItem("acknowledgements",
      div(h3("References")),
      tags$ul(references),
      div(h3("Contributors")),
      div(h4("Katie Polus, Cassandra Elliott & Julia Paterson"))
    )
  )
)

ui <- dashboardPage(header, sidebar, body)

