# TITLE

## Project Summarry
/ describe shortly the goal of this project /

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
The start of the academic year for university students can be a stressful period for many reasons, finding housing is one of them. In this current research we aim to investigate how the AirBnb market is affected in different Western-European cities by the start of the academic year. In a recent study on the determinants of AirBnB listings' performance, Sainaghi et al. concluded that seasonality, and certain events can have a significant impact on the prices of listings. The Berlin Spectator recently described the ease with which students can find housing in Berlin is largely base on luck. In a popular Belgian student city, after publishing an advertisement for student rooms, housing agents needed to ignore students' phone calls, as distress among them for rooms and studios was increasing. NL Times published an article in which University of Amsterdam is warning students not to come to the Netherlands without housing. It is obvious that in all these three countries finding student accomodation is a serious problem for newcomers. However, it is less obvious how this crisis affects the AirBnb market as a possible alternative for students looking for (temporary) accomodation. To what extent does the situation differ across cities in different countries? As a result of our research, we hope to answer the following main research question and sub-questions..

### 1.2 Problem Statement and Research Questions

*To what extent does the start of the Academic year affect the AirBnB market in popular student cities in Europe?*
- Do the the AirBnB prices change? Do they increase or decrease?
- Does the minimum number of nights per accomodation change? If so, does it increase or decrease?
- Is there a difference in price change between professional hosts and ordinary ones?

Cities of interest to use (all large student cities with Universities):
- The Netherlands (Amsterdam, Rotterdam), Germany (Berlin, Munich), Denmark (Copenhagen), Belgium (Brussels, Ghent, Antwerp), Austria (Vienna) 



### 1.3 Conceptual model

![conceptual-model](https://user-images.githubusercontent.com/112591530/191712535-b43028be-b387-4126-904b-368c49214c18.jpg)



## 2. Methodology

### 2.1 Data
    - Data Sources
    - Overview of the Variables
        We have access to data going back 12 months.

        Variables that are important for our research are:
		
        - id                              = Airbnb's unique identifier for the listing 
        - host_location                   = The host's self reported location
        - host_about                      = Description about the host
        - host_is_superhost               = boolean [t=true; f=false]
        - neighbourhood_cleansed          = The neighbourhood as geocoded using the latitude and longitude against neighborhoods as defined by open or public digital                                               shapefiles.
        - property_type                   = Self selected property type. Hotels and Bed and Breakfasts are described as such by their hosts in this field
        - price                           = daily price in local currency
        - availability_30                 = avaliability_x. The availability of the listing x days in the future as determined by the calendar. Note a listing may not be                                           available because it has been booked by a guest or blocked by the host.
        - number_of_reviews               = The number of reviews the listing has
        - number_of_reviews_l30d          = The number of reviews the listing has (in the last 30 days)
        - calculated_host_listings_count  = The number of listings the host has in the current scrape, in the city/region geography.
		
		
### 2.2 Research Method
/ explain the research method /

### 2.3 Analysis
For the analysis, several repeated-measures ANOVA seem the best option. A repeated-measures ANOVA is used to measure the means of same objects over time. The repeated-measures ANOVA is usually performed if there is one independent variable that influences a dependent variable, measured on more than one occasion. In this case, the data of the same cities in September and March is compared. The drawback of this measure is that you have to perform an ANOVA for *each* dependent variable, which increases the chance of a Type B error.

Another option for the analysis is the MANOVA. This is a variant of the ANOVA which makes it possible to investigate more than one dependent variable at the same time. This might be helpful for this project, since we want to measure e.g. price, availability and the number of listings. 

For both the repeated-measures ANOVA and the MANOVA, it is necessary to get the means of every DV we would like to research, since an ANOVA is built to compare means. This means we have to combine the data of the 28 days for September and March respectively. 

## 3. Results and Interpretation
/ add text /

## 4. Repository Overview
### 4.1 Repository Contents
The raw data used is contained in a folder called "data".

   The source code is stored in a folder called "src".
   
   The generated files are stored in the generated folder "gen".
   
   Within the "gen" folder there are separate folders for the data preparation and the data analysis stages, as well as the final deliverable of the project; namely, "data-preparation", "analysis", and "paper".
   
   Any temporary files will be stored in "temp".
   
   Any final products from the various stages in the pipeline will be stored in the "output" folder.
   
   Any files related to issues with the data or the model estimation will be stored in the "audit folder".
	 
### 4.2 Repository Structure
/ provide an overview of the directory structure and files (use the tree command) /


    ├── README.md
	├── data
	│   ├── dataset1
	│   └── dataset2
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
### 5.2 Run the Code
/ add clear instructions /

## About Us
/ add the names and roles of all contributors /

## References
/ add all references in APA style /

Sainaghi, R., Abrate, G., & Mauri, A. (2021). Price and RevPAR determinants of Airbnb listings: Convergent and divergent evidence. International Journal of Hospitality Management, 92, 102709.
