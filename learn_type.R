#############################################################################
## data types
#############################################################################

# check data type
a <- c(1,2,1,2,1,2,2,2,1,1,1,2,1,2,2)
is.numeric(a)

gender <- as.character(a)
is.numeric(gender)
is.factor(gender)
is.character(gender)
typeof(gender)

# convert numeric to character
a <- c(1,2,1,2,1,2,2,2,1,1,1,2,1,2,2)
b <- as.character(a)
is.numeric(b)
is.character(b)

# lists can store different objects
l <- list(a,gender,c("a","b","c"))
l[2]    # returns a list
l[[2]]  # returns a vector

# factors
a <- c(1,2,1,2,1,2,2,2,1,1,1,2,1,2,2)
gender <- factor(a, levels = c(1,2), labels = c("M","F"))

# convert numeric to category (cut)
a <- 1:100
cut(a, breaks = 4, labels = c("LOW","MEDIUM","HIGH","EXTREME"))
cut(a, breaks = c(0,25,50,75,Inf), labels = c("LOW","MEDIUM","HIGH","EXTREME"))
cut(a, breaks = quantile(a, c(0,0.5,1)), labels = c("LOW","HIGH"))

# date
x <- as.Date("2017-01-02")
x + 1

# unknown value
x <- NA
is.na(x)

# no value
x <- NULL
is.null(x)
