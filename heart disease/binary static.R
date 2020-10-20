#### plot binary vars for yes cath outcome####
library(plotly)
#library(dpylr)
attach(za)

yes_cath <- filter(za, Cath == 'Cad')
no_cath <- filter(za, Cath == 'Normal')

yes_small <- data.frame(yes_cath$Current.Smoker, yes_cath$EX.Smoker, yes_cath$HTN, yes_cath$DM, yes_cath$Edema)
no_small <- data.frame(no_cath$Current.Smoker, no_cath$EX.Smoker, no_cath$HTN, no_cath$DM, no_cath$Edema)

new <- merge(data.frame(yes_small, row.names = NULL), data.frame(no_small, row.names = NULL), by = 0, all = TRUE)[-1]

vars <- c('DM','HTN','Current.Smoker','EX.Smoker','Edema')
yes_vars <- c(1,2,3,4,5)
no_vars <- c(6,7,8,9,10)

plot_data <- data.frame(vars, yes_vars, no_vars)
fig <- plot_ly(plot_data, x = ~vars, y = ~yes_vars, type = 'bar', name = 'cath yes')
fig <- fig %>% add_trace(y = ~no_vars, name = 'cath no')
fig <- fig %>% layout(yaxis = list(title = 'count'), barmode = 'group')

fig

####broken stuff i might fix later####
#yes_counts <- table(yes_small$Current.Smoker)
#no_counts <- table(no_small)

#barplot(yes_counts)
#barplot(no_counts)

#vars <- c('Current.Smoker', 'EX.Smoker', 'HTN','DM','Edema')

#yes_data <- data.frame(vars, yes_small)
#no_data <- data.frame(vars, no_small)

#yes_fig <- plot_ly(yes_small, x = ~vars, y = ~yes_cath, type = 'bar', name = 'yes cath')

#yes_fig

#no_fig <- plot_ly(no_data, x = ~vars, y = ~no_cath, type = 'bar', name = 'no cath')

#no_fig

#merge(data.frame(yes_cath, row.names = NULL), data.frame(no_cath, row.names = NULL), by = 0, all = TRUE)[-1]

#fig <- fig %>% add_trace(y = ~no_cath, name = 'no cath')

#fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

#excluding y/n binary CVA (13), Dyspnea (26), atypical (28)
#binary/categories typicalchestpain (25), htn(7), functionclass (27), currentsmoker (7)

