# TITLE

## Project Summarry
/ describe shortly the goal of this project /

## Contents
[1. Introduction](##-1.-introduction) 

   [1.1 Problem Background and Research Motivation](###-1.1-problem-background-and-research-motivation)
   [1.2 Problem Statement and Research Questions](###-1.2-problem-statement-and-research-questions)
   [1.3 Conceptual Model](###-1.3-conceptual-model)

[2. Methodology](##-2.-methodology)
   - Data
   - Research Method
   - Analysis

[3. Results and Interpretation](3.-results-and-interpretation)

[4. Repository Overview](4.-repository-overview)
   - Contents
   - Structure

[5. Instructions to Run the Project](5.-instructions-to-run-the-project)


## 1. Introduction
### 1.1 Problem Background and Research Motivation
/ add text /

### 1.2 Problem Statement and Research Qestions

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
        / describe the data - maybe add a table /

### 2.2 Research Method
/ explain the research method /

### 2.3 Analysis
/ explain the analysis /

## 3. Results and Interpretation
/ add text /

## 4. Repository Overview
### 4.1 Repository Contents
### 4.2 Repository structure
/ provide an overview of the directory structure and files (use the tree command) /

## 5. Instructions to Run the Project
### 5.1 Software Setup
### 5.2 Run the Code
/ add clear instructions /

## About Us
/ add the names and roles of all contributors /

## References
/ add all references in APA style /



# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

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
