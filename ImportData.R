# clear global environment
rm(list = ls())

#get working directory
getwd()

#set working directory
setwd("~/Documents/GitHub/TidyData")

# read data
data<-read.csv("iris.csv", header=T,sep=",")

#look at the structure of your data
str(data)

#summarize your data
summary(data)

# change the class of a vector
sex<- c(1,2,2,1,1,2,1,1)
str(sex)


sex<-as.factor(sex)
str(sex)


#get information in the R sesission
#install.packages("devtools") # we'll get into installing and loading packages in the next video
require(devtools) 
session_info()

# ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────
# setting  value                       
# version  R version 3.6.2 (2019-12-12)
# os       macOS Catalina 10.15.7      
# system   x86_64, darwin15.6.0        
# ui       RStudio                     
# language (EN)                        
# collate  de_CH.UTF-8                 
# ctype    de_CH.UTF-8                 
# tz       Europe/Zurich               
# date     2021-08-03   