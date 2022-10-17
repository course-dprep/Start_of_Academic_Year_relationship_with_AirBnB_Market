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
              'https://github.com/thomassonneveldt/datasets_dprep/raw/main/datasets/ber_calendar.csv.gz')

lis_datasets <- lapply(lis_urls, read_csv)
cal_datasets <- lapply(cal_urls, read_csv)

download.file("https://user-images.githubusercontent.com/112591530/194730733-bf2d0bf2-0655-46f9-96d4-5cb6d6702569.jpg", destfile = "../../gen/paper/temp/model.png",mode = "wb") 
download.file("https://user-images.githubusercontent.com/112591530/196049694-3585dc9d-d527-43d3-90ce-d4c8500ae052.png", destfile = "../../gen/paper/temp/airbnb.png",mode = "wb")

save(cal_datasets,file="../../gen/data-preparation/temp/cal_datasets.RData")
save(lis_datasets,file="../../gen/data-preparation/temp/lis_datasets.RData")