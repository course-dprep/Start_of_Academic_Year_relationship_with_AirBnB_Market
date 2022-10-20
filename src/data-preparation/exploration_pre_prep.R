#load libraries
library(dplyr)
library(tidyr)
library(tidyverse)
library(Hmisc)

#load datasets
load("../../gen/data-preparation/temp/cal_datasets.RData")
load("../../gen/data-preparation/temp/lis_datasets.RData")

#load datasets for each city and safe as city name
antwerp <- cal_datasets[[1]]
amsterdam <- cal_datasets[[2]]
rotterdam <-cal_datasets[[3]]
brussels <- cal_datasets[[4]]
berlin <- cal_datasets[[5]]

ant_listings <- lis_datasets[[1]]
ams_listings <- lis_datasets[[2]]
rot_listings <- lis_datasets[[3]]
brus_listings <- lis_datasets[[4]]
ber_listings <- lis_datasets[[5]]

#Turn price variable to numeric 
antwerp$price <- as.numeric(gsub('\\$|,', '', antwerp$price))
amsterdam$price <- as.numeric(gsub('\\$|,', '', amsterdam$price))
rotterdam$price <- as.numeric(gsub('\\$|,', '', rotterdam$price))
brussels$price <- as.numeric(gsub('\\$|,', '', brussels$price))
berlin$price <- as.numeric(gsub('\\$|,', '', berlin$price))

#have to rename listing_id to id so can be used to merge 
names(antwerp)[names(antwerp) == "listing_id"] <- "id"
names(amsterdam)[names(amsterdam) == "listing_id"] <- "id"
names(rotterdam)[names(rotterdam) == "listing_id"] <- "id"
names(brussels)[names(brussels) == "listing_id"] <- "id"
names(berlin)[names(berlin) == "listing_id"] <- "id"


#merging the dataframes
tot_antwerp <- merge(antwerp, ant_listings, by="id")
tot_amsterdam <- merge(amsterdam, ams_listings, by="id")
tot_rotterdam <- merge(rotterdam, rot_listings, by="id")
tot_brussels <- merge(brussels, brus_listings, by="id")
tot_berlin <- merge(berlin, ber_listings, by="id")

##from here data exploration per dataset

#create function which creates boxplots for all variables of interest
boxplots_interest <- function(df) { 
  boxplot(df$price.x, main="Boxplot of price")
  boxplot(df$maximum_nights.y, main="Boxplot of maximum nights")
  boxplot(df$minimum_nights.x, main="Boxplot of minimum nights")}


## start with Antwerp (1) ##

#summary statistics for variables of interest 
sum_price <- summary(tot_antwerp$price.x)
sum_nights_min <- summary(tot_antwerp$minimum_nights.x)
summary(tot_antwerp$maximum_nights.y)
sum_price
sum_nights_min

#boxplots
boxplots_interest(tot_antwerp)

#make table with count for categorical variables
table(tot_antwerp$room_type)
table(tot_antwerp$host_is_superhost)


##  Amsterdam (2) ##

#summary statistics for variables of interest 
sum_price <- summary(tot_amsterdam$price.x)
sum_nights_min <- summary(tot_amsterdam$minimum_nights.x)
summary(tot_amsterdam$maximum_nights.y)
sum_price
sum_nights_min

#boxplots
boxplots_interest(tot_amsterdam)

#make table with count for categorical variables
table(tot_amsterdam$room_type)
table(tot_amsterdam$host_is_superhost)


##  Rotterdam (3)  ##

#summary statistics for variables of interest 
sum_price <- summary(tot_rotterdam$price.x)
sum_nights_min <- summary(tot_rotterdam$minimum_nights.x)
summary(tot_rotterdam$maximum_nights.y)
sum_price
sum_nights_min

#boxplots
boxplots_interest(tot_rotterdam)

#make table with count for categorical variables
table(tot_rotterdam$room_type)
table(tot_rotterdam$host_is_superhost)


##   Brussels (4)   ##

#summary statistics for variables of interest 
sum_price <- summary(tot_brussels$price.x)
sum_nights_min <- summary(tot_brussels$minimum_nights.x)
summary(tot_brussels$maximum_nights.y)
sum_price
sum_nights_min

#boxplots
boxplots_interest(tot_brussels)

#make table with count for categorical variables
table(tot_brussels$room_type)
table(tot_brussels$host_is_superhost)

##    Berlin (5)  ##

#summary statistics for variables of interest 
sum_price <- summary(tot_berlin$price.x)
sum_nights_min <- summary(tot_berlin$minimum_nights.x)
summary(tot_berlin$maximum_nights.y)
sum_price
sum_nights_min

#boxplots
boxplots_interest(tot_berlin)

#make table with count for categorical variables
table(tot_berlin$room_type)
table(tot_berlin$host_is_superhost)

save(tot_rotterdam, file="../../gen/data-preparation/temp/tot_rotterdam.RData")