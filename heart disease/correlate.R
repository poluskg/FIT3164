#function to find a correlation between two input variables 
#return correlation coefficient & p value & stats
#use a pearson correlation for continuous variables
library(ggplot2)
library(ggpubr)

pearson_cor_func <- function(var1,var2) {
  cor_result <- cor.test(var1,var2, method = 'pearson')
  return(cor_result)
}


#call it
pearson_cor_func(za$Weight, za$BMI)

#plot it
ggscatter(za, x = "Weight", y = "BMI", add = 'reg.line', 
                       conf.int = TRUE, cor.coef = TRUE, cor.methods = 'pearson',
                       xlab = 'Weight', ylab = 'BMI')

#correlation matrix of important continuous variables
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