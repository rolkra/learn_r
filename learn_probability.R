#############################################################################
## uniform distirbution
#############################################################################

# 10 random numbers between 0 and 1
runif(10)

# 10 random numbers between 1 and 10
runif(n = 10, min = 1, max = 10)


#############################################################################
## binomial distribution (flipping a coin)
#############################################################################

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


#############################################################################
## normal distribution (length with deviation)
#############################################################################

# set seed to get reproducable result
set.seed(100)                              
x <- seq(0,25, by=0.25)
y <- dnorm(x, mean = 10, sd = 4)
plot(x,y, main = "normal distribution")
lines(x,y)


#############################################################################
## hypergeometric distribution (picking black/white balls from an urn)
#############################################################################

# nn = numer of experiments
# m  = number of white balls in urn 
# n  = number of black balls in urn
# k  = number of balls taken out

# urn with 9 white and 1 black balls, 1 ball taken out, experiment 100x
# number of white balls per experiment
white <- rhyper(nn = 100, m=9, n=1, k=1)     

# urn with 5 white and 5 black balls, 5 balls taken out, experiment 10000x
# number of white balls per experiment
white <- rhyper(nn = 10000, m=5, n=5, k=5)     
plot(table(white), xlim = c(0,5))

# denisity
x <- c(1:5)
y <- dhyper(x = x, m=5, n=5, k=5) 
barplot(y, names.arg = x, main = "probability (hypergeomentric)\npicking n white balls out of 5 white and 5 black")
