# dependencies
library(dplyr)
library(xlsx)
library(mvtnorm)
library(ggplot2)

"data generation"

# define desired numbers of species, treatments etc.
nspecies = 5
ntreatment = 2
nyear = 6
nsite = 3
nobs = 20 # observations per combination of species x treatment x year x site
ntotal = nspecies * ntreatment * nyear * nsite * nobs

# define columns of data frame
species <- as.factor(rep(1:nspecies, each = ntotal/nspecies))
treatment <- as.factor(rep(1:ntreatment, each = ntotal/(nspecies * ntreatment), nspecies))
year <- rep(1:nyear, each = ntotal/(nspecies * ntreatment * nyear), nspecies * ntreatment)
site <- rep(1:nsite, each = ntotal/(nspecies * ntreatment * nyear * nsite), nspecies * ntreatment * nyear)

# define model matrix and model parameters
df <- data.frame(species, treatment, year)
modelmatrix <- model.matrix(~ species:treatment:year - 1, df) # model matrix with interaction effect
modelmatrix[,c(4,9)] <- sqrt(modelmatrix[, c(4,9)]) # model matrix with non linear effect in time for species 4
beta_height <- c(20, 30, 25, 25, 25, 20, 20, 35, 25, 25) # specify weights that indicate desired interaction
beta_width <- c(20, 25, 15, 25, 25, 20, 15, 25, 25, 25)
beta_leaf_area <- c(6, 8, 5, 6, 6, 6, 6, 8, 6, 6)

# compute means with modelmatrix and betas
height_mean <- modelmatrix %*% beta_height
width_mean <- modelmatrix %*% beta_width
leaf_mean <- modelmatrix %*% beta_leaf_area

# compute model errors
error_height_spec1to3 <- rnorm(3 * ntotal/nspecies, mean = 0, sd = 5) # define homoscedastic errors for species 1-3
error_width_spec1to3 <- rnorm(3 * ntotal/nspecies, mean = 0, sd = 5)
error_leaf_spec1to3 <- rnorm(3 * ntotal/nspecies, mean = 0, sd = 1.4)

error_height_spec4 <- rnorm(ntotal/nspecies, mean = 0, sd = 3) # define homoscedastic errors for species 4
error_width_spec4 <- rnorm(ntotal/nspecies, mean = 0, sd = 3)
error_leaf_spec4 <- rnorm(ntotal/nspecies, mean = 0, sd = 1)

sigma = diag(year[1:(ntotal/nspecies)])
error_height_spec5 <- drop(rmvnorm(1, sigma = 20 * sigma)) # define heteroscedastic errors for species 5
error_width_spec5 <- drop(rmvnorm(1, sigma = 7 * sigma))
error_leaf_spec5 <- drop(rmvnorm(1, sigma = 2 * sigma))

error_height <- c(error_height_spec1to3, error_height_spec4, error_height_spec5)
error_width <- c(error_width_spec1to3,error_width_spec4, error_width_spec5)
error_leaf <- c(error_leaf_spec1to3,error_leaf_spec4, error_leaf_spec5)

# compute observed response
height <- height_mean + error_height
width <- width_mean + error_width
leaf_area <- leaf_mean + error_leaf

# dataframe to excel
dataframe <- data.frame(site, species, year, treatment, height, width, leaf_area)
# dataframe[,5:7] <- round(dataframe[,5:7], 1)
# 
# write.xlsx(dataframe, file = "data.xlsx",
#            sheetName = "tidy-data", append = FALSE, row.names = FALSE)

"examplary data visualization for height"

for (i in 1:nspecies) {
  data = dataframe %>%
    filter(site == 1 & species == i)
  
  print(ggplot(data, aes(x = year, y = height, col = treatment))+
    geom_point(alpha = 0.3)+
    ggtitle(paste("Species ", i)))
}

