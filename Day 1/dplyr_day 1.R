library(nycflights13)
nycflights13::flights
# Here, :: to indicate which data to extract from large datasets of nycflights13

# flights is a tibble, a special type of data frame used by the tidyverse to avoid some common gotchas.
# The most important difference between tibbles and data frames is the way tibbles print
# they are designed for large datasets, so they only show the first few rows and only the columns that fit on one screen.

library(dplyr)
glimpse(flights)

# <int> is short for integer
# <dbl> is short for double (aka real numbers)
# <chr> for character (aka strings)
# <dttm> for date-time

# dplyr basics: 3 things in common
  # The first argument is always a data frame.
  # The subsequent arguments typically describe which columns to operate on using the variable names (without quotes).
  # The output is always a new data frame

# Use of filter() - using one condition

flights |>
  filter(dep_delay > 120)

# Use of filter () - using two conditions

flights |>
  filter (month == 1 & day == 1)
  # another example 
flights |>
   filter (year == 2013 & month == 2)

# Use of arrange()
flights |>
  arrange(year,month,day,dep_time)
# In the above arrange () function, we set four column conditions
# If you provide more than one column name, each additional column will be used to break ties in the values of the preceding columns.
# For example, the following code sorts by the departure time, which is spread over four columns.
# We get the earliest years first, then within a year, the earliest months, etc.

flights |>
  arrange(desc(dep_delay))

# To remove duplicate rows containing specific values, distinct() is used
flights |>
  distinct()
# In case to use two variables such as finding all unique origin and destination pairs
flights |>
  distinct(origin,dest)
# if we want to keep the other columns when filtering for unique rows, then

flights |>
  distinct(origin,dest,.keep_all = T)

flights |>
  filter(arr_delay >= 120 & dep_delay == 0) |>
  filter(dest == "IAH" | dest == "HOU") |>
  filter(carrier == "UA" | carrier == "AA" | carrier == "DL" ) |>
  filter(month == 7 | month == 8 | month ==9)
  
library(dplyr)
carData = mtcars
carData |> relocate(qsec,.before=cyl)
carData |> relocate(cyl, .after = mpg)
carData |> mutate(kmpg = mpg * 3) |>
  relocate(kmpg, .after = mpg)
New_data = carData |> select(cyl, disp, hp)
library(ggplot2)
New_data$cyl = as.factor(New_data$cyl)
ggplot(New_data,aes(x = hp, y = disp, size = cyl))+
  geom_point()+
  geom_smooth(method = lm, se = F)+
  theme_classic()

  