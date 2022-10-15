TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: $(TEMP)/model_estimation1.RData

$(TEMP)/tot_rotterdam.RData: data_exploration_raw_data.R 
	Rscript data_exploration_raw_data.R

Rplots.pdf: data_exploration.R $(TEMP)/tot_rotterdam.RData
	Rscript data_exploration.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

