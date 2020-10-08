library(shiny)
library(shinydashboard)
library(GGally)
library(psych)
library(plotly)

data <- read.csv("Z-Alizadeh_sani_dataset.csv", header = TRUE)

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
    menuItem("Variable Analysis", tabName = "variableAnalysis"),
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
            fluidRow(
              valueBoxOutput("DataTotBox"),
              valueBoxOutput("DataVarBox"),
              valueBoxOutput("DataMaleBox"),
              valueBoxOutput("DataFmaleBox")
            ),
    tabItem("variableAnalysis",
            div(p("Select a variable to view it in more detail:"),
                selectInput("var",
                    label = "Select a Variable:",
                    choices = variablesList,
                    selected = "Age")
                ),
            div(textOutput("selected_var"))
            
    ),
    tabItem("predictiveModel",
            div(p("Enter the following information then click 'Get Results' to view whether or not you have Heart Disease"))
    ),
    tabItem("acknowledgements",
            div(h3("References")),
            tags$ul(references),
            div(h3("Contributors")),
            div(h4("Katie Polus, Cassandra Elliott & Julia Paterson"))
    ))
  )

ui <- dashboardPage(header, sidebar, body)