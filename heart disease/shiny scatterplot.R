library(shiny)
library(plotly)

attach(za)

za_cont <- data.frame(ï..Age, Weight, Length, BMI, BP, PR, Function.Class, CR, TG, LDL,
                       HDL, BUN, ESR, HB, K, Na, WBC, Lymph)

ui <- fluidPage(
  headerPanel('Scatterplot of Continuous Variables'),
  sidebarPanel(
    selectInput('xcol','X Variable', names(za_cont)),
    selectInput('ycol','Y Variable', names(za_cont)),
    selected = names(za_cont)[[2]]),
  mainPanel(plotlyOutput('plot'))
)

server <- function(input,output) {
  x <- reactive({
    za_cont[,input$xcol]
  })
  y <- reactive({
    za_cont[,input$ycol]
  })
  
  output$plot <- renderPlotly(
    plot1 <- plot_ly(
      x = x(),
      y = y(),
      type = 'scatter',
      mode = 'markers')
  )
}

shinyApp(ui,server)
