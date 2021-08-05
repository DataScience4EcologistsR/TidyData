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

# also numbers can be of other classes than numeric/integer
a<- "2"
str(a)
someNumber * a

# but we can change the class of objects:
a<- as.numeric(a)
someNumber * a

#set the working directory
setwd("~/Documents/GitHub/TidyData")

#load the data
data<-read.csv("plant_height.csv", header=T,sep=",")

#look at the first rows of your data
head(data)

#load the data
data<-read.csv("plant_height.csv", header=T,sep=";")


#look at the structure of your data
str(data)

data$site<-as.factor(data$site)
data$year<-as.factor(data$year)
data$plot<-as.factor(data$plot)

#summarize your data
summary(data)



