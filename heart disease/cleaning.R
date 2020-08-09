####data files####
v1 <- read.csv('datasets_33180_43520_heart.csv')
v2 <- read.csv('datasets_216167_477177_heart.csv')
v3 <- read.csv('Z-Alizadeh sani dataset.csv')

####clean####
v1.1 <- na.omit(v1)
v2.1 <- na.omit(v2)

head(v1.1)
head(v2.1)
