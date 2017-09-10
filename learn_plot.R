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

#############################################################################
## Colors
#############################################################################

# show list of pre defined colors
colors()

# use RColorBrewer to find nice colors
library(RColorBrewer)

# display.brewer.all()
# display.brewer.pal(9, "Blues")
wc_col <- brewer.pal(9, "Blues")  # color blue in 9 steps
wc_col <- wc_col[c(-1,-2)]        # remove first two colors

# dark green "#7dba00", medium green "#add35e", light green "#d8eab2"
# dark grey "#525252", medium grey "#7f7f7f", light grey "#b2b2b2", very light grey "#cccccc"


