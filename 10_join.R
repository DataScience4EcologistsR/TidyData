# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<- read.csv("Output/all_sites_pivot.csv",sep=",")

# use group_by to group data frames and then summarize the data per group
# For example we want to calculate the mean height per year over all sites/species:

dt_year<- dt %>% group_by(year) %>% summarize(mean_height= mean(height))
dt_year

# Maybe it would make more sense sense
dt_year_sp<- dt %>% group_by(year,species) %>% summarize(mean_height= mean(height), max_hieght=max(height))
dt_year_sp
