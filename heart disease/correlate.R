#function to find a correlation between two input variables 
#return correlation coefficient & p value & stats
#use a pearson correlation for continuous variables
library(ggplot2)
library(ggpubr)
library(plotly)

attach(za)

za_cont <- data.frame(ï..Age, Weight, Length, BMI, BP, PR, Function.Class, CR, TG, LDL,
             HDL, BUN, ESR, HB, K, Na, WBC, Lymph)

####correlate####
pearson_cor_func <- function(variable1, variable2) {
  #correlate
  cor_result <- cor.test(variable1, variable2, method = 'pearson')
  #make an interactive plot
  fig <- plot_ly(data = za_cont, x = ~variable1, y = ~variable2, type = 'scatter', text = ~paste('Variable 1:', variable1, '<br>Variable 2:', variable2), size = ~variable1)
  #return results
  result_list <- list('result' = cor_result,'int_plot' = fig)
  return(result_list)
}


#call it
#tell user to select variable 1 and variable 2
pearson_cor_func(BP, PR)

####static/boring old plot it####
ggscatter(za, x = "Weight", y = "BMI", add = 'reg.line', 
                       conf.int = TRUE, cor.coef = TRUE, cor.methods = 'pearson',
                       xlab = 'Weight', ylab = 'BMI')


####correlation matrix of important continuous variables####
#excluding y/n binary CVA (13), Dyspnea (26), atypical (28)
#binary/categories typicalchestpain (25), htn(7), functionclass (27), currentsmoker (7)

#Typical.Chest.Pain, Atypical, Age, HTN, BP,
#ESR, HB, HDL, PR, FBS, Function.Class,
#BUN, Length, BMI, Weight, Current.Smoker, K, 
library(PerformanceAnalytics)
important <- za[, c( 1, 18,
              45, 46, 43, 19, 39,
              44, 3, 5, 2, 47)]
chart.Correlation(important, histogram = TRUE, method = 'pearson')

#possibly normalise?
#need to do only a few at a time for readability
####testing broken stuff####

library(statsmodels)
library(plotly.express)
library(namespace)

fig <- plot_ly(data = za, x = Weight, y = BMI, type = 'scatter', text = ~paste('Variable 1:', Weight, '<br>Variable 2:', BMI), color = ~Weight, size = ~Weight) %>% add_trace(za, x = lm(Weight~BMI), y = BMI, type = 'scatter')
fig
