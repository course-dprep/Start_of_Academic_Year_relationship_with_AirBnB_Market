
all: gen/analysis/audit/model_estimation1.RData

gen/data-preparation/output/cal_datasets.RData: src/data-preparation/download_datasets.R 
	Rscript src/data-preparation/download_datasets.R 

gen/data-preparation/output/clean_lis_datasets.Rdata: src/data-preparation/apply_functions.R gen/data-preparation/output/cal_datasets.RData
	Rscript src/data-preparation/apply_functions.R

data/datasets_Berlin/total_berlin.csv: src/data-preparation/write_datasets.R gen/data-preparation/output/clean_lis_datasets.Rdata
	Rscript src/data-preparation/write_datasets.R

Rplots.pdf: src/data_exploration.R data/datasets_Berlin/total_berlin.csv
	Rscript src/data_exploration.R

gen/analysis/audit/model_estimation1.RData: src/analysis/multiple_regressions.R Rplots.pdf
	Rscript src/analysis/multiple_regressions.R

clean:
	R -e "unlink('*.csv')"
	R -e "unlink('gen/data-preparation/output/*.RData')"
	R -e "unlink('gen/analysis/output/*.RData')"
	R -e "unlink('gen/analysis/audit/*.RData')"
	R -e "unlink('*.pdf')"
	R -e "unlink('data/datasets_Antwerp/*.csv')"
	R -e "unlink('data/datasets_Amsterdam/*.csv')"
	R -e "unlink('data/datasets_Rotterdam/*.csv')"
	R -e "unlink('data/datasets_Brussels/*.csv')"
	R -e "unlink('data/datasets_Berlin/*.csv')"
	
	