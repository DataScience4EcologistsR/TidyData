# clear global environment
rm(list = ls())

#load  the data
lf1 <- list.files("Datasets/all_sites"); lf1 # a list of all files in folder

#apply the same read.csv functionto all files in the list
site_list1 <- lapply(paste("Datasets/all_sites",lf1, sep="/"),
                     read.csv,header=T, sep=";") 

# convert the list in a data frame
dt <- do.call("rbind", site_list1)

#look  at the data
head(dt)

# oh dear it's a mess!! 
# let's do one step at the time

#to deal with  messy data we will use the tidyverse, which is a collection of packages 
install.packages("tidyverse")
library(tidyverse)

dt <-  dt %>% fill(site)

write.csv(dt,"Datasets/all_sites.csv")




