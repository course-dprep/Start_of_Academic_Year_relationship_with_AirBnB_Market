library(dplyr)
library(tidyr)
library(tidyverse)

total_antwerp <- read_csv("../../data/datasets_Antwerp/total_antwerp.csv")
total_amsterdam <- read_csv("../../data/datasets_Amsterdam/total_amsterdam.csv")
total_rotterdam <- read_csv("../../data/datasets_Rotterdam/total_rotterdam.csv")
total_brussels <- read_csv("../../data/datasets_Brussels/total_brussels.csv")
total_berlin <- read_csv("../../data/datasets_Berlin/total_berlin.csv")

#########################
#########################
####### DV price ########
#########################
#########################

# Multiple linear regressions for each city for DV=price (two two-way interactions)
# this regression gives the individual effects of each variable and the interactions between the IV and each moderator (but not between the two moderators)
lm1 <- lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_antwerp)
lm2 <- lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_amsterdam)
lm3 <- lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_berlin)
lm4 <- lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_brussels)
lm5 <- lm(average_price ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_rotterdam)

#Regression summary for each city (DV=price)
regression_price_antwerp <- summary(lm1)
regression_price_amsterdam <- summary(lm2)
regression_price_berlin <- summary(lm3)
regression_price_brussels <- summary(lm4)
regression_price_rotterdam <- summary(lm5)


#########################
#########################
### DV maximum_nights ###
#########################
#########################

# Multiple linear regressions for each city for DV=maximum_nights (two two-way interactions)
# this regression gives the individual effects of each variable and the interactions between the IV and each moderator (but not between the two moderators)
lm6 <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_antwerp)
lm7 <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_amsterdam)
lm8 <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_berlin)
lm9 <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_brussels)
lm10 <- lm(average_nights ~ dummy_month_aug*room + dummy_month_aug*host_is_superhost, total_rotterdam)

# Regression summary for each city (DV=maximum_nights)
regression_avgnights_antwerp <- summary(lm6)
regression_avgnights_amsterdam <- summary(lm7)
regression_avgnights_berlin <- summary(lm8)
regression_avgnights_brussels <- summary(lm9)
regression_avgnights_rotterdam <- summary(lm10)

regression_avgnights_antwerp
regression_avgnights_amsterdam
regression_avgnights_berlin
regression_avgnights_brussels
regression_avgnights_rotterdam


# Plots to check assumptions
plots_price_antwerp <- plot(lm1)
plots_price_amsterdam <- plot(lm2)
plots_price_berlin <- plot(lm3)
plots_price_brussels <- plot(lm4)
plots_price_rotterdam <- plot(lm5)
plots_avgnights_antwerp <- plot(lm6)
plots_avgnights_amsterdam <- plot(lm7)
plots_avgnights_berlin <- plot(lm8)
plots_avgnights_brussels <- plot(lm9)
plots_avgnights_rotterdam <- plot(lm10)

# Save results
save(lm1, lm2, lm3, lm4, lm5, lm6, lm7, lm8, lm9, lm10, file="../../gen/analysis/output/model_results.RData")
save(regression_price_antwerp,regression_price_amsterdam, regression_price_berlin, regression_price_brussels, regression_price_rotterdam, regression_avgnights_antwerp, regression_avgnights_amsterdam, regression_avgnights_berlin, regression_avgnights_brussels, regression_avgnights_rotterdam, file="../../gen/analysis/temp/model_estimation1.RData")
save(plots_price_antwerp, plots_price_amsterdam, plots_price_berlin, plots_price_brussels, plots_price_rotterdam, plots_avgnights_antwerp, plots_avgnights_amsterdam, plots_avgnights_berlin, plots_avgnights_brussels, plots_avgnights_rotterdam, file="../../gen/analysis/temp/model_estimation2.RData")
