# clear global environment
rm(list = ls())


# check the class of a variable
someText<- c("This", "is", "some", "text")
str(someText)


# some other variables
someNumber<- 5
someOtherNumber <- 2
str(someNumber)

# This is numeric, this means we can do math with it! 
someNumber + someOtherNumber

# with charachter strings we can't do math
someText * 2


# also numbers can be non-numeric

a<- "2"
str(a)

someNumber * a

# but we can change the class of objects:

a<- as.numeric(a)

someNumber * a


# objects that are numbers can also represent factors

sites<- c(1,5,7,10)
str(sites)

sites<- as.factor(site)

str(sites)

#load the data
data<-read.csv("iris.csv", header=T,sep=",")

#look at the first rows of your data
head(data)

#look at the structure of your data
str(data)

#summarize your data
summary(data)



