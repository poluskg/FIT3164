#Show variable summary on Data Overview page
getVariableSummary <- function(var){
  varName = variables[var]
  value = eval(parse(text = varName))
  # CHANGE FOR THOSE WITH NO MIN/MAX ELIGIBLE VALUES
  variable_summary = data.frame("Min"=round(min(value), digits=2), "Max"=round(max(value), digits=2), "Mean"=round(mean(value), digits=2), "Median"=round(median(value), digits=2))
  return(variable_summary)
}

#Static violin model showing gender distribution/HD
fig <- data %>%
  plot_ly(type = 'violin') 
fig <- fig %>%
  add_trace(
    x = ~Cath[data$Sex == 'Male'],
    y = ~Age[data$Sex == 'Male'],
    ylim(0,1),
    legendgroup = 'Yes',
    scalegroup = 'Yes',
    name = 'Male',
    side = 'negative',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    ),
    color = I("blue")
  ) 
fig <- fig %>%
  add_trace(
    x = ~Cath[data$Sex == 'Fmale'],
    y = ~Age[data$Sex == 'Fmale'],
    ylim(0,1),
    legendgroup = 'No',
    scalegroup = 'No',
    name = 'Female',
    side = 'positive',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    ),
    color = I("green")
  ) 

fig <- fig %>%
  layout(
    xaxis = list(
      title = ""  
    ),
    yaxis = list(
      title = "",
      zeroline = F
    ),
    violingap = 0,
    violingroupgap = 0,
    violinmode = 'overlay'
  )