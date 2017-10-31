#############################################################################
## data frame
#############################################################################

# define data frame with 2 columns and 5 rows
df <- data.frame(a = c(1,2,3,4,5), b = c(10,20,30,40,50))
df

class(df)             # show class of variable: data.frame

data()                # show available data sets
df <- iris            # load data set

str(df)               # show structure of dataframe
dim(df)               # show number of lines and columns
names(df)             # show column names
colnames(df)          # show column names (alternative)
summary(df)           # show summary for each column

sapply (df,class)     # show class for each column

head(iris)            # display top 6 rows of dataframe
tail(iris)            # display bottom 6 rows of dataframe

# subset data
df[1:3,1:3]           # display rows 1-3, columns 1-3
df[ ,1:3]             # display all rows, columns 1-3
df[1:3, ]             # display rows 1-3, all columns
df$Species            # Column "Species"

# all rows where Specis="setosa" return TRUE; show only TRUE ones
df <- iris            # load data set
a <- df$Species != "setosa"
df[a, ]
subset(df, Species != "setosa")

# replace Sepal.With == 3.0 with 999
df$Sepal.Width[df$Sepal.Width == 3.0] <- 999
head(df)

#replace ? with NA (in all columns)
df[df == "?"] <- NA

# with subset 
subset(df,Species != "setosa")

# column name show / rename
colnames(df)
colnames(df) <- c("c1","c2","c3","c4","c5")
colnames(df)

# calcuation
meanSepal <- mean(df$Sepal.Width)
sapply(df[ ,1:4], mean)

# number of rows / columns
nrow(df)
ncol(df)

# number of rows
length(df$Species)            
# number of rows with no NULL-value
sum(complete.cases(df$Species))
# number of rows with NULL-Value
length(df$Species) - sum(complete.cases(df$Species))

# attach, detach
df <- iris
attach (df)
length(Species)
detach (df)

# data transformation in base R
df <- iris            
subset(df,Species != "setosa")
transform(df, Sepal.Length = -Sepal.Length)
order(df$Sepal.Length)

# table
table(iris$Species)

# prop.table
m <- matrix(1:4, nrow = 2)
prop.table(m)     # total 100%
prop.table(m, 1)  # each row = 100%
prop.table(m, 2)  # each column = 100%
