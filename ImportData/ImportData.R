# clear global environment - this does not clear loaded packages:
# it's good practice to always start a new R sesison

rm(list = ls())



# read data
data<-read.csv("Datasets/iris.csv", header=T,sep=",")

#set the working directory
#setwd("~/Documents/GitHub/TidyData")















#get information in the R sesission
#install.packages("devtools") # we'll get into installing and loading packages in the next video
library(devtools) 
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