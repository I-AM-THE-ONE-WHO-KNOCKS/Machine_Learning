#creating data visulization 

#read a the data
cars <- read.csv2(file = "/Data/mtcars.csv", sep = ',', header = TRUE, stringsAsFactors = FALSE)

head(cars)

#load ggplot2 library
library(ggplot2)

#create a frequency bad chart
ggplot(
  data = cars,
  aes(x=gear))+
  geom_bar()+
  ggtitle("count of cars by gear type")+
  xlab("gear")+
  ylab("count of cars")
  
  
#create a histogram
ggplot(
       data=cars,
       aes(x = as.numeric(mpg))) +
  geom_histogram(bins = 20)+
  ggtitle("Distribution of fuel economy")+
  xlab("Fuel Economy (mpg)")+
  ylab("count of cars")

#creat a density plot
ggplot(
  data = cars,
  aes(x=as.numeric(mpg)))+
  geom_density()+
  ggtitle("Distribution of fuel economy")+
  xlab("fuel economy (mpg)")+
  ylab("Density")

#create a scatter plot
ggplot(
  data = cars,
  aes(x= cyl,
      y = as.numeric(mpg)))+
  geom_point()+
  ggtitle("fuel economy by cylinders")+
  xlab("Num of cylinders")+
  ylab("fuel economy (mpg)")
