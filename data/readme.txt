==========================================================
          D A T A S E T   D E S C R I P T I O N
==========================================================

Name of the dataset: 
total_amsterdam
total_antwerp
total_brussels
total_berlin
total_rotterdam 

----------------------------------------------------------

1. Motivation of data collection (why was the data collected?)

To explore and investigate the B&B market in several cities.
In our case to look at how B&B prices are affected by the start of the academic year. 

2. Composition of dataset (what's in the data?)

A large set of variables describing various aspects of each B&B listing.
Data consists of two seperate dataset "Listings" and "Calender" which were combined to create the dataset for each city. 
These are scraped from the B&B website by Inside B&B and are real world data. 
After filtering these are the variables in the dataset;
- id                    = Airbnb's unique identifier for the listing 
- host_is_superhost     = boolean [t=true; f=false]
- room_type             = categorical variable diplaying the the type of room, 4 options are given; Entire home/apt, Hotel room, Private room or Shared room.
- room                  = binary variable. Transformed room_type, listing “Entire home/apt” as 1 and “Private room”&” Shared room“& “Hotel room” combined as 0.
- price                 = daily price in local currency, numeric. 
- average_price         = mean price for each listing over 30 days, numeric.
- maximum_nights        = maximum number of nights a listing can be rented out. 
- average_nights        = mean maximum_nights for each listing over 30 days, numeric. 
- minimum_nights        = minimum number of nights a listing can be rented out. 
- dummy_month_aug       = dummy variable indicating if the data is from 1 = August/Sept 2022 (start academic year) or 0 = March/April 2023.

3. Collection process (how was the data collected?)

Data is downloaded from web. See src/data-preparation/download_datasets.R. 

4. Preprocessing/cleaning/labeling (how was the data cleaned, if at all?)


Price was converted into a numeric variable. 
Data selection was made to just include data for 15 August to 15 September 2022 and 15 March to 15 April 2023. 
Two datasets for calender and listings were combined to one based on matching "id". 
Outliers were removed from the variables of interest.

5. Uses (how is the dataset intended to be used?)

Used to examine and look into the B&B market in different countries and cities. 

6. Distribution (how will the dataset be made available to others?)

Raw data available for download for others on the Inside Airbnb website. 
Go to; http://insideairbnb.com/get-the-data/

7. Maintenance (will the dataset be maintained? how? by whom?)

None. After the end of the project the datasets will not be updates or maintained by the project members.
The datasets on Inside AirBnB are continuously updated. 
