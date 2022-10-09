
# Multiple linear regressions for each city for DV maximum_nights
lm1 <- lm(average_price ~ dummy_month_aug*room*host_is_superhost, total_antwerp)
lm2 <- lm(average_price ~ dummy_month_aug*room*host_is_superhost, total_amsterdam)
lm3 <- lm(average_price ~ dummy_month_aug*room*host_is_superhost, total_berlin)
lm4 <- lm(average_price ~ dummy_month_aug*room*host_is_superhost, total_brussels)
lm5 <- lm(average_price ~ dummy_month_aug*room*host_is_superhost, total_rotterdam)

table_lm1 <- summary(lm1)
table_lm2 <- summary(lm2)
table_lm3 <- summary(lm3)
table_lm4 <- summary(lm4)
table_lm5 <- summary(lm5)

# Multiple linear regressions for each city for DV maximum_nights
lm6 <- lm(maximum_nights ~ dummy_month_aug*room*host_is_superhost, total_antwerp)
lm7 <- lm(maximum_nights ~ dummy_month_aug*room*host_is_superhost, total_amsterdam)
lm8 <- lm(maximum_nights ~ dummy_month_aug*room*host_is_superhost, total_berlin)
lm9 <- lm(maximum_nights ~ dummy_month_aug*room*host_is_superhost, total_brussels)
lm10 <- lm(maximum_nights ~ dummy_month_aug*room*host_is_superhost, total_rotterdam)

table_lm6 <- summary(lm6)
table_lm7 <- summary(lm7)
table_lm8 <- summary(lm8)
table_lm9 <- summary(lm9)
table_lm10 <- summary(lm10)

# Save results
save(table_lm1,table_lm2, table_lm3, table_lm4, table_lm5, table_lm6, table_lm7, table_lm8, table_lm9, table_lm10, file="./gen/analysis/output/model_results.RData")

text <- 'Multiple regressions'
write_lines(text, "gen/data-preparation/temp/multiple_regressions.txt")