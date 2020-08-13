#q1
dog <- read.csv('dogbites.fullmoon.csv')
full <- dog$daily.dogbites[dog$is.full.moon == 1]
fullmean <- mean(full)
fullvar <- var(full)
fulln <- length(full)

fullt <- qt(1-0.05/2, 12)

notfull <- dog$daily.dogbites[dog$is.full.moon == 0]

notmean <- mean(notfull)
notvar <- var(notfull)
notn <- length(notfull)

meandif <- notmean - fullmean

#q2
equation1 <- function(y) exp(-exp(-1)* y-1)
plot.function(equation1, from = -0, to = 10, col = 'red', xlab = 'y', ylab = 'probability', add = TRUE)

equation2 <- function(y) exp(-exp(-0.5)* y-0.5)
plot.function(equation2, from = -0, to = 10, col = 'blue', add = TRUE)

equation3 <- function(y) exp(-exp(-2)* y-2)
plot.function(equation3, from = -0, to = 10, col = 'green', add = TRUE)

legend("topright", c("v = 1","v = 0.5", "v = 2"), fill=c("red","blue","green"))

#q3
binom.test(80,124, alternative = "two.sided")

#q4
car <- read.csv('fuel2017-20.csv')
model <- lm(Comb.FE ~., car)
summary(model)

bic_model <- step(model, k=log(length(car$Comb.FE)))
summary(bic_model)

newcar <- read.csv('fuel2017-20.test.csv')
newpredict <- predict(bic_model, newcar, interval = 'confidence')
head(newpredict)
