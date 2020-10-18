server <- function(input, output, session) {
  #DataOverview Page
  output$DataTotBox <- renderValueBox({
    valueBox(
      VB_style("303", "font-size: 60%;"),
      "Total Instances", 
      color = "blue"
    )
  })
  
  output$DataVarBox <- renderValueBox({
    valueBox(
      VB_style("56", "font-size: 60%;"),
      "Unique Variables", 
      color = "blue"
    )
  })
  
  output$DataMaleBox <- renderValueBox({
    valueBox(
      VB_style(paste0(format(round(totalMales, 1), nsmall=1), "%"), "font-size: 60%;"),
      "Males", 
      color = "blue"
    )
  })
  
  output$DataFmaleBox <- renderValueBox({
    valueBox(
      VB_style(paste0(format(round(totalFemales, 1), nsmall=1), "%"), "font-size: 60%;"),
      "Females", 
      color = "blue"
    )
  })
  
  #VariableImportance Page
  output$selected_var <- renderText({
      getDefinition(input$var)
  })
  
  #set up data.frame with all summary vars - display
  #output$summary <- renderPrint({ 
  # describe(data)
  #})
  
  #PredictiveModel Page
  observeEvent(
    input$predict, {
      renderText(getPrediction())
    }
  )
}
