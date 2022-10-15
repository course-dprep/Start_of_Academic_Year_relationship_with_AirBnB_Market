DATA = ../../data
TEMP = ../../gen/data-preparation/temp

all: $(DATA)/datasets_Berlin/total_berlin.csv

$(TEMP)/cal_datasets.RData: download_datasets.R 
	Rscript download_datasets.R 

$(TEMP)/clean_lis_datasets.RData: apply_functions.R $(TEMP)/cal_datasets.RData
	Rscript apply_functions.R

$(DATA)/datasets_Berlin/total_berlin.csv: write_datasets.R $(TEMP)/clean_lis_datasets.RData
	Rscript write_datasets.R
