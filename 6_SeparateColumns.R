# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Datasets/all_sites.csv", header=T,sep=",")

#check data
head(dt)

# height and width is in the same coloumn- let's separate it! 
dt<- dt%>% separate(heightwidth_year1, c("height_year1", "width_year1"), sep=",", )
dt<- dt%>% separate(heightwidth_year2, c("height_year2", "width_year2"), sep=",", )
dt<- dt%>% separate(heightwidth_year3, c("height_year3", "width_year3"), sep=",", )

head(dt)
str(dt)

dt<-dt%>% mutate_if(is.character,as.numeric)

#hm....it's still not tidy...
# year is spread across multiple columns

# what if a variable is pread across multiple coloumns? 

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







