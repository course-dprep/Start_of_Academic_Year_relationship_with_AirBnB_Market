# The relationship between the start of the academic year and the AirBnB market in student cities in Western Europe

## Project Summary
This project uses archival data from the AirBnB website to analyse the relationship between the beginning of the academic year and the AirBnB market in five major Western-European cities.
It investigates whether the prices and the average nights for which an accomodation can be rented differ significantly at the beggining of the academic year compared to a regular period during the academic year (not close to beginning/end of academic year and when no official big holidays take place) and takes into consideration the moderating role of the type of AirBnB host (superhost vs ordinary host) and the type of accomodation (entire apartment vs single room).

![airbnb-logo-and-student3](https://user-images.githubusercontent.com/112591530/196049694-3585dc9d-d527-43d3-90ce-d4c8500ae052.png)


## Contents
[1. Introduction](#1-introduction) 

   - [Problem Background and Research Motivation](#11-problem-background-and-research-motivation)

   - [Problem Statement and Research Questions](#12-problem-statement-and-research-questions)

   - [Conceptual Model](#13-conceptual-model)

[2. Methodology](#2-methodology)
   - [Data](#21-data)
   - [Research Method and Analysis](#22-research-method-and-analysis)

[3. Main Results, Conclusion and Discussion](#3-main-results-conclusion-and-discussion)

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

- How is the (average) maximum number of nights per accommodation related to the period of the academic year (beginning vs regular period)?
- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of host (ordinary vs superhost)?
- How does the relationship between the maximum number of nights per accommodation and period of the academic year depend on the type of accommodation (room vs apartment)?


### 1.3 Conceptual model

![conceptual-model-use-this](https://user-images.githubusercontent.com/112591530/196250721-3a241662-ff75-49d7-80b2-5124e6455e42.jpg)



## 2. Methodology

### 2.1 Data
This project uses publicly available archival data from AirBnB. In total, ten datasets are retrieved from the AirBnB website, two for each city of interest. Every two datasets per city are merged into one based on listing id and the data is explored and prepared.

The data used in the analysis is for two time periods which serve as a "beginning of the academic year" period (Aug 15 - Sep 15 2022), and control period (March 15 - April 15, 2023.
Note 1: the second time period is in the future, because AirBnB provides the information regarding listings ahead of time since the hosts set the prices and number of nights for which they rent out their accomodation in advance.
Note 2: the data is originally retrieved from the Inside AirBnB website which adds new datasets and deletes older ines, such that they provide data for 12 months in total. Therefore, the datasets that we use in this particular repository are uploaded in another github repository and loaded from it (the use of a cloud was not possible due to the large size of some of the raw data files.) This way, we avoid changes in the results that we interpret in the final report.

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

### 2.2 Research Method and Analysis

We have two models, each with three independent variables ("start of the academic year", "type of host", and "type of accomodation"), and a dependent variable ("price" in the first model and "number of maximum nights" in the second model).
Since there are three categorical explanatory variables, and a continuous dependent variable in each model, we perform multiple linear regressions to analyze the relationships (Sekaran & Bogue, 2016).
As we investigate the relationships for each of the two models with data for 5 different cities, there are ten linear regressions in total.
Due to the fact that the focus of our research is to identify whether the start of the academic year, represented by "dummy_month_aug" is related to the DVs, and also to see whether this relationship depends on the moderators, we have introduced interaction effects between the IV of the study and the moderators ("room" and "host_is_superhostTRUE").


## 3. Main Results, Conclusion and Discussion

*Main Results and Conclusion*

Based on the problem background, it was expected that there would be a positive relationship between the start of the academic year and the average price of Airbnbs, as students in need of temporary housing use Airbnb's services to find accommodation, resulting in higher demand and hosts increasing prices. In addition, we hypothesized that the average nights would also be higher at the start of the academic year, since students looking for permanent accommodation might need to rent and AirBnB for few weeks or even months. Finally, it was expected that the type of room and the type of host would influence the relationship between the start of the academic year and each of the two dependent variables. 
Nevertheless, no significant effects were found for the relationship between the start of the academic and the AirBnB prices, nor for the relationship between the start of the academic and the average maximum nights for which an accomodation is available. The interaction effects between the start of the academic year and the moderators were not significant for none of the models either. 

There were some significant effects of the moderators on price and on average maximum nights. The prices were higher for superhosts compared to ordinary hosts for Antwerp, Brussels and Rotterdam. Entire homes were associated with higher prices compared to rooms for all cities. The average number of maximum nights was higher for superhost compared to ordinary host for all cities besides Rotterdam. The average number of maximum nights is also higher for entire homes compared to rooms for Amsterdam, Berlin and Brussels. 

*Discussion and Recommendations*

Overall, this research did not find enough significant effects to draw meaningful generalizable conclusions. There are various reasons that could have caused this. First of all, this project used archival data that has not been collected for the purpose of this research. Therefore, we could not control for the quality of the data. Another possible explanation can be that not many students use Airbnb's services in these cities. We also have to keep in mind we are comparing the data from 2022 to 2023. So the prices listed for March/April might be changed closer to that time.

Some of the individual effects of the moderators were significant, but since they were not consistent for all cities, we cannot make conclusions without additional analysis.

In conclison, further research is needed to confirm or reject the relationships between the variables in our models and uncover the relationship between the start of the academic year and the AirBnB market. It might be useful to repeat the research later in time, as well as for other student cities. In addition, two-way ANOVA could be performed for each model since the independent variables are categorical, whereas each DV is interval (Sekaran & Bogue, 2016), or the models could be tested together using a MANOVA analysis in order to take both dependent variables into consideration at once.


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
|src/analysis| source code for the prepared data exploration, source code for data analysis, and a .Rmd file for model estimation||
|gen/analysis| output from the data analysis|sub-directories: for storing any temporary files ("temp"), and final products from the various stages in the pipeline ("output"), and the knitted pdf of the model estimation is in "audit"|
|src/paper| the .Rmd file for the final deliverable of the project||
|gen/paper| the knitted pdf of the final report is in the "output" folder, and the images used in it are stored in the "temp" folder (not uploaded on GitHub)||


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

In addition, [Gnu Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/) needs to be installed to run the makefile that will execute the scripts in the correct order.

Moreover, [Git](https://git-scm.com/download) needs to be installed. Please follow [this link](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/git/) for instructions to set up Git correctly.

Finally, to knit .pdf files from the RMarkdown files, the user needs to install [Pandoc](https://pandoc.org/installing.html). 

### 5.2 Run the Code

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repository.
2. Open your Terminal (for Mac users) or GitBash (for Windows users) and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the repository.
``` 
git clone https://github.com/<your-username>/Start_of_Academic_Year_relationship_with_AirBnB_Market.git
```
3. Open your Terminal (for Mac users) or your command prompt (for Windows users) in the cloned repository and use `make` to run the `makefile` that will execute all code files in the correct order.
```
make
```

#### Running the code without a makefile

1. Install packages -> `../src/data-preparation/install_packages.R`
2. Download the datasets -> `../src/data-preparation/download_datasets.R`
3. Exploration pre -> `../src/data-preparation/exploration_pre_prep.R`
4. Apply functions -> `../src/data-preparation/apply_functioncs.R`
5. Write datasets -> `../src/data-preparation/write_datasets.R`
6. Exploration post -> `../src/analysis/exploration_post_prep.R`
7. Multiple regression -> `../src/analysis/multiple_regressions.R`
8. Model estimation -> `../src/analysis/Model_estimation.Rmd`
9. Move model estimation -> `../src/analysis/move_model_estimation.R`
10. Final report -> `../src/paper/Final_report.Rmd`

## About Us
This project is created for the course Data Preparation and Workflow Management, which is part of the Marketing Analytics Master program at Tilburg University. 
The project is executed by 
* Czenkár, L. (dev team role: research and analysis);
* Hilman, L. (dev team role: research and documentation);
* Nikiforova, L. (scrum master; dev team role: analysis and documentation);
* Schrouff, K. (project owner; dev team role: data preparation and exploration);
* Sonneveldt, T. (dev team role: pipeline automation, data retrieving, exploration, and preparation).


## References
Sainaghi, R., Abrate, G., & Mauri, A. (2021). Price and RevPAR determinants of Airbnb listings: Convergent and divergent evidence. International Journal of Hospitality Management, 92, 102709.

Sekaran, U., & Bougie, R. (2016). Research methods for business: a skill-building approach (Seventh). John Wiley & Sons.

## Sources
*Data sources:*  [Inside AirBnB](http://insideairbnb.com/)

*Image sources:*  [Freebie Supply](https://freebiesupply.com/logos/airbnb-logo/); [The Noun Project](https://thenounproject.com/icon/student-search-732583/) 

