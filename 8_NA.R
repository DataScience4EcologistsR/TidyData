# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_pivot_NA.csv", header=T,sep=",")

#check data
head(dt)
summary(dt)

dt$treatment<-as.factor(dt$treatment)
# R needs to recognize NAs as NAs

# replace certain values  as  NA
dt[dt=="na"]<-NA
is.na(dt$treatment)
dt$year[dt$year=="0"]<-NA


# fill() if e.g.
dt<-dt %>% fill(species)


# Replace NAs with the median
dt1<-dt %>% mutate(width=replace(width, is.na(width),median(width, na.rm = T)))


# only keep complete cases

dt_complete<-dt %>% filter(complete.cases(dt))






