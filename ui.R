source("ui_helper.R")

header <- dashboardHeader()
sidebar <- dashboardSidebar(
  sidebarMenu(
    id = "tabs",
    menuItem("Introduction", tabName = "introduction"),
    menuItem("Data Overview", tabName = "dataOverview"),
    menuItem("Modelling Process", tabName = "modellingProcess"),
    menuItem("Predictive Model", tabName = "predictiveModel"),
    menuItem("Acknowledgements", tabName = "acknowledgements")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("introduction",
      h1("Predicting Heart Disease in Patients", align="center"),
      div(overviewText1),
      tags$br(HTML('<center><img src="heartImage.png" width="400"></center>')),
      tags$br(div(overviewText2, align="center"))
    ),
    tabItem("dataOverview",
      h1("Overview"),
      h3("Below is a summary of the dataset used in this application:"),
      column(3, valueBoxOutput("DataTotBox", width=100)),
      column(3, valueBoxOutput("DataVarBox", width=100)),
      column(3, valueBoxOutput("DataMaleBox", width=100)),
      column(3, valueBoxOutput("DataFmaleBox", width=100)),
      tags$br(h3(p("To understand the data in more detail, select a variable to view its definition:")),
        h4(
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
      tags$br(
        h5(tags$b("Data Set Information:"),
            tags$br("Each patient could be in two possible categories CAD or Normal. 
            A patient is categorized as CAD, if his/her diameter narrowing is greater than or equal to 50%, 
            and otherwise as Normal."),
            tags$br(
              tags$b("Attribute Information:"),
              tags$br("The Z-Alizadeh Sani dataset contains the records of 303 patients, 
              each of which have 54 features. The features are arranged in four groups: 
              demographic, symptom and examination, ECG, and laboratory and echo features.")),
              tags$br(em("Z.A.S. (2017, November 17). UCI Machine Learning Repository: Z-Alizadeh Sani Data Set.Https://Archive.Ics.Uci.Edu/Ml/Datasets/Z-Alizadeh+Sani. 
                      https://archive.ics.uci.edu/ml/datasets/Z-Alizadeh+Sani"))
        )
      )
    ),
    tabItem("modellingProcess",
      h2("Generating the Predictive Model"),
      div(modelText),
      tags$br(),
      fluidRow(
        column(7, tableOutput('model_table'),
               tags$br(tabsetPanel(
                 type="tabs",
                 tabPanel(tags$b("Naive Bayes"), tags$br(), nb_ui),
                 tabPanel(tags$b("Decision Tree"), tags$br(), dt_ui),
                 tabPanel(tags$b("Random Forest"), tags$br(), rf_ui),
                 tabPanel(tags$b("XG Boosting"), tags$br(), xgb_ui),
                 tabPanel(tags$b("SVM Model"), tags$br(), svm_ui),
                 tabPanel(tags$b("Bagging"), tags$br(), bag_ui)
               ))
              ),
        column(5, align="center", img(src="AUC.png", height=300, width=475))
      )
    ),
    tabItem("predictiveModel",
      h2("Test the Predictive Model"),
      h3("Enter the required information then click", tags$b('Get Results'), "to view your Heart Disease prediction."),
      h4("Select a model type below, for more detailed inputs, select the", tags$b('Advanced'), "option."),
      h5(em("Note that for the advanced model, the user is required to have details about their general health,
         family history and blood test results.")),
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
      tags$br(),
      div(h3("Contributors")),
      fluidRow(
        column(4, align="center", a(img(src="cassieGit.png", height=200, width=200), href="https://github.com/Cassandra344")),
        column(4, align="center", a(img(src="juliaGit.png", height=200, width=200), href="https://github.com/juliapaterson")),
        column(4, align="center", a(img(src="katieGit.png", height=200, width=200), href="https://github.com/poluskg"))
      ),
      fluidRow(
        column(4, align="center", tags$b("Cassandra Elliott", align="center")),
        column(4, align="center", tags$b("Julia Paterson", align="center")),
        column(4, align="center", tags$b("Katie Polus", align="center"))
      )
    )
  )
)

ui <- dashboardPage(header, sidebar, body)

