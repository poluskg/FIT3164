library(shiny)
library(shinydashboard)
library(GGally)
library(psych)
library(plotly)
library(hash)

source("Overview.R")
source("dataOverview.R")
source("VariableImportance.R")
source("predictiveModel.R")
source("References.R")
source("helper.R")

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
      column(3, valueBoxOutput("DataTotBox", width=100)),
      column(3, valueBoxOutput("DataVarBox", width=100)),
      column(3, valueBoxOutput("DataMaleBox", width=100)),
      column(3, valueBoxOutput("DataFmaleBox", width=100)),
      div(p("Select a variable to view it in more detail:"),
        selectInput("var",
          label = "Select a Variable:",
          choices = variablesList
        )
      ),
      div(textOutput("selected_var")),
      verbatimTextOutput("summary")
    ),
    tabItem("predictiveModel",
      div(p("Enter the following information then click 'Get Results' to view whether or not you have Heart Disease")),
      selectInput(
        "modelType", "Model Type",
        c(Basic = "basic", Advanced = "advanced")
      ),
      conditionalPanel(
        condition="input.modelType=='basic'",
        column(4,
          div(userAge),
            div(userSex),
            div(userHeight),
            div("For more detailed inputs, select 'Advanced' option in 'Model Type'.")
          ),
          column(4,
            div(userWeight),
            div(userBP),
            div(userPR)
          ),
          column(4,
            div(smoker)
          )
        ),
        conditionalPanel(
          condition="input.modelType=='advanced'",
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
            div(airwayDisease),
            div(atypical),
            div(nonanginal)
          )
        ),
      tags$br(),
      actionButton(
          inputId="predict",
          label="GET RESULTS",
          style="color: #fff; background-color: #2E8B57; border-color: #90EE90; border-width: 3px;"
      ),
      div(textOutput("results"))
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

