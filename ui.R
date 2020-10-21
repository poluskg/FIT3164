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
      h3(p("To understand the data in more detail, select a variable to view its definition:")),
      div(
        selectInput("var",
          label = "Select a Variable:",
          choices = variablesList,
          selected = "Age"
        )
      ),
      textOutput("var_definition"),
      tags$head(tags$style("#var_definition {
                           color: black;
                           font-size: 20px;
                           font-style: bold;
                            }"
                          )
                )
    ),
    tabItem("predictiveModel",
      h2("Generating the Predictive Model"),
      div(modelText),
      tags$br(),
      tableOutput('model_table'),
      br(img(src="AUC.png", width="400")),
      h3("Enter the required information then click", tags$b('Get Results'), "to view your Heart Disease prediction."),
      h4("Select a model type below, for more detailed inputs, select the", tags$b('Advanced'), "option."),
      tags$br(),
      tabsetPanel(
        type="tabs",
        tabPanel(tags$b("Basic"), tags$br(), basic),
        tabPanel(tags$b("Advanced"), tags$br(), advanced)
      ),
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

