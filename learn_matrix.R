#############################################################################
## matrix
#############################################################################

# defining a matrix
m <- matrix(1:9, byrow = TRUE, ncol = 3)   # matrix 3 x 3, first row filled first
m <- matrix(1:9, byrow = FALSE, ncol = 3)  # matrix 3 x 3, first column filled firest

# defining a matrix with row and column names
m <- matrix(1:9, byrow = FALSE, ncol = 3, 
            dimnames = list(c("row 1", "row 2", "row 3"), c("col 1", "col 2", "col 3")))
m

# changing row and column names
rownames(m) <- c("X","Y","Z")
m
colnames(m) <- c("A","B","C")
m

# select elements of matrix
m[1,1]           # element first row, first column
m[1, ]           # elements in first row
m[ ,1]           # elements in first column
m[1:2,1:2]       # elements in row 1-2 and column 1-2

# calculate 
m * 2

# calculate row and col sum 
rowSums(m)
colSums(m)

# adding a row
rbind(m, c(10,11,12))

# adding a column
cbind(m, c(10,11,12))
