#############################################################################
## model
#############################################################################

# simple regression model
df <- iris 
x <- df$Sepal.Length
y <- df$Petal.Length
plot (x,y)
l <- lm(y~x)
abline(l, col="red",lty="dotted",lwd=2)
