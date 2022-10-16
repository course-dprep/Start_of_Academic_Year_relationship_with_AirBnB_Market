library(dplyr)
library(tidyr)
library(tidyverse)

total_antwerp <- read_csv("../../data/total_antwerp.csv")
total_amsterdam <- read_csv("../../data/total_amsterdam.csv")
total_rotterdam <- read_csv("../../data/total_rotterdam.csv")
total_brussels <- read_csv("../../data/total_brussels.csv")
total_berlin <- read_csv("../../data/total_berlin.csv")

all_datasets <- list(total_antwerp, total_amsterdam, total_berlin, total_brussels, total_rotterdam)

#########################
#########################
####### DV price ########
#########################
#########################

# Multiple linear regressions for each city for DV=price (two two-way interactions)
lm_average_price <- function (dataset) {
  lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, dataset)
}

all_lm_average_price <- lapply(all_datasets, lm_average_price)

#Regression summary for each city (DV=price)
regression_price_antwerp <- summary(all_lm_average_price[[1]])
regression_price_amsterdam <- summary(all_lm_average_price[[2]])
regression_price_berlin <- summary(all_lm_average_price[[3]])
regression_price_brussels <- summary(all_lm_average_price[[4]])
regression_price_rotterdam <- summary(all_lm_average_price[[5]])


#########################
#########################
### DV maximum_nights ###
#########################
#########################

# Multiple linear regressions for each city for DV=maximum_nights (two two-way interactions)
# this regression gives the individual effects of each variable and the interactions between the IV and each moderator (but not between the two moderators)
lm_avg_nights <- function(dataset) {
  lm_avg_nights <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, dataset)
}

all_lm_avg_nights <- lapply(all_datasets, lm_avg_nights)

# Regression summary for each city (DV=average_nights)
regression_avgnights_antwerp <- summary(all_lm_avg_nights[[1]])
regression_avgnights_amsterdam <- summary(all_lm_avg_nights[[2]])
regression_avgnights_berlin <- summary(all_lm_avg_nights[[3]])
regression_avgnights_brussels <- summary(all_lm_avg_nights[[4]])
regression_avgnights_rotterdam <- summary(all_lm_avg_nights[[5]])

# Plots to check assumptions
plots_price_antwerp <- plot(all_lm_average_price[[1]])
plots_price_amsterdam <- plot(all_lm_average_price[[2]])
plots_price_berlin <- plot(all_lm_average_price[[3]])
plots_price_brussels <- plot(all_lm_average_price[[4]])
plots_price_rotterdam <- plot(all_lm_average_price[[5]])
plots_avgnights_antwerp <- plot(all_lm_avg_nights[[1]])
plots_avgnights_amsterdam <- plot(all_lm_avg_nights[[2]])
plots_avgnights_berlin <- plot(all_lm_avg_nights[[3]])
plots_avgnights_brussels <- plot(all_lm_avg_nights[[4]])
plots_avgnights_rotterdam <- plot(all_lm_avg_nights[[5]])


# Save results
save(all_lm_average_price, all_lm_avg_nights, file="../../gen/analysis/output/model_results.RData")
save(regression_price_antwerp,regression_price_amsterdam, regression_price_berlin, regression_price_brussels, regression_price_rotterdam, regression_avgnights_antwerp, regression_avgnights_amsterdam, regression_avgnights_berlin, regression_avgnights_brussels, regression_avgnights_rotterdam, file="../../gen/analysis/temp/model_estimation1.RData")
save(plots_price_antwerp, plots_price_amsterdam, plots_price_berlin, plots_price_brussels, plots_price_rotterdam, plots_avgnights_antwerp, plots_avgnights_amsterdam, plots_avgnights_berlin, plots_avgnights_brussels, plots_avgnights_rotterdam, file="../../gen/analysis/temp/model_estimation2.RData")
