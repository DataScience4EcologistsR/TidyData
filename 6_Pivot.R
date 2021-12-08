# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_sep.csv", header=T,sep=",")

#check data
head(dt)
str(dt)


# what if a variable is spread across multiple columns? 

dt2<- dt %>% pivot_longer(c(4,6,8),names_to = "year",values_to = "height", 
                          names_prefix="height_year")

# We could do this for each variable separately but we can also combine them

dt3<-dt %>% pivot_longer(
  cols = 4:12,
  names_to = c( "measurment","year"), 
  names_pattern = "(.*)_year(.)",
  values_to = "value"
)

# in a second step make it wider again

dt4<-dt3 %>% pivot_wider(
  names_from = c( "measurment"), 
  values_from = "value"
)

write.csv(dt4,"Output/all_sites_pivot.csv" , row.names=F)

