library(tidyverse)
library(readtext)
library(stringr)
library(readxl)

z <- read_excel("Z-Alizadeh_sani dataset.xlsx", sheet=1)

z <- read.csv('Z-Alizadeh_sani_dataset.csv')

# change z ali sani chr to factor
z$Sex<-as.factor(z$Sex)
z$"Current Smoker"<-as.factor(z$"Current Smoker")
z$Cath<-as.factor(z$Cath)

# test and training set
set.seed(1111) #random seed   
train.row = sample(1:nrow(z), 0.7*nrow(z))  
data.train = z[train.row,]  
data.test = z[-train.row,]

# column names are bad- change them
names(data.train) <- make.names(names(data.train))
names(data.test) <- make.names(names(data.test))

xg.train<-data.train
xg.test<- data.test

# change char->factor
xg.train$Obesity <-as.factor(xg.train$Obesity)
xg.train$CRF <-as.factor(xg.train$CRF)
xg.train$CVA <-as.factor(xg.train$CVA)
xg.train$Airway.disease <-as.factor(xg.train$Airway.disease)
xg.train$Thyroid.Disease <-as.factor(xg.train$Thyroid.Disease)
xg.train$CHF <-as.factor(xg.train$CHF)
xg.train$DLP <-as.factor(xg.train$DLP)
xg.train$Weak.Peripheral.Pulse <-as.factor(xg.train$Weak.Peripheral.Pulse)
xg.train$Lung.rales <-as.factor(xg.train$Lung.rales)
xg.train$Systolic.Murmur <-as.factor(xg.train$Systolic.Murmur)
xg.train$Diastolic.Murmur <-as.factor(xg.train$Diastolic.Murmur)
xg.train$Dyspnea <-as.factor(xg.train$Dyspnea)
xg.train$Atypical <-as.factor(xg.train$Atypical)
xg.train$Nonanginal <-as.factor(xg.train$Nonanginal)
xg.train$Exertional.CP <-as.factor(xg.train$Exertional.CP)
xg.train$LowTH.Ang <-as.factor(xg.train$LowTH.Ang)
xg.train$LVH <-as.factor(xg.train$LVH)
xg.train$Poor.R.Progression <-as.factor(xg.train$Poor.R.Progression)
xg.train$BBB <-as.factor(xg.train$BBB)
xg.train$VHD <-as.factor(xg.train$VHD)

# boosting only takes numbers (not factors) so I've had to change the factors to num
# it doesnt seem to work properly if I go char-> num, it has to be char->factor->number


# to numeric
xg.train$Obesity <-as.numeric(xg.train$Obesity)
xg.train$CRF <-as.numeric(xg.train$CRF)
xg.train$CVA <-as.numeric(xg.train$CVA)
xg.train$Airway.disease <-as.numeric(xg.train$Airway.disease)
xg.train$Thyroid.Disease <-as.numeric(xg.train$Thyroid.Disease)
xg.train$CHF <-as.numeric(xg.train$CHF)
xg.train$DLP <-as.numeric(xg.train$DLP)
xg.train$Weak.Peripheral.Pulse <-as.numeric(xg.train$Weak.Peripheral.Pulse)
xg.train$Lung.rales <-as.numeric(xg.train$Lung.rales)
xg.train$Systolic.Murmur <-as.numeric(xg.train$Systolic.Murmur)
xg.train$Diastolic.Murmur <-as.numeric(xg.train$Diastolic.Murmur)
xg.train$Dyspnea <-as.numeric(xg.train$Dyspnea)
xg.train$Atypical <-as.numeric(xg.train$Atypical)
xg.train$Nonanginal <-as.numeric(xg.train$Nonanginal)
xg.train$Exertional.CP <-as.numeric(xg.train$Exertional.CP)
xg.train$LowTH.Ang <-as.numeric(xg.train$LowTH.Ang)
xg.train$LVH <-as.numeric(xg.train$LVH)
xg.train$Poor.R.Progression <-as.numeric(xg.train$Poor.R.Progression)
xg.train$BBB <-as.numeric(xg.train$BBB)
xg.train$VHD <-as.numeric(xg.train$VHD)

# more
xg.train$Sex <-as.numeric(xg.train$Sex)
xg.train$Current.Smoker <-as.numeric(xg.train$Current.Smoker)
xg.train$Cath <-as.numeric(xg.train$Cath)

# make into a matrix
xg.train<- data.matrix(xg.train)
Cath<- as.numeric(data.train$Cath)

library(xgboost)
xg<- xgboost(data=xg.train[,-56], label = Cath, max.depth=6, nrounds = 25)

importance <- xgb.importance(feature_names = colnames(xg.train), model = xg)
head(importance)

library(randomForest)
set.seed(1234)
forest<- randomForest(as.factor(Cath)~., data = data.train, ntree=1000)
