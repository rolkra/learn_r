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
gender <- factor(gender, levels = c(2,1))   # change order of factors

# order of factors
target <- c("churn", "no churn", "no churn", "churn")
target <- factor(target, levels = c("churn", "no churn"))
target
target <- factor(target, levels = c("no churn", "churn")) 
target

# convert numeric to category (cut)
a <- 1:100
cut(a, breaks = 4, labels = c("LOW","MEDIUM","HIGH","EXTREME"))
cut(a, breaks = c(0,25,50,75,Inf), labels = c("LOW","MEDIUM","HIGH","EXTREME"))
cut(a, breaks = quantile(a, c(0,0.5,1)), labels = c("LOW","HIGH"))

# boolean
a <- c(FALSE, TRUE, FALSE)
any(a)                  # TRUE, if any element of vector is TRUE
as.logical(c(0,1,2,3))  # 0 = TRUE, >0 = FALSE

# date
x <- as.Date("2017-01-02")
x + 1

# unknown value
x <- NA
is.na(x)

# no value
x <- NULL
is.null(x)
