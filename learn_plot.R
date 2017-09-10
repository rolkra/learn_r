#############################################################################
## plots (base R)
#############################################################################

# boxplot
df <- iris 
boxplot(df$Sepal.Length, main="Length of Sepal", col="grey")

# xy-plot
plot(df$Sepal.Length, df$Pedal.Length, 
     main="XY-Plot",
     xlab="Length of Sepal", 
     ylab="Length of Pedal")

# histogram
hist(df$Sepal.Length, col="grey", main="Histogram", xlab="Length of Sepal")

#barplot
barplot(height = c(1:5), names.arg = LETTERS[1:5], col = "grey", border=FALSE)

#curve
curve(sin, -2*pi, 2*pi, xname="t")
curve(sin(t/2), -2*pi, 2*pi, xname="t", col="grey", lty=2, add=TRUE)

wave <- function(t) sin(t) + sin(t/2) + sin(t/4)
curve(wave, -8*pi, 8*pi, xname="t", main="curve")

#############################################################################
## layout (base R)
#############################################################################

df <- iris 

par(mfrow=c(2,2))     # 4 plots in 2 rows and 2 columns
par(mar=c(2,4,2,2))   # Margins: bottom, left, top, right 

boxplot(df$Sepal.Length, main="Length of Sepal", col="grey")
boxplot(df$Sepal.Width, main="Width of Sepal", col="grey")
boxplot(df$Petal.Length, main="Length of Pedal", col="grey")
boxplot(df$Petal.Width, main="Width of Pedal", col="grey")

# reset display
dev.off()
