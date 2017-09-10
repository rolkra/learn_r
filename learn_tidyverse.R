#############################################################################
## tidyverse
#############################################################################

# load tidyverse (ggplot2, tibble, tidyr, readr, purrr, dplyr)
library(tidyverse)

#############################################################################
## dplyr
#############################################################################

data <- iris
data %>% glimpse()
data %>% 
  select(Sepal.Length, Sepal.Width, Species) %>% 
  filter(Species == "setosa") %>% 
  mutate(sepal.Calc = Sepal.Length + Sepal.Width) %>% 
  arrange(desc(sepal.Calc))

data %>% count(Species)
data %>% distinct(Species)

data %>% 
  group_by(Species) %>% 
  summarize(mean_sl = mean(Sepal.Length), max_sl = max(Sepal.Length), n = n())

data %>% select(starts_with("Sepal"))
data %>% select(ends_with("Length"))
data %>% select(contains("al"))
data %>% select(matches("Se.?"))

translate_sql(data %>% group_by(Species) %>% summarize(n = n()))

#############################################################################
## ggplot2
#############################################################################

library(ggplot2)

df <- iris
df %>% ggplot(aes(Species)) + geom_bar()
df %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
df %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + geom_abline(intercept = -2.5, slope = 1)

# orientation of text on x-axis 90°
+ theme(axis.text.x = element_text(angle = 90))

#############################################################################
## map functions
#############################################################################

# use tidyverse
library(tibble)
library(purrr)
library(dplyr)

# create test-data
runif(100)
df <- tibble(x = runif(10), y = runif(10), z = runif(10))

# calculate mean for each column
mean(df$x)
mean(df$y)
mean(df$z)

# use map-function instead (to create a double vector)
map_dbl(df, mean)
df %>% map_dbl(mean)

# works with any other function
df %>% map_dbl(min)
df %>% map_dbl(median)
df %>% map_dbl(max)

# map in base R
apply(df, MARGIN = 1, mean)   # calculate mean for each row (result 10 numbers)
apply(df, MARGIN = 2, mean)   # calculate mean for each column (result 3 numbers)
lapply(df, mean)              # calculate mean for each column (creates a list)
sapply(df, mean)              # calculate mean for each column (creates a vector)
