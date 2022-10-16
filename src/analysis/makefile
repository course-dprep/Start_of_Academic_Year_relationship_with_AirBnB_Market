TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: $(TEMP)/model_estimation1.RData

Rplots.pdf: exploration_post_prep.R 
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

