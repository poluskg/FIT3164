library(shiny)
library(shinydashboard)
library(GGally)
library(psych)
library(plotly)

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
          div(h1("Heart Disease", align="center")),
          div(p(overviewText1, align="center")),
          br(HTML('<center><img src="heartImage.png" width="400"></center>')),
          br(div(p(overviewText2, align="center")))
      ),
      tabItem("variableImportance",
          div(p("Select a variable to view its description and its impact on predictive diagnosis of heart disease."),
            varSelectInput("variable", "Choose a Variable:", data),
            plotOutput("data")
            ),
          mainPanel("selected_var")
      ),
      tabItem("staticModels",
              "Static Models"
      ),
      tabItem("predictiveModels",
              "Predictive Model"
      ),
      tabItem("acknowledgements",
              div(h3("References")),
              tags$ul(references),
        div(h3("Contributors")),
        div(h4("Katie Polus, Cassandra Elliott & Julia Paterson")),
      )
    ),
  )
)

variableCorrelation <- function(userVar) {}

server <- function(input, output) {
  output$data <- renderPlot({
    #ggplot(data, aes(!!input$variable)) + geom_histogram()
    histogramViz = ggplot(data, aes(!!input$variable)) + geom_histogram()
    ggplotly(histogramViz, )
  })
  #output$selected_var <- renderText({input$var})
}

#shinyApp(ui = ui, server = server)
