library(plotly)
library(shiny)
attach(za)

yes_cath <- filter(za, Cath == 'Cad')
no_cath <- filter(za, Cath == 'Normal')

yes_small <- data.frame(yes_cath$DM,yes_cath$Current.Smoker,yes_cath$EX.Smoker,yes_cath$FH,yes_cath$Obesity,yes_cath$CRF,yes_cath$CVA,
                        yes_cath$Airway.disease,yes_cath$Thyroid.Disease,yes_cath$CHF,yes_cath$DLP,yes_cath$Edema,yes_cath$Weak.Peripheral.Pulse,
                        yes_cath$Lung.rales,yes_cath$Systolic.Murmur,yes_cath$Diastolic.Murmur,yes_cath$Typical.Chest.Pain,yes_cath$Dyspnea,
                        yes_cath$Atypical,yes_cath$Nonanginal,yes_cath$Exertional.CP,yes_cath$LowTH.Ang,yes_cath$Q.Wave,yes_cath$St.Elevation,
                        yes_cath$St.Depression,yes_cath$Tinversion,yes_cath$LVH,yes_cath$Poor.R.Progression,yes_cath$BBB)

no_small <- data.frame(no_cath$DM,no_cath$Current.Smoker,no_cath$EX.Smoker,no_cath$FH,no_cath$Obesity,no_cath$CRF,no_cath$CVA,
                       no_cath$Airway.disease,no_cath$Thyroid.Disease,no_cath$CHF,no_cath$DLP,no_cath$Edema,no_cath$Weak.Peripheral.Pulse,
                       no_cath$Lung.rales,no_cath$Systolic.Murmur,no_cath$Diastolic.Murmur,no_cath$Typical.Chest.Pain,no_cath$Dyspnea,
                       no_cath$Atypical,no_cath$Nonanginal,no_cath$Exertional.CP,no_cath$LowTH.Ang,no_cath$Q.Wave,no_cath$St.Elevation,
                       no_cath$St.Depression,no_cath$Tinversion,no_cath$LVH,no_cath$Poor.R.Progression,no_cath$BBB)

new <- merge(data.frame(yes_small, row.names = NULL), data.frame(no_small, row.names = NULL), by = 0, all = TRUE)[-1]

Variables <- c('DM','Current.Smoker','EX.Smoker','FH','Obesity','CRF','CVA',
               'Airway.disease','Thyroid.Disease','CHF','DLP','Edema','Weak.Peripheral.Pulse',
               'Lung.rales','Systolic.Murmur','Diastolic.Murmur','Typical.Chest.Pain','Dyspnea',
               'Atypical','Nonanginal','Exertional.CP','LowTH.Ang','Q.Wave','St.Elevation',
               'St.Depression','Tinversion','LVH','Poor.R.Progression','BBB')

yes_vars <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29)
no_vars <- c(30,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59)

plot_data <- data.frame(Variables, yes_vars, no_vars)

ui <- fluidPage(
  headerPanel('Binary Variables'),
  mainPanel(plotlyOutput('plot')
  )
)

server <- function(input,output) {

  output$plot <- renderPlotly(
    plot1 <- plot_ly(plot_data, x = ~Variables, y = ~ yes_vars, type = 'bar', name = 'Heart Disease') 
    %>% add_trace(y = ~no_vars, name = 'Healthy')
    %>% layout(yaxis = list(title = 'Total Number'), barmode = 'group')
  )
}

shinyApp(ui,server)
