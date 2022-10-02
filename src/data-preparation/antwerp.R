library(dplyr)
library(tidyr)
library(tidyverse)


# Select urls you want to download

listing_urls = c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-09-18/data/listings.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/listings.csv.gz')
calendar_urls = c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-09-18/data/calendar.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/calendar.csv.gz')

for (url in calendar_urls) {
  filename = paste0(gsub('[^a-zA-Z]', '', url), '.csv') # keep only letter
  filename = gsub('httpdatainsideairbnbcom','', filename) # wipe httpdatainsideairbnbcom from filename
  filename = gsub('belgiumvlg', '', filename) # wipe belgiumvlg from filename
  filename = gsub('thenetherlandsnorthholland', '', filename) # wipe thenetherlandsnorthholland from filename
  filename = gsub('thenetherlandssouthholland', '', filename) # wipe thenetherlandssouthholland from filename
  filename = gsub('belgiumbru', '', filename) # wipe belgiumvlg from filename
  filename = gsub('germanybe', '', filename) # wipe belgiumvlg from filename
  filename = gsub('data', '', filename) # wipe data from file name
  filename = gsub('csvgz', '', filename) # wipe csvgz from file name
  download.file(url, destfile = paste0(filename)) # download file
}

datasets <- lapply(urls, read_csv)

datasets <- c('antwerplistings.csv', 'amsterdamlistings.csv', 'rotterdamlistings.csv', 'brusselslistings.csv', 'berlinlistings.csv')


# Create data sets
antwerp_lis <- read_csv(file = 'antwerplistings.csv')

antwerp_cal <- read_csv(file = 'antwerpcalendar.csv')

# Turn price into a numeric value
antwerp_cal$price <- as.numeric(gsub('\\$|,', '', antwerp_cal$price))
antwerp_lis$price <- as.numeric(gsub('\\$|,', '', antwerp_lis$price))
# Select 3 important columns
antwerp_cal <- antwerp_cal %>% select(listing_id, date, price)

antwerp_lis$price <- as.numeric(gsub('\\$|,', '', antwerp_lis$price))

# Select 3 important columns
antwerp_cal <- antwerp_cal %>% select(listing_id, date, available)


# Pivot the data frame wide
antwerp_cal_wide <- antwerp_cal %>% 
  
  pivot_wider(names_from = date,
  values_from = price,
  )

# Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15 and 2023-03-15 to 2023-04-15 
antwerp_cal_wide_clean <- select(antwerp_cal_wide, listing_id, "2022-08-15":"2022-09-15", "2023-03-15":"2023-04-15")

# Take the average price per listing from August/September and March/April
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>% 
  mutate(average_price_aug = rowMeans(antwerp_cal_wide_clean[,2:33])) %>% 
  mutate(average_price_mar = rowMeans(antwerp_cal_wide_clean[,34:65]))

antwerp_cal_wide_clean$average_price_aug  <- round(antwerp_cal_wide_clean$average_price_aug, digits = 2)
antwerp_cal_wide_clean$average_price_mar  <- round(antwerp_cal_wide_clean$average_price_mar, digits = 2)
# Rename listing_id to id so it can be used to merge 
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>%  rename(id = listing_id)
# Select only useful columns from listings dataset and calendar data set
antwerp_lis <- antwerp_lis %>% select(id, room_type, price, minimum_nights, maximum_nights, host_is_superhost)
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>% select(id, average_price_aug, average_price_mar)
# Merge the dataframes 
total_antwerp <- merge(antwerp_cal_wide_clean, antwerp_lis, by="id")

# Read dataset again to get all columns back
antwerp_cal <- read_csv(file = paste0(dirdata, 'belgiumvlgantwerpdatacalendarcsvgz.csv'))
# Select 3 important columns
antwerp_cal <- antwerp_cal %>% select(listing_id, date, minimum_nights)

# Pivot the data frame wide
antwerp_cal_wide <- antwerp_cal %>% 
  
  pivot_wider(names_from = date,
              values_from = minimum_nights,
  )

# Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15 and 2023-03-15 to 2023-04-15 
antwerp_cal_wide_clean <- select(antwerp_cal_wide, listing_id, "2022-08-15":"2022-09-15", "2023-03-15":"2023-04-15")

# Take the average price per listing from August/September and March/April
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>% 
  mutate(average_nights_aug = rowMeans(antwerp_cal_wide_clean[,2:33])) %>% 
  mutate(average_nights_mar = rowMeans(antwerp_cal_wide_clean[,34:65]))

antwerp_cal_wide_clean$average_nights_aug  <- round(antwerp_cal_wide_clean$average_nights_aug, digits = 2)
antwerp_cal_wide_clean$average_nights_mar  <- round(antwerp_cal_wide_clean$average_nights_mar, digits = 2)

# Rename listing_id to id so it can be used to merge 
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>%  rename(id = listing_id)

# Select only useful columns from calendar data set
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>% select(id, average_nights_aug, average_nights_mar)

# Merge the dataframes 
total_antwerp <- merge(antwerp_cal_wide_clean, total_antwerp, by="id")


              
  

# Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15  
antwerp_cal_wide_clean <- select(antwerp_cal_wide, listing_id, "2022-08-15":"2022-09-15")

# Count number of times a listing is available and not available
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>% 
  mutate(num_true = rowSums(antwerp_cal_wide_clean == TRUE)) %>% 
  mutate(num_false = rowSums(antwerp_cal_wide_clean == FALSE))
                                                                
#have to rename listing_id to id so can be used to merge 
antwerp_cal_wide_clean <- antwerp_cal_wide_clean %>%  rename(id = listing_id)
#merging the dataframes 
total_antwerp <- merge(antwerp_cal_wide_clean, antwerp_lis, by="id")


# Save dataset
write_csv(total_antwerp, file = paste0(dirdata_output, "total_antwerp.csv"), append = FALSE, col_names = TRUE)
