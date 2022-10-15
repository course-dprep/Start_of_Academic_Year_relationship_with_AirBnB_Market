TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: $(TEMP)/model_estimation1.RData

Rplots.pdf: data_exploration.R $(DATA)/datasets_Berlin/total_berlin.csv
	Rscript data_exploration.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

