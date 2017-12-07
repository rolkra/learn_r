#############################################################################
## tidyverse
#############################################################################

# load tidyverse (ggplot2, tibble, tidyr, readr, purrr, dplyr)
library(tidyverse)

#############################################################################
## dplyr
#############################################################################

# converte dataframe to tibble
tbl_iris <- tbl_df(iris)

# glimpse
iris %>% glimpse()

# grammar of data manipulation
# select(), which returns a subset of the columns,
# filter(), that is able to return a subset of the rows,
# arrange(), that reorders the rows according to single or multiple variables,
# mutate(), used to add columns from existing data,
# summarise(), which reduces each group to a single row by calculating aggregate measures.

iris %>% 
  select(Sepal.Length, Sepal.Width, Species) %>% 
  filter(Species == "setosa") %>% 
  mutate(sepal.Calc = Sepal.Length + Sepal.Width) %>% 
  arrange(desc(sepal.Calc))

iris %>% summarise(mean_sl = mean(Sepal.Length, na.rm = TRUE))
  
# group by
iris %>% 
  group_by(Species) %>% 
  summarize(mean_sl = mean(Sepal.Length), max_sl = max(Sepal.Length), n = n())
  
# count (setosa 50, versicolor 50, virginica 50)
iris %>% count(Species)

# distinct values (setosa, versicolor, virginica)
iris %>% distinct(Species)

# number of distinct values (3)
iris %>% summarise(species = n_distinct(Species))

# select
iris %>% select(starts_with("Sepal"))
iris %>% select(ends_with("Length"))
iris %>% select(contains("al"))
iris %>% select(matches("Se.?"))
iris %>% select(-2)

# random sample
iris %>% sample_n(10)

# stratified sample
iris %>% group_by(Species) %>% sample_n(10)

# rank
iris %>% mutate(rank = rank(Sepal.Length)) %>% arrange(-rank)

# translate to sql
translate_sql(data %>% group_by(Species) %>% summarize(n = n()))

#############################################################################
## ggplot2
#############################################################################

library(ggplot2)

# points
iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + geom_abline(intercept = -2.5, slope = 1)
iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + geom_point(shape = 21, size = 1.5, color = "red", fill = "white")

iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + 
    geom_point() + 
    expand_limits(y = 0)    # to ensure that point y=0 is on the plot

diamonds %>% ggplot(aes(x = carat, y = price)) + geom_point() + coord_trans(x = "log10", y = "log10")
diamonds %>% ggplot(aes(x = carat, y = price)) + geom_point() + scale_x_log10() + scale_y_log10()

# boxplot
iris %>% ggplot(aes(x = Species, y = Sepal.Length)) + geom_boxplot()
iris %>% ggplot(aes(x = 1, y = Sepal.Length)) + geom_boxplot()

# bar chart (geom_col)
iris %>% count(Species) %>% ggplot(aes(x=Species, y=n)) + geom_col()

# bar chart (geom_bar)
iris %>% ggplot(aes(Species)) + geom_bar()

# percentage bar chart
comics %>% ggplot(aes(x = id, fill = align)) +
  geom_bar(position = "fill") +
  ylab("proportion")

# density plot (overlapping)
iris %>% ggplot(aes(Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.3)

# facet wrap
iris %>% ggplot(aes(Sepal.Length)) +
  geom_density(color = "blue", fill = "blue") +
  facet_wrap(~ Species)

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
