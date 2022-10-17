library(dplyr)
library(tidyr)
library(tidyverse)

lis_urls <- c('https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ant_listings.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ams_listings.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/rot_listings.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/bru_listings.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ber_listings.csv.gz')
cal_urls <- c('https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ant_calendar.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ams_calendar.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/rot_calendar.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/bru_calendar.csv.gz', 
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ber_calendar%20(4).csv.gz')

lis_datasets <- lapply(lis_urls, read_csv)
cal_datasets <- lapply(cal_urls, read_csv)

save(cal_datasets,file="../../gen/data-preparation/temp/cal_datasets.RData")
save(lis_datasets,file="../../gen/data-preparation/temp/lis_datasets.RData")