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

# density
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

# density 
m = 10     # number of white balls in urn 
n = 20     # number of black balls in urn
k = 10     # number of balls taken out
x <- c(1:k)
y <- dhyper(x = x, m=m, n=n, k=k) 
p <- barplot(y, names.arg = x, 
             ylim = c(0, max(y)*1.2),
             main = paste("probability (hypergeomentric)\npicking white balls out of", m, "white and", n, "black"),
             xlab = "number of white balls",
             ylab = "probability",
             border = FALSE)
text(p[,1],y, paste0(round(y*100,2),"%"), pos=3, cex = 0.8)


################################################################################
# chisq (test if groups are different)
################################################################################

m <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("F", "M"),
                    party = c("Democrat","Independent", "Republican"))
m

xsq <- chisq.test(m)  # test summary
xsq

xsq$observed   # observed counts (same as m)
xsq$expected   # expected counts under the null
xsq$residuals  # Pearson residuals
xsq$stdres     # standardized residuals
xsq$p.value    # p-value (if p-value is e.g. <= 0.05, groups are different)

# H0 = groups are equal
# HA -> H0 can be rejected with probability of error p-value
# if p-value <= 0.05, groups are different
result <- ifelse(xsq$p.value <= 0.05, "different", "equal")
print(paste("groups are", result ))
