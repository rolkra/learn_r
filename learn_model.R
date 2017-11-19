#############################################################################
## model
#############################################################################

# simple regression model
df <- iris 
x <- df$Sepal.Length
y <- df$Petal.Length
plot (x,y)
mod <- lm(y~x)
abline(mod, col="red",lty="dotted",lwd=2)

coef(mod)         # shows intercept (y at x=0) and slope (dy/dx) 
residuals(mod)    # shows the residuals (predicted value - real value)
predict(mod)      # predicts 

library(broom)
augment(mod)      # creates a dataframe with real values, predicted values, residuals, ...
