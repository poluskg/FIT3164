library(ggplot2)
library(ggpubr)
library(testthat)

#check shiny file where scatterplot exists for robustness
file.exists('dataOverview_ui.R')

#manually create scatterplots for variable combinations to confirm visually
attach(za)
ggscatter(za, x = "Lymph", y = "WBC", add = 'reg.line', 
          conf.int = TRUE, cor.coef = TRUE, cor.methods = 'pearson',
          xlab = 'X Var', ylab = 'Y Var')
