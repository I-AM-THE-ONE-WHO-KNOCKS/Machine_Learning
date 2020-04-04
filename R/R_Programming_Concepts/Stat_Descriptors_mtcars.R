#creating descriptive statistics

#read a the data
cars <- read.csv2(file = "/Data/mtcars.csv", sep = ',', header = TRUE, stringsAsFactors = FALSE)

head(cars)

#create a frequency table
table(cars$gear)

#Get the minimum value
min(cars$mpg)

#get the max value
max(cars$mpg)

#get the avg value
mean(as.numeric(cars$mpg))

#get the median value
median(as.numeric(cars$mpg))

#get the quartiles
quantile(as.numeric(cars$mpg))

#get the standard deviation
sd(cars$mpg)

#get the total value
sum(as.numeric(cars$mpg))

#get the correlation coeff
cor(cars$cyl,
    as.numeric(cars$mpg))

#summary of the data
summary(cars)
