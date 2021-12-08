# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_pivot_NA.csv", header=T,sep=",")


# replace certain values  as  NA
dt[dt=="na"]<-NA
dt$site[dt$site=="0"]<-NA

#check data
head(dt)
summary(dt)

is.na(dt)

# fill() if e.g. species is  misisng


