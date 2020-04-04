#working with data

#read a the data
cars <- read.csv2(file = "/Data/mtcars.csv", sep = ',', header = TRUE, stringsAsFactors = FALSE)
#peek at the data
head(cars, 5)

#load the dplyr library
library(dplyr)

#select a subset of the columns
temp <- select(.data = cars,
               X, 
               cyl,
               gear,
               mpg)

#inspect the results
head(temp)

#filter a subset of rows
temp <- filter(.data = temp,
               gear == 4)

#inspect the result
head(temp)

#compute a new coumn
temp <- mutate(.data = temp,
               Consumption = as.numeric(mpg) * 0.425)

head(temp)

#group by a column
temp <- group_by(.data = temp,
                 cyl)

head(temp)

#aggregate based on groups
temp <- summarize(.data = temp,
                  avg.consumption = mean(Consumption))

head(temp)

#arrange the rows in decending order
temp <- arrange(.data = temp,
                desc(avg.consumption))

head(temp)

#convert to data frame
efficiency <- as.data.frame(temp)

print(efficiency)


#chain methods together
#all the above command can be chained in on line using piping (%>%) character
efficiency <- cars %>%
  select(X, cyl, gear, mpg) %>%
  filter(gear == 4) %>%
  mutate(Consumption = as.numeric(mpg) * 0.425)  %>%
  group_by(cyl) %>%
  summarize(avg.consumption = mean(Consumption)) %>%
  arrange(desc(avg.consumption)) %>%
  as.data.frame()

print(efficiency)

#save the results to a csv file
write.csv(
  efficiency,
  file = "mtcars_out.csv",
  row.names = FALSE)
