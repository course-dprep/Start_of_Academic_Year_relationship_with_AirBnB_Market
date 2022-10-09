# The relationship between the start of the academic year and the AirBnB market in student cities in Western Europe

## Project Summarry
This project uses archival data from the AirBnB website to investigate the relationship between the beginning of the academic year and the AirBnB market in five major Western-European cities.

## Contents
[1. Introduction](#1-introduction) 

   - [Problem Background and Research Motivation](#11-problem-background-and-research-motivation)

   - [Problem Statement and Research Questions](#12-problem-statement-and-research-questions)

   - [Conceptual Model](#13-conceptual-model)

[2. Methodology](#2-methodology)

   - [Data](#21-data)

   - [Research Method](#22-research-method)

   - [Analysis](#23-analysis)

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
At the start of the academic year, many university students need temporary accomodation while they are arranging their documents and looking for permanent housing. Therefore, they often stay temporarily at AirBnB accomodations. In a recent study on the determinants of AirBnB listings' performance, Sainaghi et al. (2021) concludes that seasonality, and certain events can have a significant impact on the prices of listings. Hence, this project aims to investigate how the AirBnb market in various Western-European cities is related to the period of the start of the academic year. The research will focus on analyzing the relationships between the start of the academic year and the AirBnB prices, as well as the maximum nights and accomodation can be booked for. In addition, the effect of the type of host (ordinary vs proffessional) and type of accomodation (room vs apartment) on the abovementioned relationships will be investigated.

The research will be executed for five major student cities in three Western-European countries: Belgium (Antwerp, Brussels), Germany (Berlin), The Netherlands (Amsterdam, Rotterdam).


### 1.2 Problem Statement and Research Questions
*To what extent does the start of the Academic year affect the AirBnB market in popular student cities in Europe?*

- How are the AirBnB prices related to the period of the academic year (beginning vs regular period)?
- How does the relationship between AirBnB prices and period of the academic year depend on the type of host (ordinary vs superhost)?
- How does the relationship between AirBnB prices and period of the academic year depend on the type of accomodation (room vs apartment)?

- How is the maximum number of nights per accomodation related to the period of the academic year (beginning vs regular period)?
- How does the relationship between the maximum number of nights per accomodation and period of the academic year depend on the type of host (ordinary vs superhost)?
- How does the relationship between the maximum number of nights per accomodation and period of the academic year depend on the type of accomodation (room vs apartment)?


### 1.3 Conceptual model

![conceptual-model-final](https://user-images.githubusercontent.com/112591530/194730733-bf2d0bf2-0655-46f9-96d4-5cb6d6702569.jpg)

## 2. Methodology

### 2.1 Data
This project uses publicly available archival data from AirBnB. In total, ten datasets are retreived from the AirBnB website, two for each city of interest. Every two datasets per city are merged into one based on listing id and the data is explored and prepared.

The final variables in the datasets are as follows:

        - id                              = Airbnb's unique identifier for the listing 
        - host_is_superhost               = boolean [t=true; f=false]
        - property_type                   = 
        - price                           = daily price in local currency

### 2.2 Research Method
Since the project uses archival data, the type of research is correlational. 

Data Transformation

A selection was made for all cities to take the dates from 15th of march to the 15th of April  2023 and then from 15th of August to the 15th of September 2022. The first as our control dates and the second as the start of the academic year. We felt we had to pick a month with no major national holidays or religious occasions which could impact the prices. 

We selected just the variables which interested us when loading the data for each city into a dataframe. So id, price, room_type, minimum_nights and maximum_nights. We also created two new variables by taking the mean average of the price and the mean average of the maximum number of nights. 

For the availability variable, we’ve chosen to use every datapoint regardless of if it’s listed as available or not. This is because the ones listed as not available might be rented-out which is exactly the rooms we want to know about.

After the selection of the data we also create a new dummy variable called dummy_month_august which is 1 if the row is in August/September (start of academic year) and 0 if it’s in March/April. 

Turn room_type into a dummy variable called room. There are 4 different room types given but, as 2 of them make up a very small percentage of the dataset they were combined with one of the larger ones. The dummy variable is coded as “Entire home/apt” = 1 and 0 = “Private room”&” Shared room“& “Hotel room”. We also theorized grouping these together made sense as these would be the type we thought popular with students as these accommodations are normally for 1 or 2 people. 

For the Amsterdam dataset for example these were the occurrences of each type; 

| Entire home/apt  | Hotel room | Private room  | Shared room  |
| ------------- | ------------- | ------------- | ------------- |
| 8446 | 152 | 3680 | 64 | 

After making boxplots and checking the summary output for our variable of interest. We remove the outliers for average_price and average_nights for all cities. And we remove the outliers for the minimum number of nights for Berlin. As all these had very extreme outliers which biased the mean and skewed the data.  


### 2.3 Analysis
The independent variables in the model ("start of the academic year", "type of host", and "type of accomodation") are binary variables, whereas the dependent variables ("price" and "number of maximum nights") are continuous.
Since there are three categorical explanatory variables and two continuous dependent variables, we perform a multivariate multiple regression.


## 3. Results and Interpretation
Regression output explanation

When running the regression we have checked for each of the five cities the effect of the independent variable namely ‘dummy_month_aug’, on the two dependent variables; ‘average_price’ and ‘maximum_nights’. As the focus of our research is to identify whether the start of the academic, represented by ‘dummy_month_aug’, has an effect on the DVs and also to see whether this effect depends on the moderators, we have introduced interaction effects between the IV of the study and the moderators, namely ‘room’ and ‘host_is_superhostTRUE’.

For the first city, Antwerp, we could not find any significant effects for the variables of interest. For Amsterdam there is a significant effect for the interaction between ‘dummy_month_aug’ and ‘host_is_superhostTRUE’, meaning that at the start of the academic year there is an increase of 11.5 euros in average price for AirBnB super hosts. For the other dependent variable we could not find any significant effects. In the case of Berlin we have a highly significant effect between the DV ‘average price’ and the start of the academic year. Another significant effect for this DV is the interaction between start of the academic year and the room dummy, meaning that the average price at the start of the academic year increases by 24.3 euros for homes and apartments. For the other DV, ‘maximum_nights’ no significant effects were found. The next city is Brussels for which no significant effects were found for either of the DVs. Lastly, for Rotterdam for the DV ‘average price’ there is a significant effect with the IV ‘dummy_month_aug’.


## 4. Repository Overview
### 4.1 Repository Contents
The repository consists of three main directories, namely, "data", "src", and "gen". The "data" directory is used to store raw data (which is not uploaded on GitHub but can be retreived from the AirBnB website or by running the respective script), the "src" directory contains the source code of the project, and the "gen" directory stores all generated files.

   Within the "gen" and "src" directories, there are sub-directories for the data preparation and the data analysis stages; namely, "data-preparation" and "analysis".
   
   Within these sub-directories, there folders aimed for storing any temporary files ("temp"), final products from the various stages in the pipeline ("output"), and any files related to issues with the data or the model estimation ("audit folder").
   
   The final deliverable of the project is stored in the "paper" sub-directory within the "gen" directory.
	 

### 4.2 Repository Structure
/ provide an overview of the directory structure and files (use the tree command) /

	├── README.md
	├── data
	│   ├── datasets Amsterdam
	│   ├── datasets Antwerp
	│   ├── datasets Berlin
  	│   ├── datasets Brussels	
	│   └── datasets Rotterdam
	├── gen
	│   ├── analysis
	│   │   ├── audit
	│   │   ├── input
	│   │   ├── output
	│   │   └── temp
	│   ├── data-preparation
	│   │   ├── audit
	│   │   ├── input
	│   │   ├── output
	│   │   └── temp
	│   └── paper
	└── src
 	   ├── analysis
 	   └── data-preparation



## 5. Instructions to Run the Project
### 5.1 Software Setup
In order to run the project, the user needs to install R and RStudio /add link/.
In addition, Make /add link/ needs to be installed to run the Makefile that will execute the scripts in the correct order.

### 5.2 Run the Code
We advise the use of the Makefile for correct execution of the project. 

Otherwise, one can execute the scripts in the following order:
		install_packages.R
		data_download.R
		data_merge.R
		data_exploration.R
		data_preparation.R
		data_analysis.R


## About Us
This project is created for the course Data Preparation and Workflow Management, which is part of the Marketing Analytics Master program at Tilburg University. The project is executed by Czenkár, L., Hilman, L., Nikiforova, L., Schrouff, K., and Sonneveldt, T. 

## References
/ add all references in APA style /

Sainaghi, R., Abrate, G., & Mauri, A. (2021). Price and RevPAR determinants of Airbnb listings: Convergent and divergent evidence. International Journal of Hospitality Management, 92, 102709.

