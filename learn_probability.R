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


################################################################################
# plot_norm
################################################################################

plot_norm <- function(mean = 0, sd = 1, test_x = NA, alpha = NA, side = "both", show_text = TRUE)  {
  
  # plot normal distribution
  x <- seq(mean - 3*sd, mean + 3*sd, length.out = 100)
  y <- dnorm(x, mean = mean, sd = sd)
  title = paste0("normal distribution: mean = ", mean, ", sd = ", sd)
  if (!is.na(alpha) & is.na(test_x)) {
    title = paste0(title, "\n", "alpha = ", alpha, ", side = ", side)
  } else if (!is.na(alpha) & !is.na(test_x)) {
    title = paste0(title, "\n", "test x = ", test_x, ", alpha = ", alpha, ", side = ", side)
  } 
  plot(x,y, type = "l", lwd = 4, main = title, ylab = "probability")
  
  # plot mean, sd, test_x
  abline(v = mean, col = "black", lty="dotted", lwd = 1)
  abline(v = mean - sd, col = "black", lty = "dotted", lwd = 1)
  abline(v = mean + sd, col = "black", lty = "dotted", lwd = 1)
  abline(h = 0, col = "darkgrey")
  if (!is.na(test_x)) {
    abline(v = test_x, col = "royalblue", lty = "solid", lwd = 2)
    if (show_text)  {
      text(test_x, max(y)*0.9, test_x, col = "blue")
    }
  }
  
  # if side both, split alpha in left and right
  if (!is.na(alpha) & side == "both") {
    alpha_side = alpha/2
  } else {
    alpha_side = alpha
  }
  
  # plot alpha left side
  if (!is.na(alpha) & (side == "both" | side == "left")) {
  
    x_min = qnorm(alpha_side, mean = mean, sd = sd)
    abline(v = x_min, col = "tomato3", lty = "dotted", lwd = 1)
    if (show_text)  {
      text(x_min, max(y)*0.8, round(x_min,2), col = "red")
    }
    x_alpha <- seq(min(x), x_min, length.out = 50)
    y_alpha <- dnorm(x_alpha, mean = mean, sd = sd)
    x_poly <- c(min(x_alpha), x_alpha, max(x_alpha))
    y_poly <- c(0, y_alpha, 0)
    points(x_poly, y_poly, type = "n")
    polygon(x_poly, y_poly, col = "tomato3", border = "tomato3", density = 40, angle = 135)
    lines(x_alpha, y_alpha, col = "tomato3", lwd = 4)
  } # if side
  
  # plot alpha right side
  if (!is.na(alpha) & (side == "both" | side == "right")) {
    
    x_max = qnorm(1 - alpha_side, mean = mean, sd = sd)
    abline(v = x_max, col = "tomato", lty = "dotted", lwd = 1)
    if (show_text)  {
      text(x_max, max(y)*0.8, round(x_max,2), col = "red")
    }  
    x_alpha <- seq(x_max, max(x), length.out = 50)
    y_alpha <- dnorm(x_alpha, mean = mean, sd = sd)
    x_poly <- c(min(x_alpha), x_alpha, max(x_alpha))
    y_poly <- c(0, y_alpha, 0)
    points(x_poly, y_poly, type = "n")
    polygon(x_poly, y_poly, col = "tomato3", border = "tomato3", density = 40, angle = 135)
    lines(x_alpha, y_alpha, col = "tomato3", lwd = 4)
  } # if side
} # plot_norm

#testing
plot_norm()
plot_norm(mean = 100, sd = 2, alpha = 0.05, side="right", test_x = 103)
plot_norm(mean = 100, sd = 2, alpha = 0.05, side="right", test_x = 103, show_text = FALSE)


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

################################################################################
# Example "The Lady Tasting Tea" (binomial distribution)
################################################################################

# 10 cups of tea, guess if milk before tea
n <- 10

# plot normal distribution
x <- 1:10
y <- dbinom(x, 10, 0.5)
barplot(y, names.arg = x)

# level of significance (Signifikanzniveau) 
# for rejection area (Ablehnungsbereich) 8..10
1 - pbinom(7, 10, 0.5)

# quality (Güte) if real p = 0.8
x <- 1:10
y <- dbinom(x, 10, 0.5)
y2 <- dbinom(x, 10, 0.8)
barplot(y, names.arg = x)
barplot(y2, names.arg = x, col=rgb(0,0,1,alpha=0.3) , add = TRUE)

1 - pbinom(7, 10, 0.8)

# level of significance (Signifikanzniveau) alpha = 0.05
# significance area (Signifikanzbereich) = ?
qbinom(1-0.05, 10, 0.5)
sum(dbinom(9:10, 10, 0.5))

# level of significance (Signifikanzniveau) alpha = 0.06
# significance area (Signifikanzbereich) = ?
qbinom(1-0.06, 10, 0.5)
sum(dbinom(8:10, 10, 0.5))

################################################################################
# Example "chocolate bar" (normal distribution)
################################################################################

# chocolate bar production, 100g +/- 2g standard deviation
# sample of 10, is production ok?
mean <- 100
sd <- 2
alpha <- 0.01
sp <- c(100,97,101,96,98,102,96,100,101,98)

# H0: average of sample = 100
# H1: average of sample != 100

# Normal distribution
x <- seq(90,110, by=0.5)
y <- dnorm(x, mean = mean, sd = sd)
plot(x,y, ylim=c(0,0.7))
lines(x,y)
abline(v=mean, col = "red", lty="dotted")

# average of sample
sp_mean <- mean(sp)
sp_mean
abline(v=sp_mean, col="blue", lty="dotted")

# average of sample is normal distributed 
# the bigger the sample, the smaller the distribution
sd_mean <- sd/sqrt(10)
x2 <- seq(97,103, by=0.2)
y2 <- dnorm(x2, mean = mean, sd = sd_mean)
points(x2,y2, col="red")
lines(x2,y2, col="red")

# is average of sample within the range of variation (100g) ?
qnorm(alpha, mean = mean, sd = sd_mean)
