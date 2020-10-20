#### plot binary vars for yes cath outcome####
library(plotly)
#library(dpylr)
attach(za)

no_cath <- filter(za, Cath == 'Normal')

no_fig <- plot_ly(x = c('DM','HTN','Current.Smoker','EX.Smoker','Edema'), y = c(6,7,8,9,20), name = 'cath no', type = 'bar')
no_fig
