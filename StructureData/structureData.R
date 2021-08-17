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


#load the data
dt<-read.csv("Datasets/plant_height.csv", header=T,sep=",")

#look at the first rows of your data
head(dt)

#load the data
dt<-read.csv("Datasets/plant_height.csv", header=T,sep=";")


#look at the structure of your data
str(dt)

dt$site<-as.factor(dt$site)
dt$year<-as.factor(dt$year)
dt$plot<-as.factor(dt$plot)

#summarize your data
summary(dt)



