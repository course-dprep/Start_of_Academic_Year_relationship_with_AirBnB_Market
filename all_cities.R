library(dplyr)
library(tidyr)
library(tidyverse)

lis_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/listings.csv.gz')
cal_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/calendar.csv.gz')

lis_datasets <- lapply(lis_urls, read_csv)
cal_datasets <- lapply(cal_urls, read_csv)



clean_cal_price <- function (dataset) {

  # Turn price into a numeric value
  dataset$price <- as.numeric(gsub('\\$|,', '', dataset$price))
    # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, price)
  
  # Pivot the data frame wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = price,
    )
 



  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15 and 2023-03-15 to 2023-04-15 
  dataset_wide_clean <- select(dataset_wide, listing_id, "2022-08-15":"2022-09-15", "2023-03-15":"2023-04-15")
  
  # Take the average price per listing from August/September and March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_price_aug = rowMeans(dataset_wide_clean[,2:33])) %>% 
    mutate(average_price_mar = rowMeans(dataset_wide_clean[,34:65]))
  
  dataset_wide_clean$average_price_aug  <- round(dataset_wide_clean$average_price_aug, digits = 2)
  dataset_wide_clean$average_price_mar  <- round(dataset_wide_clean$average_price_mar, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_price_aug, average_price_mar)
}  

# Clean up all calendar datasets and only extract the average price in august/september and march/april and put them into a new list
clean_cal_price_datasets <- lapply(cal_datasets, clean_cal_price)

clean_cal_nights <- function(dataset){
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, minimum_nights)
  
  # Pivot the data frame wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = minimum_nights,
    )
  
  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15 and 2023-03-15 to 2023-04-15 
  dataset_wide_clean <- select(dataset_wide, listing_id, "2022-08-15":"2022-09-15", "2023-03-15":"2023-04-15")
  
  # Take the average price per listing from August/September and March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_nights_aug = rowMeans(dataset_wide_clean[,2:33])) %>% 
    mutate(average_nights_mar = rowMeans(dataset_wide_clean[,34:65]))
  
  dataset_wide_clean$average_nights_aug  <- round(dataset_wide_clean$average_nights_aug, digits = 2)
  dataset_wide_clean$average_nights_mar  <- round(dataset_wide_clean$average_nights_mar, digits = 2)
  
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_nights_aug, average_nights_mar)
  
}

# Clean up all calendar data sets and only extract the average minimum nights in august/september and march/april and put them into a new list
clean_cal_nights_datasets <- lapply(cal_datasets, clean_cal_nights)

clean_lis <- function(dataset) {
  # Turn price into a numeric value
  dataset$price <- as.numeric(gsub('\\$|,', '', dataset$price))
  # Select only useful columns from listings dataset
  dataset <- dataset %>% select(id, room_type, price, minimum_nights, maximum_nights, host_is_superhost)
}

# Clean all listings data sets and put them into a new list
clean_lis_datasets <- lapply(lis_datasets, clean_lis)

# Merge the data frames 
total_antwerp <- merge(clean_cal_price_datasets[[1]], clean_cal_nights_datasets[[1]]) %>%  merge(clean_lis_datasets[[1]])
total_amsterdam <-  merge(clean_cal_price_datasets[[2]], clean_cal_nights_datasets[[2]]) %>%  merge(clean_lis_datasets[[2]])
total_rotterdam <-  merge(clean_cal_price_datasets[[3]], clean_cal_nights_datasets[[3]]) %>%  merge(clean_lis_datasets[[3]])
total_brussels <-  merge(clean_cal_price_datasets[[4]], clean_cal_nights_datasets[[4]]) %>%  merge(clean_lis_datasets[[4]])
total_berlin <-  merge(clean_cal_price_datasets[[5]], clean_cal_nights_datasets[[5]]) %>%  merge(clean_lis_datasets[[5]])

# Write all data frames as .csv file
write_csv(total_antwerp, "total_antwerp.csv")
write_csv(total_amsterdam, "total_amsterdam.csv")
write_csv(total_rotterdam, "total_rotterdam.csv")
write_csv(total_brussels, "total_brussels.csv")
write_csv(total_berlin, "total_berlin.csv")
