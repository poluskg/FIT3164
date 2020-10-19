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
  output$var_definition <- renderText({
      getDefinition(input$var)
    }
  )
  
  output$var_summary <- renderTable({
      getVariableSummary(input$var)
    }
  )
  
  #PredictiveModel Page
  observeEvent(input$getResults, {
    newLine <- data.frame(
      Age=as.numeric(input$userAge), Weight=as.numeric(input$userWeight),
      Height=as.numeric(input$userHeight), Sex=toString(input$userSex)
    )
    df <- rbind(newLine)
    update(df)
  })
  update <- reactiveVal(df)
}
