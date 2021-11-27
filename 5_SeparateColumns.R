# clear global environment
rm(list  = ls())

#load packages
install.packages("tidyverse")
library(tidyverse)

#load data
dt<-read.csv("Datasets/all_sites.csv", header=T,sep=",")

#check data
head(dt)
str(dt)

# height and width is in the same column- let's separate it! 
# for this we can use the command separate()

dt_sep<-separate(dt,heightwidth_year1, c("height_year1","width_year1"),sep=",")

# use piping instead:

dt_sep1<- dt %>% separate(heightwidth_year1, c("height_year1", "width_year1"), sep="," )

# Let's get back to separating...
dt_sep<- dt %>% separate(heightwidth_year1, c("height_year1", "width_year1"), sep="," )  %>%
                separate(heightwidth_year2, c("height_year2", "width_year2"), sep=",")  %>% 
                separate(heightwidth_year3, c("height_year3", "width_year3"), sep=",")


head(dt_sep)
str(dt_sep)

dt_sep<- dt_sep %>% mutate_if(is.character,as.numeric)
str(dt_sep)

write.csv(dt_sep,"Output/all_sites_sep.csv",row.names = F)










