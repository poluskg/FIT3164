rm(list = ls(all.names = TRUE))

library(psych)
library(haven)
library(rockchalk)
library(ggplot2)

#### initial cleaning####
d <- read_sav("PSY4062_EAMMI2_Data (1).sav")
d2 <- subset(d, age <= 25)
d3 <- subset(d2, Consent == 1)

#handle nas in relevant rows before modelling
#filter relevant rows for descriptives, efficacy, support, negativity total
clean_d <- d3[,c(215:216, 219, 89:98, 100:111, 240)]
#remove rows with NAs
clean_d <- na.omit(clean_d)

#### descriptive statistics ####
#age descriptives
summary(clean_d$age)
sd(clean_d$age)

#demographic descriptives
attributes(clean_d$sex)$labels
table(clean_d$sex)

attributes(clean_d$RaceCoded)$labels
table(clean_d$RaceCoded)

#### score variab les ####
clean_d$efficacy_total <- clean_d$efficacy_1 + clean_d$efficacy_2 + clean_d$efficacy_3 + clean_d$efficacy_4 + 
  clean_d$efficacy_5 + clean_d$efficacy_6 + clean_d$efficacy_7 + clean_d$efficacy_8 + clean_d$efficacy_9 + clean_d$efficacy_10

clean_d$support_total <- (clean_d$support_1 + clean_d$support_2 + clean_d$support_3 + clean_d$support_4 + clean_d$support_5 +
                            clean_d$support_6 + clean_d$support_7 + clean_d$support_8 + clean_d$support_9 + clean_d$support_10 +
                            clean_d$support_11 + clean_d$support_12) / 12

#check prior to transformations
#descriptives
summary(clean_d$IDEA8_negativity)
summary(clean_d$efficacy_total)
summary(clean_d$support_total)

#hist + boxplot
hist(clean_d$IDEA8_negativity)
boxplot(clean_d$IDEA8_negativity)
hist(clean_d$efficacy_total)
boxplot(clean_d$efficacy_total)
hist(clean_d$support_total)
boxplot(clean_d$support_total)

##qq
qqnorm(clean_d$IDEA8_negativity)
qqnorm(clean_d$efficacy_total)
qqnorm(clean_d$support_total)

#z scores
summary(scale(clean_d$IDEA8_negativity))
sd(scale(clean_d$IDEA8_negativity), na.rm = TRUE)

summary(scale(clean_d$efficacy_total))
sd(scale(clean_d$efficacy_total), na.rm = TRUE)

summary(scale(clean_d$support_total))
sd(scale(clean_d$support_total), na.rm = TRUE)

#shapiro wilk?
shapiro.test(clean_d$IDEA8_negativity)
shapiro.test(clean_d$efficacy_total)
shapiro.test(clean_d$support_total)

#can see that these are negatively skewed and not normal, therefore need to reflect and log transform

#### tranform variables ####
#reflect variables
clean_d$IDEA8_negativity_reflect <- max(clean_d$IDEA8_negativity) + 1 - clean_d$IDEA8_negativity
clean_d$support_total_reflect <- max(clean_d$support_total) + 1 - clean_d$support_total
clean_d$efficacy_total_reflect <- max(clean_d$efficacy_total) + 1 - clean_d$efficacy_total

#log transform variables
clean_d$IDEA8_negativity_log <- log(clean_d$IDEA8_negativity_reflect)
clean_d$support_total_log <- log(clean_d$support_total_reflect)
clean_d$efficacy_total_log <- log(clean_d$efficacy_total_reflect)

####check for assumptions, outliers etc####
#boxplot for univariate outliers
boxplot(clean_d$IDEA8_negativity_log)
boxplot(clean_d$efficacy_total_log) #outliers
boxplot(clean_d$support_total_log)

#z scores
summary(scale(clean_d$IDEA8_negativity_log))
sd(scale(clean_d$IDEA8_negativity_log), na.rm = TRUE) #is good

summary(scale(clean_d$efficacy_total_log)) #still a an outlier here, z > -3.29
boxplot(clean_d$efficacy_total_log)
sd(scale(clean_d$efficacy_total_log), na.rm = TRUE)
#check how many there are
table(scale(clean_d$efficacy_total_log)) #48 at -.3.58 sds? 
table(scale(clean_d$efficacy_total_log) > -3.29)
#only lowest 2.5%?
table(scale(clean_d$efficacy_total_log))/length(clean_d$efficacy_total_log) * 100

#remove outliers
clean_d <- subset(clean_d, clean_d$efficacy_total_log > 0)
summary(clean_d$efficacy_total_log)
summary(scale(clean_d$efficacy_total_log))
sd(scale(clean_d$efficacy_total_log), na.rm = TRUE) #is good

# #testing how to subset out outliers
# #winsor(clean_d$efficacy_total_log, trim = 0.025)
# winsorize 
# #remove them? (idk how to winsorize)
# clean_d$efficacy_log_test <- winsor(clean_d$efficacy_total_log, trim = .05)
# clean_d$efficacy_total_clean <- subset(clean_d$efficacy_total_log, scale(clean_d$efficacy_total_log) >= -3.29)
# clean_d$efficacy_z <- scale(clean_d$efficacy_total_log)
# clean_d <- subset(clean_d, clean_d$efficacy_z <= -3.29)
# df <- data.frame(matrix(unlist(clean_d), nrow = 1920, byrow = T), stringsAsFactors = FALSE)

summary(scale(clean_d$support_total_log))
sd(scale(clean_d$support_total_log), na.rm = TRUE) #is also good

#chedk mahalanobis distances for multivariate outliers
cleandf <- as.data.frame(clean_d) #data turns into a list with read_sav, plotSlopes can't take a list input so need to transform to dataframe
outlier(cleandf) #big ones should be removed


#normality
##histogram
hist(clean_d$IDEA8_negativity_log)
hist(clean_d$efficacy_total_log)
hist(clean_d$support_total_log)

##qq
qqnorm(clean_d$IDEA8_negativity_log)
qqnorm(clean_d$efficacy_total_log)
qqnorm(clean_d$support_total_log)

#can check normality with shapiro wilk as well?
shapiro.test(clean_d$IDEA8_negativity_log)
shapiro.test(clean_d$efficacy_total_log)
shapiro.test(clean_d$support_total_log)

#slighlty more normal, but still not - cite central limit theorem for large sample sizes, check other assumptions

####moderated regression####
cleandf <- as.data.frame(clean_d) #data turns into a list with read_sav, plotSlopes can't take a list input so need to transform to dataframe
moderate <- lm(efficacy_total_log ~ IDEA8_negativity_log*support_total_log, data = cleandf)
summary(moderate)
#generate standardised betas
library(QuantPsyc)
lm.beta(moderate)
#check interpretations of reflected and log transformed data

#use residuals plot to check normality, linearity, homoscedacity (double check interpretations)
plot(moderate) #not great, but clt
#check multicollinearity
library(car)
car::vif(moderate) #quite low (1 to 4/5), so should be ok
durbinWatsonTest(moderate) #DW statistic 2.02, which is between 1.5 and 2.5, so no autocorrelation

####slopes plot####
modell.1 <- plotSlopes(moderate, plotx = "IDEA8_negativity_log", modx = "support_total_log", modxVals = "std.dev")
# #legend, font (apa) etc?
# library(extrafont)
plotSlopes(moderate, plotx = "IDEA8_negativity_log", modx = "support_total_log", modxVals = "std.dev")

#### outputting apa style tables ####
library(apaTables)
library(MBESS)
apa.reg.table(moderate, filename = "moderate.doc", table.number = 2)
