library(dplyr)
library(tidyr)
library(tidyverse)

#load datasets
total_antwerp <- read.csv("total_antwerp.csv")
total_amsterdam <- read.csv("total_rotterdam.csv")
total_rotterdam <- read.csv("total_rotterdam.csv")
total_brussels <- read.csv("total_brussels.csv")
total_berlin <- read.csv("total_berlin.csv")



#if roomtype is Entire home/apt then 1, for other roomtypes 0 
total_antwerp$room = ifelse(total_antwerp$room_type == 'Entire home/apt', 1, 0)
total_amsterdam$room = ifelse(total_amsterdam$room_type == 'Entire home/apt', 1, 0)
total_berlin$room = ifelse(total_berlin$room_type == 'Entire home/apt', 1, 0)
total_brussels$room = ifelse(total_brussels$room_type == 'Entire home/apt', 1, 0)
total_rotterdam$room = ifelse(total_rotterdam$room_type == 'Entire home/apt', 1, 0)


#create function which creates boxplots for all variables of interest
boxplots_interest <- function(df) { 
  boxplot(df$average_price, main="Boxplot of average price")
  boxplot(df$average_nights, main="Boxplot of average nights")
  boxplot(df$maximum_nights, main="Boxplot of maximum nights")
  boxplot(df$minimum_nights, main="Boxplot of minimum nights")}



##run for Antwerp data 
#run summary statistics for all numerical variables
summary(total_antwerp$average_price)
summary(total_antwerp$average_nights)
summary(total_antwerp$minimum_nights)
summary(total_antwerp$maximum_nights)

#boxplots for all variables of interest 
boxplots_interest(total_antwerp)

#remove outlier on average price and average_nights
outliers <- boxplot(total_antwerp$average_price, plot=FALSE)$out
total_antwerp <- total_antwerp[-which(total_antwerp$average_price %in% outliers),]

summary(total_antwerp$average_price) #check outliers are gone

outlierst <- boxplot(total_antwerp$average_nights, plot=FALSE)$out
total_antwerp <- total_antwerp[-which(total_antwerp$average_nights %in% outlierst),]

summary(total_antwerp$average_nights) #check outliers are gone 


#make table with count for categorical variables
table(total_antwerp$room_type)
table(total_antwerp$host_is_superhost)
table(total_antwerp$room)
table(total_antwerp$dummy_month_aug)


#run correlations for variables of interest
cor(total_antwerp$average_price, total_antwerp$host_is_superhost) #correlation 
cor(total_antwerp$average_price, total_antwerp$minimum_nights)
cor(total_antwerp$average_price, total_antwerp$dummy_month_aug)

cor(total_antwerp$dummy_month_aug, total_antwerp$average_nights)
cor(total_antwerp$room, total_antwerp$average_price)

#t-tests for variables of interest 
t.test(average_price ~ host_is_superhost, data=total_antwerp) #y = average_price, superhost = x
t.test(average_price ~ room, data=total_antwerp) #y = average_price, room = x


#visualize, plot variables 
plot_pr <- ggplot(total_amsterdam, mapping = aes(x = average_price, y = minimum_nights)) +
  geom_line()

plot_pr

plot(total_antwerp$average_price, total_antwerp$minimum_nights)
plot(total_antwerp$average_price, total_antwerp$maximum_nights)
plot(total_antwerp$average_price, total_antwerp$average_nights)


##for Amsterdam dataset

#run summary statistics for all numerical variables 

sum_price <- summary(total_amsterdam$average_price)
sum_nights_av <- summary(total_amsterdam$average_nights)
sum_nights_min <- summary(total_amsterdam$minimum_nights)
summary(total_amsterdam$maximum_nights)
sum_price
sum_nights_av
sum_nights_min


#boxplots for all variables of interest 
boxplots_interest(total_amsterdam)

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



##for Berlin

sum_price <- summary(total_berlin$average_price)
sum_nights_av <- summary(total_berlin$average_nights)
sum_nights_min <- summary(total_berlin$minimum_nights)
summary(total_berlin$maximum_nights)
sum_price
sum_nights_av
sum_nights_min

#boxplots for all variables of interest 
boxplots_interest(total_berlin)

##remove outlier on average price and average_nights
outliers <- boxplot(total_berlin$average_price, plot=FALSE)$out
total_berlin <- total_berlin[-which(total_brussels$average_price %in% outliers),]

summary(total_berlin$average_price) #check outliers are gone

outlierst <- boxplot(total_berlin$average_nights, plot=FALSE)$out
total_berlin <- total_berlin[-which(total_berlin$average_nights %in% outlierst),]

summary(total_berlin$average_nights) #check outliers are gone 


#make table with count for categorical variables
table(total_berlin$room_type)
table(total_berlin$host_is_superhost)
table(total_berlin$room)
table(total_berlin$dummy_month_aug)


#run correlations for variables of interest
cor(total_berlin$average_price, total_berlin$host_is_superhost) #correlation 
cor(total_berlin$average_price, total_berlin$minimum_nights)
cor(total_berlin$average_price, total_berlin$dummy_month_aug)

cor(total_berlin$dummy_month_aug, total_berlin$average_nights)
cor(total_berlin$room, total_berlin$average_price)

#t-tests for variables of interest 
t.test(average_price ~ host_is_superhost, data=total_berlin) #y = average_price, superhost = x
t.test(average_price ~ room, data=total_berlin) #y = average_price, room = x


#visualize, plot variables 
plot_pr <- ggplot(total_berlin, mapping = aes(x = average_price, y = minimum_nights)) +
  geom_line()

plot_pr

plot(total_berlin$average_price, total_berlin$minimum_nights)
plot(total_berlin$average_price, total_berlin$maximum_nights)
plot(total_berlin$average_price, total_berlin$average_nights)


sum_price <- summary(total_berlin$average_price)
sum_nights_av <- summary(total_berlin$average_nights)
sum_nights_min <- summary(total_berlin$minimum_nights)
summary(total_berlin$maximum_nights)
sum_price
sum_nights_av
sum_nights_min

#boxplots for all variables of interest 
boxplots_interest(total_berlin)

##remove outlier on average price and average_nights
outliers <- boxplot(total_berlin$average_price, plot=FALSE)$out
total_berlin <- total_berlin[-which(total_berlin$average_price %in% outliers),]

summary(total_berlin$average_price) #check outliers are gone

outlierst <- boxplot(total_berlin$average_nights, plot=FALSE)$out
total_berlin <- total_berlin[-which(total_berlin$average_nights %in% outlierst),]

summary(total_brussels$average_nights) #check outliers are gone 


#make table with count for categorical variables
table(total_berlin$room_type)
table(total_berlin$host_is_superhost)
table(total_berlin$room)
table(total_berlin$dummy_month_aug)


#run correlations for variables of interest
cor(total_berlin$average_price, total_berlin$host_is_superhost) #correlation 
cor(total_berlin$average_price, total_berlin$minimum_nights)
cor(total_berlin$average_price, total_berlin$dummy_month_aug)

cor(total_berlin$dummy_month_aug, total_berlin$average_nights)
cor(total_berlin$room, total_berlin$average_price)

#t-tests for variables of interest 
t.test(average_price ~ host_is_superhost, data=total_berlin) #y = average_price, superhost = x
t.test(average_price ~ room, data=total_berlin) #y = average_price, room = x


#visualize, plot variables 
plot_pr <- ggplot(total_berlin, mapping = aes(x = average_price, y = minimum_nights)) +
  geom_line()

plot_pr

plot(total_berlin$average_price, total_berlin$minimum_nights)
plot(total_berlin$average_price, total_berlin$maximum_nights)
plot(total_berlin$average_price, total_berlin$average_nights)


##for rotterdam

#run summary statistics for all numerical variables
sum_price <- summary(total_rotterdam$average_price)
sum_nights_av <- summary(total_rotterdam$average_nights)
sum_nights_min <- summary(total_rotterdam$minimum_nights)
summary(total_rotterdam$maximum_nights)
sum_price
sum_nights_av
sum_nights_min

#boxplots for all variables of interest 
boxplots_interest(total_rotterdam)

#remove outlier on average price and average_nights
outliers <- boxplot(total_rotterdam$average_price, plot=FALSE)$out
total_rotterdam <- total_rotterdam[-which(total_rotterdam$average_price %in% outliers),]

summary(total_rotterdam$average_price) #check outliers are gone

outlierst <- boxplot(total_rotterdam$average_nights, plot=FALSE)$out
total_rotterdam <- total_rotterdam[-which(total_rotterdam$average_nights %in% outlierst),]

summary(total_rotterdam$average_nights) #check outliers are gone 


#make table with count for categorical variables
table(total_rotterdam$room_type)
table(total_rotterdam$host_is_superhost)
table(total_rotterdam$room)
table(total_rotterdam$dummy_month_aug)


#run correlations for variables of interest
cor(total_rotterdam$average_price, total_rotterdam$host_is_superhost) #correlation 
cor(total_rotterdam$average_price, total_rotterdam$minimum_nights)
cor(total_rotterdam$average_price, total_rotterdam$dummy_month_aug)

cor(total_rotterdam$dummy_month_aug, total_rotterdam$average_nights)
cor(total_rotterdam$room, total_rotterdam$average_price)

#t-tests for variables of interest 
t.test(average_price ~ host_is_superhost, data=total_rotterdam) #y = average_price, superhost = x
t.test(average_price ~ room, data=total_rotterdam) #y = average_price, room = x


#visualize, plot variables 
plot_pr <- ggplot(total_rotterdam, mapping = aes(x = average_price, y = minimum_nights)) +
  geom_line()

plot_pr

plot(total_rotterdam$average_price, total_rotterdam$minimum_nights)
plot(total_rotterdam$average_price, total_rotterdam$maximum_nights)
plot(total_rotterdam$average_price, total_rotterdam$average_nights)
