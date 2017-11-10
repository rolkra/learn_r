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

# convert float to integer
round(1.2, 0)   # returns 1
ceiling(1.2)    # returns 2 (rounded to next higher integer)

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

# level of factors
f <- factor(LETTERS[1:5], levels = LETTERS[1:6])
table(f)                # Level F with 0 
table(droplevels(f))    # Only Level A-E

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
as.Date("24-12-17", format = "%d-%m-%y")
as.Date("24.12.2017", format = "%d.%m.%Y")

today <- Sys.Date()     # date yyyymmdd
unclass(today)          # integer (days since 1970-01-01)

# convert date to text
format(Sys.Date(), "%Y")    # year YYYY
format(Sys.Date(), "%m")    # month
format(Sys.Date(), "%B")    # month name
format(Sys.Date(), "%d")    # day
format(Sys.Date(), "%A")    # day name

# time
as.POSIXct("2017-12-24 12:00:00", format = "%Y-%m-%d %H:%M:%S")

now <- Sys.time()       # date time in POSIXct format
unclass(now)            # integer (seconds since 1970-01-01 00:00)

# convert time to text
format(Sys.time(), "%H:%M:%S")

# unknown value
x <- NA
is.na(x)

# no value
x <- NULL
is.null(x)
