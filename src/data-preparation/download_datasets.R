library(dplyr)
library(tidyr)
library(tidyverse)

lis_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/listings.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/listings.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/listings.csv.gz')
cal_urls <- c('http://data.insideairbnb.com/belgium/vlg/antwerp/2022-06-22/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-06-05/data/calendar.csv.gz', 'http://data.insideairbnb.com/the-netherlands/south-holland/rotterdam/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/belgium/bru/brussels/2022-06-15/data/calendar.csv.gz', 'http://data.insideairbnb.com/germany/be/berlin/2022-06-13/data/calendar.csv.gz')

lis_datasets <- lapply(lis_urls, read_csv)
cal_datasets <- lapply(cal_urls, read_csv)

text <- 'Download datasets'
write_lines(text, "gen/data-preparation/temp/download.txt")
