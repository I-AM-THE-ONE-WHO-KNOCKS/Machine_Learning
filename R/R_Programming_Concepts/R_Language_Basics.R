#Basics

#assign operator
x<-"Hello World"
y = "Hello world"
"Hello" -> z

#implicit printing 
x

#creating variables
l <- TRUE
i <- 123L
n <- 1.23
c <- "ABC 123"
d <- as.Date("2020-02-03")

#displaying variables
l
i
n
c
d

#creating a function
f <- function(x){x+1}

#invoking a function
f(2)

#creating a vector c-> concatination 
v <- c(1, 2, 3)
v

#creating a sequence
s<- 1:5
s

#creating a matrix
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
m

#creating an array
a <- array(data = 1:8, dim = c(2,2,2))
a

#creating a list
l <- list(TRUE, 123L, 2.34, "ABC")
l

#creating a factor
categories <- c ("Male", "Female")
factor <- factor(categories)
factor
levels(factor)
unclass(factor)
 
#creating a data frame
df <- data.frame(Name=c("Cat","Dod","Cow"), 
                 HowMany = c(5, 10, 15),
                 IsPet=c(TRUE, TRUE, FALSE))
df

df[1, 2]
df[1,]
df[,2]
df$HowMany

#subsetting data frames
df[c(2,4),]
df[2:4,]
df[c(TRUE, FALSE, FALSE),]
df[df$IsPet == TRUE,]
df[df$HowMany >10,]
df[df$Name %in% c("Cat","Cow"),]

#R is a vectorized language
1+2
c(1, 2, 3) + c(2, 4, 6)

#named vs ordered arguments
m <- matrix(data = 1:6, nrow = 2, ncol = 3)#named
n <- matrix(1:6, 2, 3)#ordered
m == n
identical(m, n)

#installing packages 
install.packages('dplyr', repos = 'https://cloud.r-project.org')

#loading packages
library("dplyr")

#viewing help
?data.frame


