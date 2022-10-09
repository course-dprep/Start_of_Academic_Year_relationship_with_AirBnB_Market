
all: gen/data-preparation/temp/download.txt gen/data-preparation/temp/apply_functions.txt gen/data-preparation/temp/write_datasets.txt


gen/data-preparation/temp/download.txt: src/data-preparation/download_datasets.R 
	Rscript src/data-preparation/download_datasets.R 

gen/data-preparation/temp/apply_functions.txt: src/data-preparation/apply_functions.R gen/data-preparation/temp/download.txt
	Rscript src/data-preparation/apply_functions.R

gen/data-preparation/temp/write_datasets.txt: src/data-preparation/write_datasets.R gen/data-preparation/temp/apply_functions.txt
	Rscript src/data-preparation/write_datasets.R

