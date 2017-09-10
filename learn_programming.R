#############################################################################
## Programming Structures
#############################################################################

# ifelse
a <- TRUE
ifelse (a,1,2)

if (1 == 1) print("yes")
if (1 == 1) print("yes") else print("no")
if (1 == 1) {print("yes")} else {print("no")}

#############################################################################
## Class
#############################################################################

myobject <- setClass(Class="myclass", slots=list(cod="character",lbl="character",ord="numeric"))

p1 <- myobject (cod=c("a","b","c"), 
                lbl=c("label_a","label_b","label_c"), 
                ord=c(1,2,3))

#############################################################################
## Error Handling
#############################################################################

result <- tryCatch({
  x <- undefiniert()
},
error = print
)
