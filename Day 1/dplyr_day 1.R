library(nycflights13)
nycflights13::flights
# Here, :: to indicate which data to extract from large datasets of nycflights13

# flights is a tibble, a special type of data frame used by the tidyverse to avoid some common gotchas.
# The most important difference between tibbles and data frames is the way tibbles print
# they are designed for large datasets, so they only show the first few rows and only the columns that fit on one screen.

library(dplyr)

# To view whole table, we need to use View() function

View(flights)
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

# choosing the flights which dep_delay was more than 120. No other column value will be changed
flights |>
  filter(dep_delay > 120)

# Use of filter () - using two conditions

flights |>
  filter (month == 1 & day == 1)
  # another example 
flights |>
   filter (year == 2013 & month == 2)

# Use of arrange()
arraged_flights = flights |>
  arrange(year,month,day,dep_time)
# In the above arrange () function, we set four column conditions
# প্রথমে first rowকে ascendind order এ সাজানো হবে। তারপর second column এ একই কাজ করবে। এভাবে চলতে থাকবে যতগুলো column উল্লেখ করা হয়েছে।
# If you provide more than one column name, each additional column will be used to break ties in the values of the preceding columns.
# For example, the following code sorts by the departure time, which is spread over four columns.
# We get the earliest years first, then within a year, the earliest months, etc.
View(arraged_flights)

arranged_flights_2 = flights |>
  arrange(sched_dep_time,arr_time,arr_delay)
View(arranged_flights_2)

arranged_flights_3 = flights |>
  arrange(desc(dep_delay),arr_delay,carrier)

View(arranged_flights_3)

arranged_flights_4 = flights |>
  arrange(dep_delay,desc(arr_delay),carrier)

View(arranged_flights_4)

# To remove duplicate rows containing specific values, distinct() is used
flights |>
  distinct()
# In case to use two variables such as finding all unique origin and destination pairs
flights |>
  distinct(origin,dest)
# if we want to keep the other columns when filtering for unique rows, then

flights |>
  distinct(origin,dest,.keep_all = T)
  