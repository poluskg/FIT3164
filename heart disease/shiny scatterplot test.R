library(ggplot2)
library(ggpubr)

attach(za)

ggscatter(za, x = "Lymph", y = "WBC", add = 'reg.line', 
          conf.int = TRUE, cor.coef = TRUE, cor.methods = 'pearson',
          xlab = 'X Var', ylab = 'Y Var')
