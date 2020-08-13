####data files####
library(tidyverse)

#v1 <- read.csv('datasets_33180_43520_heart.csv')
#v2 <- read.csv('datasets_216167_477177_heart.csv')
#v3 <- read.csv('cardio_train.csv')

#v4 <- read.csv('default.csv')
#z <- read_excel("Zdataset.xlsx", sheet=1)
za <- read.csv('Z-Alizadeh_sani_dataset.csv')

####clean####
#v1.1 <- na.omit(v1)
#v2.1 <- na.omit(v2)
#v3.1 <- na.omit(v3)
za <- na.omit(za)

#head(v1.1)
#head(v2.1)
#head(v3.1) #in a strange format
head(za)
summary(za)
