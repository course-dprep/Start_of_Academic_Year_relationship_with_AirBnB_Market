
all: gen/data-preparation/temp/multiple_regressions.txt

gen/data-preparation/temp/download.txt: src/data-preparation/download_datasets.R 
	Rscript src/data-preparation/download_datasets.R 

gen/data-preparation/temp/apply_functions.txt: src/data-preparation/apply_functions.R gen/data-preparation/temp/download.txt
	Rscript src/data-preparation/apply_functions.R

total_berlin.csv: src/data-preparation/write_datasets.R gen/data-preparation/temp/apply_functions.txt
	Rscript src/data-preparation/write_datasets.R

gen/data-preparation/temp/data_exploration.txt: src/data_exploration.R total_berlin.csv
	Rscript src/data_exploration.R

gen/data-preparation/temp/multiple_regressions.txt: src/analysis/multiple_regressions.R gen/data-preparation/temp/data_exploration.txt
	Rscript src/analysis/multiple_regressions.R

clean:
	R -e "unlink('*.csv')"
	R -e "unlink('*.txt')"