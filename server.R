server <- function(input, output, session) {
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
  
  output$DataMFBox <- renderValueBox({
    valueBox(
      VB_style(paste0(format(totalMales, big.mark='%'), "M to", format(totalFemales, big.mark='%'), "F"), "font-size: 60%;"),
      "Male to Female Ratio", 
      color = "blue"
    )
  })
}