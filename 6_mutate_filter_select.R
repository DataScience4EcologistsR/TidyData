### Some of the most important function: this is going to be 6

# clear global environment
rm(list  = ls())

#load packages
library(tidyverse)

#load data
dt<-read.csv("Output/all_sites_sep.csv", header=T,sep=",")

#check data
head(dt)


# select() is used to select some columns
year1<- dt%>% select(site, species, treatment, height_year1,width_year1,leafarea_year1 )
year1<- dt%>% select(1:5,10)

# filter() filters rows based on their values
site1<- dt %>% filter(site==1)
treatment1<- dt %>% filter(treatment==1)

treatment1_site2<- dt %>% filter(treatment==1 & site==2)



height_35<- dt %>% filter(height_year1>35 & height_year2>35&height_year3>35)

# mutate() adds new variables

dt_ratio<- dt %>% mutate(ratio_year1= height_year1/width_year1)


# And of course we can make use of piping and combine multiple of the commands


newdata<- dt%>% select(1:5,10) %>% 
  filter(treatment==1 )%>%
  mutate(ratio_year1= height_year1/width_year1)


