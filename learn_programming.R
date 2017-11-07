#############################################################################
## Programming Structures
#############################################################################

# ifelse
a <- TRUE
ifelse (a,1,2)

if (1 == 1) print("yes")
if (1 == 1) print("yes") else print("no")
if (1 == 1) {print("yes")} else {print("no")}
if (1 == 0) {print("not possible")} else if (1 == 1) {print("equal")}

# for (break, next)
a <- LETTERS[1:10]
for (letter in a) {
  cat(letter)
}
for (i in seq_along(a)) {
  cat(a[i])
}

# while (break)
a <- 1
while (a <= 10) {
  print(a)
  a <- a + 1
}

#############################################################################
## Function
#############################################################################

add_one <- function(x) {
  return(x + 1) 
}

#############################################################################
## tidy evaluation
#############################################################################

library(dplyr)
df <- iris

my_count <- function(df, group) {
  group_quo <- enquo(group)
  group_txt <- quo_name(group_by)[[1]])
  print(group_quo)        # parameter as quosure
  print(group_txt)        # parameter as text
  
  df %>%
    count(!!group_quo)
}

my_count(df, Sepal.Length)

#############################################################################
## missing parameter
#############################################################################

my_square <- function(x)  {
  if (missing(x)) stop("need x")
  x*x
}

my_square()

#############################################################################
## Error Handling
#############################################################################

result <- tryCatch({
  x <- undefiniert()
},
error = print
)

#############################################################################
## Debug
#############################################################################

# call the debugger mode
browser()

# start debugger mode on an error
options(error = browser)  # on
options(error = NULL)     # off


#############################################################################
## Class
#############################################################################

myobject <- setClass(Class = "myclass", slots = list(cod = "character", lbl = "character", ord = "numeric"))

p1 <- myobject (cod = c("a","b","c"), 
                lbl = c("label_a","label_b","label_c"), 
                ord = c(1,2,3))

