####data files####
v1 <- read.csv('datasets_33180_43520_heart.csv')
v2 <- read.csv('datasets_216167_477177_heart.csv')
v3 <- read.csv('cardio_train.csv')

####clean####
v1.1 <- na.omit(v1)
v2.1 <- na.omit(v2)
v3.1 <- na.omit(v3)

head(v1.1)
head(v2.1)

head(v3.1) #in a strange format
