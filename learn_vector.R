#############################################################################
## vector in R
#############################################################################

# create a vector using combine (c function)
a <- c(0,1,2,3,4,5,6,7,8,9,10)

class(a)              # class of varible: numeric
str(a)                # structure
summary(a)            # Min, 1st Qu, Median, Mean, 2rd Qu., Max

# all elements of a vector have the same type
# if not they get convertet
a <- c(1,2,3,4,"5")   # converts all numeric elements to character
a <- c(1,2,3,4,TRUE)  # converts TRUE into 1

a+1                   # add 1 to each element in list: 2,3,4

a <- c(1,2,3)
b <- c(1,2,3)
a+b                   # add each corresponding element: 2,4,6
c(a,b)                # merge Vectors: 1,2,3,1,2,3
append(a, b)          # merge vector using append

a<-c(1:100)
a[2:5]                # subset vector

1:10                  # 1 to 10
seq(1,10,by=2)        # 1,3,5,7,9
seq(1,100,length=7)   # divide into 7 equal intervals

rep(1,10)             # replicate 1 for 10 times
rep(c(1,2,3),10)      # replicate 1,2,3 for 10 times

rep(c(1,2,3), times=10, each=2)     # 1,1,2,2,3,3 for 10 times

LETTERS[1:3]          # A,B,C
letters[1:3]          # a,b,c
month.abb[1:3]        # Jan, Feb, Mar

# generates 10 random values between 1 and 6 (random uniform distribution)
runif(10, 1, 6)       
sample(1:6, 10, replace = TRUE)
# values between 1 and 6 in random order
sample(1:6, 6, replace = FALSE)

# if vector contains NA, the sum is NA
a <- c(1,2,3,4,NA,6,7,8,9)
sum (a)
# use na.rm option!
sum (a, na.rm=TRUE)
# same with mean
mean (a)
mean (a, na.rm=TRUE)

# range
range(1:10)
range(LETTERS)

# quantile
a <- c(0:100)
quantile(a,0.05)      # Wert bei 10% Quantile
quantile(a,0.95)      # Wert bei 10% Quantile
quantile(a, c(0.05, 0.10, 0.5, 0.90, 0.95))

# mean, median, mode, IQR (inter quantile range)
a <- c(0:100)
mean(a)     # average = 50
median(a)   # 50% are max 50
IQR(a)      # 75 - 25 = 50

# var, sd
var(0:100)  # 858.5
sd(0:100)   # 29.3 (square root of var)

# table shows frequency of elements
a <- c(1:10,6:12,10:15)
table (a)

# logical operators on vectors
c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, TRUE)   # result = TRUE, FALSE, TRUE
c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, TRUE)   # result = TRUE (only first element of vector)

