library(dplyr)
library(plyr)
library(psych)
library(caret)

# Initial commit to github repository from RStudio
rm(list = ls())
data1 = read.csv("data1_heart.csv", header=TRUE) #datasets_33180_43520_heart
data2 = read.csv("data2_heart.csv", header=TRUE) #datasets_216167_477177_heart
#data3 = read.csv("heart.train.csv", header=TRUE) #FIT2086 data
data4 = read.csv("Z-Alizadeh_sani_dataset.csv", header=TRUE) #Required dataset

colnames(data1) = c("AGE", "SEX", "CP", "TRESTBPS", "CHOL", "FBS", "RESTECG", "THALACH", "EXANG", "OLDPEAK", "SLOPE", "CA", "THAL", "HD")
colnames(data2) = c("AGE", "SEX", "CP", "TRESTBPS", "CHOL", "FBS", "RESTECG", "THALACH", "EXANG", "OLDPEAK", "SLOPE", "CA", "THAL", "HD")
head(data2)
head(data1)
head(data4)

data = rbind(data1, data2)
data = distinct(data)
data.1 = merge(data, by.x=data$age, by.y=data3.Age)
head(data4)
head(data)
#Create a correlation matrix
data4$Cath = revalue(data4$Cath, c("Cad"=1))
data4$Cath = revalue(data4$Cath, c("Normal"=0))
data4$Cath = as.numeric(data4$Cath)


#Perform statistical analysis to determine most important predictors of HD