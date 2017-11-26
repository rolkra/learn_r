#############################################################################
## probability
#############################################################################

## uniform distirbution

# 10 random numbers between 0 and 1
runif(10)

# 10 random numbers between 1 and 10
runif(n = 10, min = 1, max = 10)

## binomial distribution

# set seed to get reproducable result
set.seed(100)                              

# Flipping a coin 10x
coin <- rbinom(n=10, size=1, prob=1/2) 
ifelse(coin == 0, "head", "tail")

# number of 6, rolling the dice 60x
rbinom(n=1, size=60, prob=1/6)     

# number of 6, rolling the dice 60x, 1000x
six <- rbinom(n=1000, size=60, prob=1/6)
hist(six, col="grey", xlim=c(0,20), breaks = c(0:30))

# distribution
x <- c(1:25)
y <- dbinom(x = x, size = 60, prob = 1/6) 
plot(x,y, main = "probability\nrolling the dice 60x: number of 6")
lines(x,y)
abline(v=60*1/6, col="red", lty=2)

# rolling the dice 60x, number of 6 between 8 and 10
pbinom(10, 60, 1/6) - pbinom(7, 60, 1/6)
dbinom(8, 60, 1/6) + dbinom(9, 60, 1/6) + dbinom(10, 60, 1/6)


## normal distribution

# set seed to get reproducable result
set.seed(100)                              
x <- seq(0,25, by=0.25)
y <- dnorm(x, mean = 10, sd = 4)
plot(x,y, main = "normal distribution")
lines(x,y)
