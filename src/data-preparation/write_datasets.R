library(dplyr)
library(tidyr)
library(tidyverse)

load("./gen/data-preparation/output/clean_cal_nights_aug_datasets.Rdata")
load("./gen/data-preparation/output/clean_cal_nights_mar_datasets.Rdata")
load("./gen/data-preparation/output/clean_cal_price_aug_datasets.Rdata")
load("./gen/data-preparation/output/clean_cal_price_mar_datasets.Rdata")
load("./gen/data-preparation/output/clean_lis_datasets.Rdata")

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


# Bind rows to get complete dataset
total_antwerp <- bind_rows(total_antwerp_aug, total_antwerp_mar)
total_amsterdam <- bind_rows(total_amsterdam_aug, total_amsterdam_mar)
total_rotterdam <- bind_rows(total_rotterdam_aug, total_rotterdam_mar)
total_brussels <- bind_rows(total_brussels_aug, total_brussels_mar)
total_berlin <- bind_rows(total_berlin_aug, total_berlin_mar)

# Write all data sets as .csv file
write_csv(total_antwerp, "data/datasets_Antwerp/total_antwerp.csv")
write_csv(total_amsterdam, "data/datasets_Amsterdam/total_amsterdam.csv")
write_csv(total_rotterdam, "data/datasets_Rotterdam/total_rotterdam.csv")
write_csv(total_brussels, "data/datasets_Brussels/total_brussels.csv")
write_csv(total_berlin, "data/datasets_Berlin/total_berlin.csv")
