library(dplyr)
library(tidyr)
library(tidyverse)

load("../../gen/data-preparation/temp/cal_datasets.RData")
load("../../gen/data-preparation/temp/lis_datasets.RData")

# Create function that calculates average price in August/September and then only extracts those columns with the id column  
clean_cal_price_aug <- function (dataset) {
  
  # Turn price into a numeric value
  dataset$price <- as.numeric(gsub('\\$|,', '', dataset$price))
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, price)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = price,
    )
  
  
  
  
  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2022-08-15":"2022-09-15")
  
  # Take the average price per listing from August/September
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_price = rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_price <- round(dataset_wide_clean$average_price, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_price)
}  

# Clean up all calendar data sets and only extract the average price in August/September and put them into a new list
clean_cal_price_aug_datasets <- lapply(cal_datasets, clean_cal_price_aug)

# Create function that calculates average maximum nights in August/September and then only extracts those columns with the id column  
clean_cal_nights_aug <- function(dataset){
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, maximum_nights)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = maximum_nights,
    )
  
  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2022-08-15":"2022-09-15")
  
  # Take the average price per listing from August/September
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_nights = rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_nights <- round(dataset_wide_clean$average_nights, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_nights)
  
}

# Clean up all calendar data sets and only extract the average maximum nights in August/September and put them into a new list
clean_cal_nights_aug_datasets <- lapply(cal_datasets, clean_cal_nights_aug)

# Create function that calculates average price in March/April and then only extracts those columns with the id column  
clean_cal_price_mar <- function (dataset) {
  
  # Turn price into a numeric value
  dataset$price <- as.numeric(gsub('\\$|,', '', dataset$price))
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, price)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = price,
    )
  
  
  
  
  # Select only the columns with the listing id and dates from 2023-03-15":"2023-04-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2023-03-15":"2023-04-15")
  
  # Take the average price per listing from March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_price = rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_price  <- round(dataset_wide_clean$average_price, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_price)
}  

# Clean up all calendar data sets and only extract the average price in March/April and put them into a new list
clean_cal_price_mar_datasets <- lapply(cal_datasets, clean_cal_price_mar)

# Create function that calculates average maximum nights in August/September and then only extracts those columns with the id column  
clean_cal_nights_mar <- function(dataset){
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, maximum_nights)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = maximum_nights,
    )
  
  # Select only the columns with the listing id and dates from 2022-03-15 to 2022-04-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2023-03-15":"2023-04-15")
  
  # Take the average price per listing from March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_nights= rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_nights  <- round(dataset_wide_clean$average_nights, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_nights)
  
}

# Clean up all calendar data sets and only extract the average maximum nights in August/September and put them into a new list
clean_cal_nights_mar_datasets <- lapply(cal_datasets, clean_cal_nights_mar)

# Create function that only selects relevant columns from the listings data set
clean_lis <- function(dataset) {
  # Turn price into a numeric value
  dataset$price <- as.numeric(gsub('\\$|,', '', dataset$price))
  # Select only useful columns from listings data set
  dataset <- dataset %>% select(id, room_type, price, minimum_nights, maximum_nights, host_is_superhost)
}

# Clean all listings data sets and put them into a new list
clean_lis_datasets <- lapply(lis_datasets, clean_lis)

# Add dummy variables for start of academic year
add_dummy_aug <- function(dataset) {
  dataset$dummy_month_aug <- 1
  dataset <- dataset %>% select(id, average_price, dummy_month_aug)
}

clean_cal_price_aug_datasets <- lapply(clean_cal_price_aug_datasets, add_dummy_aug)

add_dummy_mar <- function(dataset) {
  dataset$dummy_month_aug <- 0
  dataset <- dataset %>% select(id, average_price, dummy_month_aug)
}

clean_cal_price_mar_datasets <- lapply(clean_cal_price_mar_datasets, add_dummy_mar)

# Add dummy variable for room type
add_dummy_roomtype <- function(dataset){
  dataset$room <- ifelse(dataset$room_type == 'Entire home/apt', 1, 0)
  dataset <- dataset %>% select(id, room_type, price, minimum_nights, maximum_nights, host_is_superhost, room)
}

# Apply function to the datasets
clean_lis_datasets <- lapply(clean_lis_datasets, add_dummy_roomtype)


save(clean_cal_nights_aug_datasets,file="../../gen/data-preparation/temp/clean_cal_nights_aug_datasets.RData")
save(clean_cal_nights_mar_datasets,file="../../gen/data-preparation/temp/clean_cal_nights_mar_datasets.RData")
save(clean_cal_price_aug_datasets,file="../../gen/data-preparation/temp/clean_cal_price_aug_datasets.RData")
save(clean_cal_price_mar_datasets,file="../../gen/data-preparation/temp/clean_cal_price_mar_datasets.RData")
save(clean_lis_datasets,file="../../gen/data-preparation/temp/clean_lis_datasets.RData")
