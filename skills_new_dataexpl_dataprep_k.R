#load packages
library(dplyr)
library(tidyr)
library(tidyverse)

#load data
lis_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/listings.csv.gz')
cal_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/calendar.csv.gz')

lis_datasets <- lapply(lis_urls, read_csv)
cal_datasets <- lapply(cal_urls, read_csv)


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

# Create function that calculates average minimum nights in August/September and then only extracts those columns with the id column  
clean_cal_nights_aug <- function(dataset){
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, minimum_nights)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = minimum_nights,
    )
  
  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2022-08-15":"2022-09-15")
  
  # Take the average price per listing from August/September and March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_nights = rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_nights <- round(dataset_wide_clean$average_nights, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_nights)
  
}

# Clean up all calendar data sets and only extract the average minimum nights in August/September and put them into a new list
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

# Create function that calculates average minimum nights in August/September and then only extracts those columns with the id column  
clean_cal_nights_mar <- function(dataset){
  # Select 3 important columns
  dataset_clean <- dataset %>% select(listing_id, date, minimum_nights)
  
  # Pivot the data set wide
  dataset_wide <- dataset_clean %>% 
    
    pivot_wider(names_from = date,
                values_from = minimum_nights,
    )
  
  # Select only the columns with the listing id and dates from 2022-08-15 to 2022-09-15
  dataset_wide_clean <- select(dataset_wide, listing_id, "2023-03-15":"2023-04-15")
  
  # Take the average price per listing from August/September and March/April
  dataset_wide_clean <- dataset_wide_clean %>% 
    mutate(average_nights= rowMeans(dataset_wide_clean[,2:33]))
  
  dataset_wide_clean$average_nights  <- round(dataset_wide_clean$average_nights, digits = 2)
  # Rename listing_id to id so it can be used to merge 
  dataset_wide_clean <- dataset_wide_clean %>%  rename(id = listing_id)
  
  # Select only useful columns from calendar data set
  dataset_wide_clean <- dataset_wide_clean %>% select(id, average_nights)
  
}

# Clean up all calendar data sets and only extract the average minimum nights in August/September and put them into a new list
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


# Merge price_aug_datasets with nights_aug_datasets and listings 
total_antwerp_aug <- merge(clean_cal_price_aug_datasets[[1]], clean_cal_nights_aug_datasets[[1]]) %>%  merge(clean_lis_datasets[[1]])
total_amsterdam_aug <-  merge(clean_cal_price_aug_datasets[[2]], clean_cal_nights_aug_datasets[[2]]) %>%  merge(clean_lis_datasets[[2]])
total_rotterdam_aug <-  merge(clean_cal_price_aug_datasets[[3]], clean_cal_nights_aug_datasets[[3]]) %>%  merge(clean_lis_datasets[[3]])
total_brussels_aug <-  merge(clean_cal_price_aug_datasets[[4]], clean_cal_nights_aug_datasets[[4]]) %>%  merge(clean_lis_datasets[[4]])
total_berlin_aug <-  merge(clean_cal_price_aug_datasets[[5]], clean_cal_nights_aug_datasets[[5]]) %>%  merge(clean_lis_datasets[[5]])

# Merge price_mar_datasets with nights_mar_datasets and listings 
total_antwerp_mar <- merge(clean_cal_price_mar_datasets[[1]], clean_cal_nights_mar_datasets[[1]]) %>%  merge(clean_lis_datasets[[1]])
total_amsterdam_mar <-  merge(clean_cal_price_mar_datasets[[2]], clean_cal_nights_mar_datasets[[2]]) %>%  merge(clean_lis_datasets[[2]])
total_rotterdam_mar <-  merge(clean_cal_price_mar_datasets[[3]], clean_cal_nights_mar_datasets[[3]]) %>%  merge(clean_lis_datasets[[3]])
total_brussels_mar <-  merge(clean_cal_price_mar_datasets[[4]], clean_cal_nights_mar_datasets[[4]]) %>%  merge(clean_lis_datasets[[4]])
total_berlin_mar <-  merge(clean_cal_price_mar_datasets[[5]], clean_cal_nights_mar_datasets[[5]]) %>%  merge(clean_lis_datasets[[5]])


##try some stuff 

total_antwerp_aug$dummy_month_aug <- 1
total_antwerp_mar$dummy_month_aug <- 0
total_amsterdam_aug$dummy_month_aug <- 1
total_amsterdam_mar$dummy_month_aug <- 0
total_berlin_aug$dummy_month_aug <- 1
total_berlin_mar$dummy_month_aug <- 0
total_brussels_aug$dummy_month_aug <- 1
total_brussels_mar$dummy_month_aug <- 0
total_rotterdam_aug$dummy_month_aug <- 1
total_rotterdam_mar$dummy_month_aug <- 0

####more dummies

#if roomtype is Entire home/apt then 1, for other roomtypes 0 
total_antwerp$room = ifelse(total_antwerp$room_type == 'Entire home/apt', 1, 0)
total_amsterdam$room = ifelse(total_amsterdam$room_type == 'Entire home/apt', 1, 0)
total_berlin$room = ifelse(total_berlin$room_type == 'Entire home/apt', 1, 0)
total_brussels$room = ifelse(total_brussels$room_type == 'Entire home/apt', 1, 0)
total_rotterdam$room = ifelse(total_rotterdam$room_type == 'Entire home/apt', 1, 0)

# Bind rows to get complete dataset
total_antwerp <- bind_rows(total_antwerp_aug, total_antwerp_mar)
total_amsterdam <- bind_rows(total_amsterdam_aug, total_amsterdam_mar)
total_rotterdam <- bind_rows(total_rotterdam_aug, total_rotterdam_mar)
total_brussels <- bind_rows(total_brussels_aug, total_brussels_mar)
total_berlin <- bind_rows(total_berlin_aug, total_berlin_mar)

# Write all data sets as .csv file
write_csv(total_antwerp, "total_antwerp.csv")
write_csv(total_amsterdam, "total_amsterdam.csv")
write_csv(total_rotterdam, "total_rotterdam.csv")
write_csv(total_brussels, "total_brussels.csv")
write_csv(total_berlin, "total_berlin.csv")

####data exploration

#have to repeat all this for each dataset, not done so yet 

#run summary statistics for all numerical variables 
summary(total_amsterdam$average_price)
summary(total_amsterdam$average_nights)
summary(total_amsterdam$minimum_nights)
summary(total_amsterdam$maximum_nights)

##remove outlier on average price and average_nights
outliers <- boxplot(total_amsterdam$average_price, plot=FALSE)$out
total_amsterdam <- total_amsterdam[-which(total_amsterdam$average_price %in% outliers),]

summary(total_amsterdam$average_price) #check outliers are gone

outlierst <- boxplot(total_amsterdam$average_nights, plot=FALSE)$out
total_amsterdam <- total_amsterdam[-which(total_amsterdam$average_nights %in% outlierst),]

summary(total_amsterdam$average_nights) #check outliers are gone 


#make table with count for categorical variables
table(total_amsterdam$room_type)
table(total_amsterdam$host_is_superhost)
table(total_amsterdam$room)
table(total_amsterdam$dummy_month_aug)


#run correlations for variables of interest
cor(total_amsterdam$average_price, total_amsterdam$host_is_superhost) #correlation 
cor(total_amsterdam$average_price, total_amsterdam$minimum_nights)
cor(total_amsterdam$average_price, total_amsterdam$dummy_month_aug)

cor(total_amsterdam$dummy_month_aug, total_amsterdam$average_nights)
cor(total_antwerp$room, total_antwerp$average_price)

#t-tests for variables of interest 
t.test(average_price ~ host_is_superhost, data=total_amsterdam) #y = average_price, superhost = x
t.test(average_price ~ room, data=total_amsterdam) #y = average_price, room = x


#visualize, plot variables 
plot_pr <- ggplot(total_amsterdam, mapping = aes(x = average_price, y = minimum_nights)) +
  geom_line()

plot_pr

plot(total_amsterdam$average_price, total_amsterdam$minimum_nights)
plot(total_amsterdam$average_price, total_amsterdam$maximum_nights)
plot(total_amsterdam$average_price, total_amsterdam$average_nights)

#boxplots for all variables of interest 
boxplot(total_amsterdam$average_price)
boxplot(total_amsterdam$average_nights)
boxplot(total_amsterdam$maximum_nights)
boxplot(total_amsterdam$minimum_nights)

##regression
lm1<- lm(average_price ~ room_type + host_is_superhost + dummy_month_aug, total_antwerp)
lm2<- lm(average_price ~ room_type + host_is_superhost + dummy_month_aug, total_amsterdam)
lm3<- lm(average_price ~ room_type + host_is_superhost + dummy_month_aug, total_berlin)
lm4<- lm(average_price ~ room_type + host_is_superhost + dummy_month_aug, total_brussels)
lm5<- lm(average_price ~ room_type + host_is_superhost + dummy_month_aug, total_rotterdam)

summary(lm1)
summary(lm2)
summary(lm3)
summary(lm4)
summary(lm5)

annova(lm1)
