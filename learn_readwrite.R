#############################################################################
## Read / Write Data
#############################################################################

# Set Working Directory
setwd ("U:/R")

# show filenames
filenames <- dir()
# plain filenames without directory
basename(filenames)
# size of files
size_bytes = file.size(filenames)

# Read CSV Data; 
# possible sep: , ; \t 
# Strings mit Anführungszeichen: quote = "\""
# NULL-Values: na.strings=c("-","NA")
data <- read.csv("data.csv", sep=";", header=TRUE, dec=",", na.strings="?")

str(data)

# read and write large csv files
library(data.table)
mydata = fread("c:/mydata.csv")
write.csv(mydata,"C:/R/test.csv")

# import test data from text file (Export SQL Teradata Assistant)
setwd("C:/R")
file <- "customer_sample.txt"
data <- read_delim(file, 
                   "\t", 
                   escape_double = FALSE, 
                   na = "?", 
                   trim_ws = TRUE, 
                   locale = locale(encoding = "UTF8", decimal_mark = ",", grouping_mark = "."))

# import test data from excel file
library(readxl)
setwd("C:/R")
file <- "customer_sample.xlsx"
data <- read_excel(file)
