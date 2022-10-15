
all: gen/analysis/audit/model_estimation1.RData

gen/data-preparation/output/cal_datasets.RData: src/data-preparation/download_datasets.R 
	Rscript src/data-preparation/download_datasets.R 

gen/data-preparation/output/clean_lis_datasets.Rdata: src/data-preparation/apply_functions.R gen/data-preparation/output/cal_datasets.RData
	Rscript src/data-preparation/apply_functions.R

data/datasets_Berlin/total_berlin.csv: src/data-preparation/write_datasets.R gen/data-preparation/output/clean_lis_datasets.Rdata
	Rscript src/data-preparation/write_datasets.R

Rplots.pdf: src/analysis/data_exploration.R data/datasets_Berlin/total_berlin.csv
	Rscript src/analysis/data_exploration.R

gen/analysis/audit/model_estimation1.RData: src/analysis/multiple_regressions.R Rplots.pdf
	Rscript src/analysis/multiple_regressions.R

clean: 
	Rscript src/clean-up.R
	