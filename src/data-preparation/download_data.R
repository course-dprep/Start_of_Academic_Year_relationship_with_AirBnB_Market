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

download.file("https://user-images.githubusercontent.com/112591530/196250721-3a241662-ff75-49d7-80b2-5124e6455e42.jpg", destfile = "../../gen/paper/model.png",mode = "wb") 
download.file("https://user-images.githubusercontent.com/112591530/196049694-3585dc9d-d527-43d3-90ce-d4c8500ae052.png", destfile = "../../gen/paper/airbnb.png",mode = "wb")

save(cal_datasets,file="../../gen/data-preparation/temp/cal_datasets.RData")
save(lis_datasets,file="../../gen/data-preparation/temp/lis_datasets.RData")