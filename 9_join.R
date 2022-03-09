# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<- read.csv("Output/all_sites_pivot.csv",sep=",")

str(dt)

dt$site<- as.factor(dt$site)
dt$year<- as.factor(dt$year)
dt$treatment<- as.factor(dt$treatment)
dt$species<-as.factor(dt$species)

sites<- data.frame(site = as.factor(seq(1:3)), elevation=c(412,616,825),openness_index = c(8,6,6))
      
# merging/joining data with sites information using the common ID site
# all entries from L but only those observations from R whose  ID is in L.
dt_sites<- dt %>% left_join(sites, by= c("site" = "site"))

head(dt_sites)
str(dt_sites)

#we might want too join multiple variables e.g. site and year
temperature<- data.frame(site=as.factor(rep(2:4,3)), year=as.factor(rep(seq(1:3),each=3)), mean_temp= c(22.1,21.9,20.1,24.1,22.8,21.3,21.3,20.9,19.2 ))

str(temperature)

#left join again
dt_temp<- dt_sites %>% left_join(temperature,by = c("site", "year"))
summary(dt_temp)

# if we only want to keep records where we have temperature observations we can use right_join
dt_temp_right<- dt_sites %>% right_join(temperature, by= c("site","year"))
summary(dt_temp_right)

# there are also options to merge two data sets as e.g. full_join and inner_join

               
                         