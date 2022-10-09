
all: gen/data-preparation/temp/download.txt gen/data-preparation/temp/apply_functions.txt total_berlin

gen/data-preparation/temp/download.txt: src/data-preparation/download_datasets.R 
	Rscript src/data-preparation/download_datasets.R 

gen/data-preparation/temp/apply_functions.txt: src/data-preparation/apply_functions.R gen/data-preparation/temp/download.txt
	Rscript src/data-preparation/apply_functions.R

total_berlin: src/data-preparation/write_datasets.R gen/data-preparation/temp/apply_functions.txt
	Rscript src/data-preparation/write_datasets.R

clean:
	R -e "unlink('*.csv')"
	R -e "unlink('*.txt')"