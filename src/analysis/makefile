TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: $(TEMP)/model_estimation1.RData

$(TEMP)/tot_rotterdam.RData: exploration_pre_prep.R 
	Rscript exploration_pre_prep.R

Rplots.pdf: exploration_post_prep.R $(TEMP)/tot_rotterdam.RData
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

