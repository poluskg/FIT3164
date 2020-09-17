#regression models
library(ggplot2)
library(car)
library(QuantPsyc)
library(lmSupport)
library(psych)
library(haven)
library(rockchalk)

#change cath to factor
z$Cath<-as.factor(z$Cath)

####simple model####
#lm(dependent variable ~ independent variable)
simple_reg <- lm(z$BP~z$Typical.Chest.Pain)

par(mfrow = c(2,2))
plot(simple_reg)

dwt(simple_reg)

summary(simple_reg, confint = TRUE)

#plot with regression line using coefficients
par(mfrow = c(1,1))
plot(z$Typical.Chest.Pain, z$BP)
abline(lm(z$BP~z$Typical.Chest.Pain))

####interaction model####
z$Cath <- to_factor(z$Cath)
z$Cath <-as.numeric(z$Cath)

interact_reg <- lm(Cath ~ BP*Typical.Chest.Pain, data = z)

par(mfrow = c(2,2))
plot(interact_reg)

dwt(interact_reg)
vif(interact_reg)

summary(interact_reg, confint = TRUE)
lm.beta(interact_reg)
lm.sumSquares(interact_reg)

#plot 
par(mfrow = c(1,1))

#library(sjPlot)
#library(sjmisc)
#theme_set(theme_sjplot())
#plot_model(interact_reg, type = 'pred')

plotSlopes(interact_reg, plotx = "BP", modx = "Typical.Chest.Pain", modxVals = "std.dev", main = 'simple slopes plot')

#interaction.plot(z$BP, z$Typical.Chest.Pain, z$Cath)
