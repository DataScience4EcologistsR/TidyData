# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<- read.csv("Output/all_sites_pivot.csv",sep=",")

# use group_by to group data frames and then summarize the data per group
# For example we want to calculate the mean height per treatment:

dt_year<- dt %>% group_by(treatment) %>% summarize(mean_height= mean(height))
dt_year

# Maybe it would make more sense sense to take look at the max per species per year: 
dt_year_sp<- dt %>% group_by(treatment,year) %>% summarize(mean_height= mean(height), max_hieght=max(height))
dt_year_sp


# count the number of records per group

dt %>% group_by(year,species, treatment) %>% summarise(n=n())

#count the number of levels per group: how many different species do we have per year? 

dt %>% group_by(year, treatment) %>% summarise(n=n_distinct(species))


# Normalize by group mean
dt_norm<- dt %>% group_by(species,treatment,year) %>% mutate(height_norm= height - median(height))

#dt_norm<- dt %>% group_by(species,treatment,year) %>% mutate(median= mean(height), height_norm= height - mean(height))


