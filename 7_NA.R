# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_pivot_NA.csv", header=T,sep=",")

#check data
head(dt)
summary(dt)

is.na(dt)

# fill() if e.g. species is  misisng
