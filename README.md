# The relationship between the start of the academic year and the AirBnB market in student cities in Western Europe

## Project Summary
This project uses archival data from the AirBnB website to investigate the relationship between the beginning of the academic year and the AirBnB market in five major Western-European cities.

## Contents
[1. Introduction](#1-introduction) 

   - [Problem Background and Research Motivation](#11-problem-background-and-research-motivation)

   - [Problem Statement and Research Questions](#12-problem-statement-and-research-questions)

   - [Conceptual Model](#13-conceptual-model)

[2. Methodology](#2-methodology)

[3. Results and Interpretation](#3-results-and-interpretation)

[4. Repository Overview](#4-repository-overview)

   - [Repository Contents](#41-repository-contents)

   - [Repository Structure](#42-repository-structure)

[5. Instructions to Run the Project](#5-instructions-to-run-the-project)
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

The data transformation process is explained in detail in the Readme.md file within the Data folder in this repository, as well as the final paper of this project.


The final variables of interest are as follows:

        - id                    = Airbnb's unique identifier for the listing
        - host_is_superhost     = boolean [t=true; f=false] (distinguishes between two types of hosts)
        - room_type             = categorical variable diplaying the the type of room, 4 options are given; Entire home/apt, Hotel room, Private room or Shared room.
	- room                  = binary variable. Transformed room_type, listing “Entire home/apt” as 1 and “Private room” & ”Shared room“ & “Hotel room” combined as 0.
        - price                 = daily price in local currency, numeric. 
	- average_price         = mean price for each listing over 30 days, numeric.
	- maximum_nights        = maximum number of nights a listing can be rented out. 
	- average_nights        = mean maximum_nights for each listing over 30 days, numeric. 
	- dummy_month_aug       = dummy variable to distinguish between the two time peridos: Aug/Sept listings as 1, and March/April as 0. 


### 2.2 Research Method


### 2.3 Analysis

We have two models, each with three independent variables ("start of the academic year", "type of host", and "type of accomodation"), and a the dependent variable ("price" in the first model and "number of maximum nights" in the second model)..
Since there are three categorical explanatory variables, and a continuous dependent variable in each model, we perform linear regressions to analysie the relationships.
As we investigate the relationships for each of the two models with data for 5 different cities, there are ten linear regressions in total.


## 3. Results and Interpretation

As the focus of our research is to identify whether the start of the academic year, represented by "dummy_month_aug" is related to the DVs, and also to see whether this relationship depends on the moderators, we have introduced interaction effects between the IV of the study and the moderators ("room" and "host_is_superhostTRUE").

For the first city, Antwerp, we could not find any significant effects for the variables of interest. For Amsterdam, there is a significant effect for the interaction between "dummy_month_aug" and "host_is_superhostTRUE", meaning that at the start of the academic year there is an increase of 11.5 euros in average price for AirBnB super hosts. For the other dependent variable we could not find any significant effects. In the case of Berlin we have a highly significant negative effect between the DV "average price" and the start of the academic year. Meaning there is a decrease of 28.56 euro's in the price at the start of the academic year compared to March/April.  Another significant effect for this DV is the interaction between start of the academic year and the room dummy, meaning that the average price at the start of the academic year increases by 24.3 euros for homes and apartments. For the other DV, "average_nights" no significant effects were found. For the city of Brussels no significant effects were found for either of the DVs. Lastly, for Rotterdam for the DV ‘average price’ there is a significant effect with the IV ‘dummy_month_aug’. On average prices are lower by 22.9 euros in August/Sepetmeber comapred to March/April.


*Conclusion and Discussion*

Overall, this research did not find enough significant effects to draw meaningful generalizable conclusions.
There are various reasons that could have caused this. First of all, this project used archival data that has not been collected for the purpose of such research. Therefore, we could not control for the quality of the data. Another possible explanation can be that not many students use AirBnB's services in these cities, which would explain why hosts would not adjust their offerings depending on the academic year. Moreover, the data compared are from 2022 and 2023. Therefore, the prices listed for March/April 2023 might still undergo changes. Furthermore, global events, such as the rising inflation, might have influenced the prices for March/April (e.g. the increase seen in Berlin might be caused by the expectations of the hosts for increases in the cost of material or goods they need for the room).

In conclusion, further research is needed to confirm or reject the relationships between the variables in our models. It might be useful to repeat the research later in time, as well as for other student cities.


## 4. Repository Overview
### 4.1 Repository Contents
The repository consists of three main directories, namely, "data", "src", and "gen". 

The "data" directory is used to store the data files. (Those are not uploaded on GitHub but can be retreived on the user's local machine by running the respective script. In GitHub, the user will find a readme file which gives information about the data files contents and the data manipulation performed). 

The "src" directory contains the source code of the project, and the "gen" directory stores all generated files.
 
Within the "gen" and "src" directories, there are sub-directories for the data preparation and the data analysis stages, as well as the final deliverable of the project; namely, "data-preparation", "analysis", and "paper".
   
 
Within these sub-directories, there are folders aimed for storing any temporary files ("temp"), and final products from the various stages in the pipeline ("output").

The final deliverable of the project is stored in the "paper" sub-directory within the "gen" directory.

(Note: There are makefiles in the general directory, as well as all sub-directories of the "src" folder as those are used for the pipeline automation.)
	 

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
In order to run the project, the user needs to install R and RStudio /add link/.
In addition, Make /add link/ needs to be installed to run the Makefile that will execute the scripts in the correct order.

### 5.2 Run the Code
We advise the use of the Makefile for correct execution of the project. 

Otherwise, one can execute the scripts in the following order:
		
		download_datasets.R
		
		apply_functions.R
		
		write_datasets.R
		
		data_preparation.R
		
		data_exploration.R
		
		multiple_regressions.R


## About Us
This project is created for the course Data Preparation and Workflow Management, which is part of the Marketing Analytics Master program at Tilburg University. The project is executed by Czenkár, L., Hilman, L., Nikiforova, L., Schrouff, K., and Sonneveldt, T. 

## References
Sainaghi, R., Abrate, G., & Mauri, A. (2021). Price and RevPAR determinants of Airbnb listings: Convergent and divergent evidence. International Journal of Hospitality Management, 92, 102709.

