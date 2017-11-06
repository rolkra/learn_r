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

# for
a <- LETTERS[1:10]
for (i in seq_along(a)) {
  cat(a[i])
}

#############################################################################
## tidy evaluation
#############################################################################

library(dplyr)
df <- iris

my_count <- function(df, group_by) {
  group_by <- enquo(group_by)
  print(group_by)                       # parameter as quosure
  print(quo_name(group_by)[[1]])        # parameter as text
  
  df %>%
    count(!!group_by)
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

