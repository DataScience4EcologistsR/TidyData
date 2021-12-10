# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_pivot_NA.csv", header=T,sep=",")


# replace certain values  as  NA
dt[dt=="na"]<-NA
dt$year[dt$year=="0"]<-NA

summary(dt)
is.na(dt)

#check data
head(dt)
summary(dt)

is.na(dt)

# only keep complete cases

dt_complete<-dt[complete.cases(dt),]
# fill() if e.g.

dt %>% fill(species)



