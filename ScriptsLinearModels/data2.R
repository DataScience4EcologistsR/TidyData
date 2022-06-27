library(xlsx)
library(mvtnorm)
library(dplyr)
library(tidyr)

"create data in tidy form"

site <- rep(1:3, each = 18)
species <- rep(1:3, each = 6, 3)
treatment <- rep(1:2, each = 3, 9)
year <- rep(1:3, 18)
height <- c(30, 60, 90, 30, 60, 90, 50, 100, 150, 40, 80, 120, 20, 40, 60, 40, 80, 120)
height <- rep(height, 3)
height <- drop(height + rmvnorm(1, mean = rep(0, length(height))))
width <- c(3, 6, 9, 3, 6, 9, 4, 6, 12, 3, 6, 9, 2, 4, 8, 3, 6, 9)
width <- rep(width, 3)
width <- drop(width + rmvnorm(1, mean = rep(0, length(width)))/10)
leaf_area <- c(5, 10, 15, 5, 10, 15, 6, 12, 18, 4, 8, 12, 5, 10, 15, 6, 12, 18)
leaf_area <- rep(leaf_area, 3)
leaf_area <- drop(leaf_area + rmvnorm(1, mean = rep(0, length(leaf_area)))/10)

tidydata <- data.frame(site, species, treatment, year, height, width, leaf_area)

# data frame to excel

tidydata[,5:7] <- round(tidydata[,5:7], 2)
write.xlsx(tidydata, file = "tidydata.xlsx", 
           sheetName = "tidy-data", append = FALSE, row.names = FALSE)

"derive untidy form from tidy data"

# unite height and width

tidydata_united <- tidydata %>%
  unite(height_width, height, width, sep = ",")

#split data frame (necessary to get pivot_wider to work)

tidydata_heightwidth = tidydata_united[,-6]
tidydata_leafarea = tidydata_united[,-5]

# bring in wide form and join together

wider_heightwidth =tidydata_heightwidth %>%
  pivot_wider(names_from = year, values_from = height_width, names_prefix = "heightwidth_year")

wider_leafarea =tidydata_leafarea %>%
  pivot_wider(names_from = year, values_from = leaf_area, names_prefix = "leafarea_year")

untidydata <- left_join(wider_heightwidth, wider_leafarea)
untidydata <- as.data.frame(untidydata)

# separate into three data frames depending on site and save in separate excel sheet

untidydata1 <- untidydata %>%
  filter(site == 1)
untidydata1$site[-1] <- NA

write.xlsx(untidydata1, file = "untidydata.xlsx", 
           sheetName = "site1", append = FALSE, row.names = FALSE)

untidydata2 <- untidydata %>%
  filter(site == 2)
untidydata2$site[-1] <- NA

write.xlsx(untidydata2, file = "untidydata.xlsx", 
           sheetName = "site2", append = TRUE, row.names = FALSE)

untidydata3 <- untidydata %>%
  filter(site == 3)
untidydata3$site[-1] <- NA

write.xlsx(untidydata3, file = "untidydata.xlsx", 
           sheetName = "site3", append = TRUE, row.names = FALSE)
