# The relationship between the start of the academic year and the AirBnB market in student cities in Western Europe

## Project Summary
This project uses archival data from the AirBnB website to analyse the relationship between the beginning of the academic year and the AirBnB market in five major Western-European cities.
It investigates whether the prices and the average nights for which an accomodation can be rented differ significantly at the beggining of the academic year compared to a regular period during the academic year (not close to beginning/end of academic year and when no official big holidays take place) and takes into consideration the moderating role of the type of AirBnB host (ordinary vs superhost) and the type of accomodation (entire apartment vs single room).

![airbnb-logo-and-student3](https://user-images.githubusercontent.com/112591530/196049694-3585dc9d-d527-43d3-90ce-d4c8500ae052.png)


## Contents
[1. Introduction](#1-introduction) 

   - [Problem Background and Research Motivation](#11-problem-background-and-research-motivation)

   - [Problem Statement and Research Questions](#12-problem-statement-and-research-questions)

   - [Conceptual Model](#13-conceptual-model)

[2. Methodology](#2-methodology)

[3. Main Results and conclusion](#3-main-results-and-conclusion)

[4. Repository Overview](#4-repository-overview)

   - [Repository Contents](#41-repository-contents)

   - [Repository Structure](#42-repository-structure)

[. Instructions to Run the Project](#5-instructions-to-run-the-project)
   - [Software Setup](#51-software-setup)
   - [Run the Code](#52-run-the-code)

[About Us](#about-us)

[References](#references)


## 1. Introduction
### 1.1 Problem Background and Research Motivation
At the start of the academic year, many university students need temporary accomodation while they are arranging their documents and looking for permanent housing. Therefore, they often stay temporarily at AirBnB accommodations. In a recent study on the determinants of AirBnB listings' performance, Sainaghi et al. (2021) concludes that seasonality, and certain events can have a significant impact on the prices of listings. Hence, this project aims to investigate how the AirBnb market in various Western-European cities is related to the period of the start of the academic year. The research will focus on analyzing the relationships between the start of the academic year and the AirBnB prices, as well as the maximum nights and accommodation can be booked for. In addition, the effect of the type of host (ordinary vs proffessional) and type of accommodation (room vs apartment) on the abovementioned relationships will be investigated.

The research will be executed for five major student cities in three Western-European countries: Belgium (Antwerp, Brussels), Germany (Berlin), The Netherlands (Amsterdam, Rotterdam).


### 1.2 Problem Statement and Research Questions
*To what extent does the start of the Academic year affect the AirBnB market in popular student cities in Europe?*

- How are the AirBnB prices related to the period of the academic year (beginning vs regular period)?
- How does the relationship between AirBnB prices and period of the academic year depend on the type of host (ordinary vs superhost)?
- How does the relationship between AirBnB prices and period of the academic year depend on the type of accommodation (room vs apartment)?

- How is the maximum number of nights per accommodation related to the period of the academic year (beginning vs regular period)?
- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of host (ordinary vs superhost)?
- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of accommodation (room vs apartment)?


### 1.3 Conceptual model

![conceptual-model-final-for-real](https://user-images.githubusercontent.com/112591530/196039306-1a0a3f17-5bad-40aa-863d-b69ba2840fca.jpg)


## 2. Methodology

### 2.1 Data
This project uses publicly available archival data from AirBnB. In total, ten datasets are retrieved from the AirBnB website, two for each city of interest. Every two datasets per city are merged into one based on listing id and the data is explored and prepared.

The data used in the analysis is for two time periods which serve as a "beginning of the academic year" period (Aug 15 - Sep 15 2022), and control period (March 15 - April 15, 2023.
Note: the second time period is in the future, because AirBnB provides the information regarding listings ahead of time since the hosts set the prices and number of nights for which they rent out their accomodation in advance.

The data transformation process is explained in detail in the *report* file within the *scr* directory in this repository, as well as the final paper of this project.

|Variable|Description|
|:---|:---|
|id| Airbnb's unique identifier for the listing|
|host_is_superhost| Boolean [t=true; f=false] (distinguishes between two types of hosts)|
|room_type| Categorical variable displaying the the type of room, 4 options are given; Entire home/apartment, Hotel room, Private room or Shared room.|
|room| Binary variable. Transformed room_type, listing "Entire home/apartment" as 1 and "Private room" &" Shared room" & "Hotel room" combined as 0.|
|price| Daily price in local currency, numeric.|
|average_price| Mean price for each listing over 30 days, numeric.|
|maximum_nights| Maximum number of nights a listing can be rented out.|
|average_nights| Mean maximum_nights for each listing over 30 days, numeric.|
|minimum_nights| Minimum number of nights a listing can be rented out.|
|dummy_month_aug| Dummy variable to distinguish between the two time peridos: Aug/Sept listings as 1, and March/April as 0.|

### 2.2 Research Method


### 2.3 Analysis

We have two models, each with three independent variables ("start of the academic year", "type of host", and "type of accomodation"), and a dependent variable ("price" in the first model and "number of maximum nights" in the second model).
Since there are three categorical explanatory variables, and a continuous dependent variable in each model, we perform linear regressions to analysie the relationships.
As we investigate the relationships for each of the two models with data for 5 different cities, there are ten linear regressions in total.
Due to the fact that the focus of our research is to identify whether the start of the academic year, represented by "dummy_month_aug" is related to the DVs, and also to see whether this relationship depends on the moderators, we have introduced interaction effects between the IV of the study and the moderators ("room" and "host_is_superhostTRUE").


## 3. Main Results and Conclusion

*Main Results*
When running the regression we have checked the effect of the independent variable namely 'dummy_month_aug' for each of the five cities on the two dependent variables; 'average_price' and 'average_nights'. As the focus of our research is to identify whether the start of the academic year, represented by 'dummy_month_aug', has an effect on the DVs and also to see whether this effect depends on the moderators, we have introduced interaction effects between the IV of the study and the moderators, namely 'room' and 'host_is_superhostTRUE'.

Regarding the relationship between the start of the academic and the AirBnB prices, there were no significant results that we obtained are for the cities. 
With regards to the relationship between the start of the academic and the average maximum nights for which an accomodation is available there was no significant relationship. 

There were some significant effect from the moderators on price and on average maximum nights. 

```{r}
```


## 4. Conclusion

According to the expectations of this analysis we would have found that the start of the academic year will positively influence the average price of Airbnbs, as students in need of temporary housing use Airbnb's services to find accommodation, resulting in higher demand and hosts increasing prices. Unfortunately none of our regression had significant results for the effect of the start of the academic year on the price.

Another expectation of the study was that average nights would increase as well at the start of the academic year, since students looking for permanent accommodation might need a few weeks or even months to succeed. Despite these expectations we found no significant effects for average nights for any of the cities, therefore, we can conclude that the start of the academic year has no significant effect on the average maximum nights Airbnbs are available. 

Next we will answer the questions we formulated at the start of this paper:

\- How are the Airbnb prices related to the period of the academic year (beginning vs regular period)?
Based on our results it does not appear to be as our regression models did not find any significant effects for the start of the academic year. 

\- How does the relationship between Airbnb prices and period of the academic year depend on the type of host (ordinary vs superhost)?
This interaction is not significant for any of the cities. But for most cities there was a positive effect caused by superhost. With superhost causing an increase in price of 3.74 euros to over 14 euros depending on the city. But it does cause a decrease for Amsterdam and Rotterdam.  

\- How does the relationship between Airbnb prices and period of the academic year depend on the type of accommodation (room vs apartment)?
This interaction is not significant for any of the cities. But the type of accommodation does have a positive effect on price for all of the cities. 

\- How is the maximum number of nights per accommodation related to the period of the academic year (beginning vs regular period)?
Based on our results it does not appear to be as our regression models did not find any significant effects for the start of the academic year. 

\- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of host (ordinary vs superhost)?
This interaction is not significant for any of the cities. But for all of the cities besides Rotterdam there is a positive effect caused by superhost on average maximum number of nights.

\- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of accommodation (room vs apartment)?
This interaction is not significant for any of the cities. But for Amsterdam, Berlin, Brussels there is a positive effect caused by roomtype on average maximum number of nights.

```{r}
```
## 5. Discussion

Overall, this research did not find enough significant effects to draw meaningful generalizable conclusions. There are various reasons that could have caused this. First of all, this project used archival data that has not been collected for the purpose of such research. Therefore, we could not control for the quality of the data. The lack of significant effects in the model can be due to the large amount of observations in the sample. Another possible explanation can be that not many students use Airbnb's services in these cities. We also have to keep in mind we are comparing the data from 2022 to 2023. So the prices listed for March/April might be changed closer to that time.

The prices increasing when the host is a superhost for all cities besides Amsterdam and Rotterdam is interesting as we thought the superhost might have lower pricing as they can access bulk buying options for materials and can hire cleaners. That Rotterdam and Amsterdam are different is also curious. The type of room causing an increase in price for all cities makes sense. As it is logical a whole appartement will be more expencive than a single room.

The average number of maximum nights going up for superhost for all cities but Rotterdam makes sense. As superhost are not renting out just a room in their home they might need themselves at times but a professional business. So having their bnb's available for longer is logical.

The average number of maximum nights going up for roomtype for Amsterdam, Berlin and Brussels makes sense too. As the cleaning and such for a large appartement is likely more work than for a single room, so offering the appartement for longer means less work for them. Furthermore full appartements likely attract people renting for different reasons than those renting a single room. 

We do not have enough information to make conclusions on the few significant relationships we see between our DV and the moderators. 

In conclusion, further research is needed to confirm or reject the relationships between the variables in our models. It might be useful to repeat the research later in time, as well as for other student cities.


## 4. Repository Overview
### 4.1 Repository Contents
The repository consists of three main directories, namely, "data", "src", and "gen". 
|Directory|Contents|Notes|
|:---|:---|:---|
|data| data files| those are not uploaded on GitHub but can be retreived on the user's local machine by running the respective script. In GitHub, the user will find a readme file which gives information about the data files contents and the data manipulation performed|
|src| the source code of the project||
|gen| stores all generated files||
|src/data-preparation| source code for retrieving the data, raw data exploration, and data preparation||
|gen/data-preparation| output from the data preparation|sub-directories: for storing any temporary files ("temp"), and final products from the various stages in the pipeline ("output")|
|src/analysis| source code for the prepared data exploration and data analysis||
|gen/analysis| output from the data analysis|sub-directories: for storing any temporary files ("temp"), and final products from the various stages in the pipeline ("output")|
|src/paper| the .Rmd file for the final deliverable of the project||
|gen/paper| the knitted pdf of the final report||


*(Additional Note: There are makefiles in the general directory, as well as all sub-directories of the "src" folder as those are used for the pipeline automation.)*
	 

### 4.2 Repository Structure

	├── README.md
	├── data
	├── gen
	│   ├── analysis
	│   │   ├── audit
	│   │   ├── output
	│   │   └── temp
	│   ├── data-preparation
	│   │   ├── output
	│   │   └── temp
	│   └── paper
	│       ├── output
	│       └── temp
	└── src
 	   ├── analysis
 	   ├── data-preparation
	   └── paper



## 5. Instructions to Run the Project
### 5.1 Software Setup
In order to run the project, the user needs to install [R and RStudio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
In addition, [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/) needs to be installed to run the makefile that will execute the scripts in the correct order.
Finally, to run the .Rmd files, ????

### 5.2 Run the Code
The user needs to open their terminal/command prompt and use *make* to run the *makefile* that will execute all code files in the correct order.

## About Us
This project is created for the course Data Preparation and Workflow Management, which is part of the Marketing Analytics Master program at Tilburg University. 
The project is executed by Czenkár, L. (dev team role: research and analysis), Hilman, L. (dev team: research and documentation), Nikiforova, L. (scrum master; dev team role: analysis and documentation), Schrouff, K. (project owner; dev team role: data preparation and exploration), and Sonneveldt, T. (dev team role: pipeline automation, data exploration and preparation)


## References
Sainaghi, R., Abrate, G., & Mauri, A. (2021). Price and RevPAR determinants of Airbnb listings: Convergent and divergent evidence. International Journal of Hospitality Management, 92, 102709.

## Sources
*Data sources:*  [Inside AirBnB](http://insideairbnb.com/)

*Image sources:*  [Freebie Supply](https://freebiesupply.com/logos/airbnb-logo/); [The Noun Project](https://thenounproject.com/icon/student-search-732583/) 

