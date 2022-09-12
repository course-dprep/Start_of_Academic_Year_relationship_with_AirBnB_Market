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
/ add text /

### 1.2 Problem Statement and Research Questions

*To what extent does the start of the Academic year affect the AirBnB market in popular student cities in Europe?*
- How are the Air BnB prices affected? Do they go up or down?
- Does the amount of rented out B&B's go change?
- Are the reviews affected?
- Is there a difference in price change between professional hosts and ordinary ones?

Cities of interest to use (all large student cities with Universities):
- The Netherlands (Amsterdam, Rotterdam), Germany (Berlin, Munich), Denmark (Copenhagen), Belgium (Brussels, Ghent, Antwerp), Austria (Vienna) 

*Alternative RQ: To what extent do changes in the weather influence the European B&B market?*
--> This would use a secondairy dataset(s) with the temperature and percipitation rate 
- Does an increase in the percipitation rate impact the rate of rented out B&B's?
- Does an increase in the percipitation rate impact the reviews?
- Does colder weather impact the price of B&B? Or the rent out rate?
- Are less B&B's listed when there is worse weather? 

### 1.3 Conceptual model
/ visualize the conceptual model (e.g. with draw.io) and add the file here /

## 2. Methodology

### 2.1 Data
    - Data Sources
    - Overview of the Variables
        We have access to data going back 12 months.

        Variables that are important for our research are:
		```
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
		```
		
### 2.2 Research Method
/ explain the research method /

### 2.3 Analysis
/ explain the analysis /

## 3. Results and Interpretation
/ add text /

## 4. Repository Overview
### 4.1 Repository Contents
### 4.2 Repository Structure
/ provide an overview of the directory structure and files (use the tree command) /

## 5. Instructions to Run the Project
### 5.1 Software Setup
### 5.2 Run the Code
/ add clear instructions /

## About Us
/ add the names and roles of all contributors /

## References
/ add all references in APA style /

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
