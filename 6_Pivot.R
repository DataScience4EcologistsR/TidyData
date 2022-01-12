# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_sep.csv", header=T,sep=",")

#check data
head(dt)


# what if a variable is spread across multiple columns? 

dt_height<- dt%>% select(1:4,6,8)


head(dt_height)

dt_height_long <- dt_height %>% pivot_longer(c(4:6),names_to = "year",values_to = "height")

dt_height_long <- dt_height %>% pivot_longer(c(4:6),names_to = "year",values_to = "height", 
                          names_prefix="height_year")

# We could do this for each variable separately but we can also combine them

dt_long<-dt %>% pivot_longer(
  cols = 4:12,
  names_to = c( "measurment","year"), 
  names_pattern = "(.*)_year(.)",
  values_to = "value"
)

# But now we want our measurements as columns in a second step make it wider again

dt_tidy<-dt_long %>% pivot_wider(
  names_from = c( "measurment"), 
  values_from = "value"
)

write.csv(dt_tidy,"Output/all_sites_pivot.csv" , row.names=F)

