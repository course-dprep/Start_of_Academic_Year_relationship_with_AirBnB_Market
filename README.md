# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Research question(s):

*How is the market affected in populair student cities in Europe by the start of the Academic year?*
- How are the Air BnB prices affected? Do they go up or down?
- Does the amount of B&B available to rent change?
- Is the maximum number of night impacted?
- Are the reviews affected?
- Is there a difference in price change between professional hosts and ordinary ones?

Cities of interest to use (all large student cities with Universities):
-The Netherlands (Rotterdam, Amsterdam), Germany (Berlin, Munich), Denmark (Copenhagen), Belgium (Brussels, Ghent, Antwerp), Austria (Vienna). 

## Reasoning for data choices 
To decide on what date to use as comparison dates we looked up the start of the academic year in each city:
Gent Belgium 27/09/22
Antwerp Belgium 26/9/22
The Netherlands - 01/09/22
Denmark - 05/09/22

We use the two week before the starting date as well as the first two weeks of the academic year.
We compare it to 4 consequative weeks earlier in the year, where no mayor events or holidays are planned. 

For the availability variable we opted to assume the locations listed as False for availability are not available to book/rented out (PICK ONE!). 

## Analysis 

## File path
- Structure of repository 

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
