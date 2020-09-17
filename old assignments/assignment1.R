pa <- read.csv("port.adelaide.csv", header = TRUE)

ll = 0
wl = 0
ww = 0
lw = 0

for (i in  1:(length(pa[,1]) - 1)) {
  if (pa[i,1] == 0 & pa[i+1,1] == 0) {
    ll <- ll + 1
  }
  if (pa[i,1] == 1 & pa[i+1,1] == 0) {
    wl <- wl + 1
  }
  if (pa[i,1] == 1 & pa[i+1,1] == 1) {
    ww <- ww + 1
  }
  if (pa[i,1] == 0 & pa[i+1,1] == 1) {
    lw <- lw + 1
  }
}

ll_freq = ll/67
wl_freq = wl/67
ww_freq = ww/67
lw_freq = lw/67

ll_freq
wl_freq
ww_freq
lw_freq


equation1 <- function(x) 3/4 * (1 - (x/1)^2)
plot.function(equation1, from = -1, to = 1)

equation2 <- function(x) 3/8 * (1 - (x/2)^2)
plot.function(equation2, from = -2, to = 2)

#5
dog <- read.csv("dogbites.total.csv")
ml <- mean(dog[,1])
ml
poisson <- dpois(0:max(dog[,1]),ml)
plot(seq(0,24,1), poisson, xlab = 'number of dog bites', ylab = 'poisson probability') #a

ppois(1, ml, lower.tail = TRUE) #b i

#b ii
mode <- 0
modeval <- 0
for (i in 1:max(dog[,1])) {
  if (mode < max(dpois(i, ml))) {
    mode <- max(dpois(i, ml))
    modeval <- i
  }
}

m <- c(modeval,mode)
m

#b iii
floor(ml * 28)

#b iv
pbinom(8, 28, ppois(6,ml,lower.tail = FALSE), lower.tail = FALSE)

#c
observed <- table(dog[,1])/378
plot(observed, col = 'red', ylim=c(0,0.20), xlab = 'number of dog bites', ylab = 'probability' )
points(seq(0,24,1), poisson, col="black")
