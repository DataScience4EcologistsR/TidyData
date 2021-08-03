# clear global environment
rm(list = ls())

# install packages
install.packages("dplyr")

# more elegant way to load missing packages: 

list.of.packages <- c("dplyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#load packages
library(dplyr)

#get working directory
getwd()

#set working directory
setwd("~/Documents/GitHub/TidyData")

# read data
data<-read.csv("iris.csv")

#look at the structure of your data
str(data)

#summarize your data
summary(data)

