# clear global environment - this does not clear loaded packages:
# it's good practice to always start a new R session

rm(list = ls())



# read data
dt<-read.csv("Datasets/plant_height.csv", header=T)

# use the right separator

dt<-read.csv("Datasets/plant_height.csv", header=T, sep=";")



#get information in the R session
#install.packages("devtools") # we'll get into installing and loading packages in the next video
#library(devtools) 


# session_info()
# ─ Session info ────────────────────────────────────────────────────────
# setting  value                       
# version  R version 4.1.0 (2021-05-18)
# os       macOS Catalina 10.15.7      
# system   x86_64, darwin17.0          
# ui       RStudio                     
# language (EN)                        
# collate  de_CH.UTF-8                 
# ctype    de_CH.UTF-8                 
# tz       Europe/Zurich               
# date     2021-09-10                  
# 
# ─ Packages ────────────────────────────────────────────────────────────
# package     * version date       lib source        
# cachem        1.0.5   2021-05-15 [1] CRAN (R 4.1.0)
# callr         3.7.0   2021-04-20 [1] CRAN (R 4.1.0)
# cli           3.0.1   2021-07-17 [1] CRAN (R 4.1.0)
# crayon        1.4.1   2021-02-08 [1] CRAN (R 4.1.0)
# desc          1.3.0   2021-03-05 [1] CRAN (R 4.1.0)
# devtools    * 2.4.2   2021-06-07 [1] CRAN (R 4.1.0)
# ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.1.0)
# fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.1.0)
# fs            1.5.0   2020-07-31 [1] CRAN (R 4.1.0)
# glue          1.4.2   2020-08-27 [1] CRAN (R 4.1.0)
# lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.1.0)
# magrittr      2.0.1   2020-11-17 [1] CRAN (R 4.1.0)
# memoise       2.0.0   2021-01-26 [1] CRAN (R 4.1.0)
# pkgbuild      1.2.0   2020-12-15 [1] CRAN (R 4.1.0)
# pkgload       1.2.1   2021-04-06 [1] CRAN (R 4.1.0)
# prettyunits   1.1.1   2020-01-24 [1] CRAN (R 4.1.0)
# processx      3.5.2   2021-04-30 [1] CRAN (R 4.1.0)
# ps            1.6.0   2021-02-28 [1] CRAN (R 4.1.0)
# purrr         0.3.4   2020-04-17 [1] CRAN (R 4.1.0)
# R6            2.5.0   2020-10-28 [1] CRAN (R 4.1.0)
# remotes       2.4.0   2021-06-02 [1] CRAN (R 4.1.0)
# rlang         0.4.11  2021-04-30 [1] CRAN (R 4.1.0)
# rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.1.0)
# sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.1.0)
# testthat      3.0.4   2021-07-01 [1] CRAN (R 4.1.0)
# usethis     * 2.0.1   2021-02-10 [1] CRAN (R 4.1.0)
# withr         2.4.2   2021-04-18 [1] CRAN (R 4.1.0)
