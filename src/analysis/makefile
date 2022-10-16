TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: data_exploration.pdf

Rplots.pdf: exploration_post_prep.R 
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

data_exploration.pdf: data_exploration.Rmd $(TEMP)/model_estimation1.RData
	R --vanilla < run_data_exploration.R