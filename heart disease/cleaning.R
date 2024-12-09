####data files####
library(tidyverse)
library(readtext)
library(stringr)
library(readxl)

z <- read.csv('Z-Alizadeh_sani_dataset.csv')
#z<- read_excel("Zdataset.xlsx", sheet=1)

####clean####

za <- na.omit(z)

head(za)
summary(za)

#unique(z)
head(z)
summary(z)

head(za)
head(z)
