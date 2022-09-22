
remove(list=ls())
cat("\f")

dir <- "C:/Universiteit/Skills Data Prep. & Workflow Mgt/"
setwd(dir)

# dir.create("data")
# dir.create("data_output")
# dir.create("documents")
# dir.create("fig_output")
# dir.create("scripts")

dirdata <- paste0(dir,"data/")
dirdata_output <- paste0(dir,"data_output/")
dirdocuments <- paste0(dir,"documents/")
dirfig_output <- paste0(dir,"fig_output/")
dirscripts <- paste0(dir,"scripts/")


#install.packages("dplyr")
library(dplyr)

#install.packages("tidyr")
library(tidyr)

#install.packages("tidyverse")
library(tidyverse)


# Select urls you want to download
urls = c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/listings.csv.gz', 'http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/calendar.csv.gz')

for (url in urls) {
  filename = paste0(gsub('[^a-zA-Z]', '', url), '.csv') # keep only letter
  filename = gsub('httpdatainsideairbnbcom','', filename) # wipe httpdatainsideairbnbcom from filename
  download.file(url, destfile = paste0(dirdata, filename)) # download file
}

# Create data sets
antwerp_lis <- read_csv(file = paste0(dirdata, 'belgiumvlgantwerpdatalistingscsvgz.csv'))

antwerp_cal <- read_csv(file = paste0(dirdata, 'belgiumvlgantwerpdatacalendarcsvgz.csv'))

# Turn price into a numeric value
antwerp_lis$price <- as.numeric(gsub('\\$|,', '', antwerp_lis$price))

# Select 3 important columns
antwerp_cal <- antwerp_cal %>% select(listing_id, date, available)

# Pivot the data frame wide
antwerp_cal_wide <- antwerp_cal %>% 
  
  pivot_wider(names_from = date,
              values_from = available,
  )

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
