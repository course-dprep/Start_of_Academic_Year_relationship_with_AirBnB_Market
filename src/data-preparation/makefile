DATA = ../../data
TEMP = ../../gen/data-preparation/temp

all: $(DATA)/total_rotterdam.csv

$(TEMP)/install_packages.txt: install_packages.R
	Rscript install_packages.R

$(TEMP)/cal_datasets.RData: download_data.R $(TEMP)/install_packages.txt
	Rscript download_data.R 

$(TEMP)/tot_rotterdam.RData: exploration_pre_prep.R $(TEMP)/cal_datasets.RData
	Rscript exploration_pre_prep.R

$(TEMP)/clean_lis_datasets.RData: apply_functions.R $(TEMP)/tot_rotterdam.RData
	Rscript apply_functions.R

$(DATA)/total_rotterdam.csv: write_datasets.R $(TEMP)/clean_lis_datasets.RData
	Rscript write_datasets.R
