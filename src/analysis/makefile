TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: data_exploration.pdf

Rplots.pdf: exploration_post_prep.R 
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

data_exploration.pdf: data_exploration.Rmd $(TEMP)/model_estimation1.RData
	Rscript -e 'rmarkdown::render("data_exploration.Rmd")'