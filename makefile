
all: apply_functions.txt

download.txt:download_datasets.R 
	Rscript download_datasets.R 


apply_functions.txt: apply_functions.R download.txt 
	Rscript apply_functions.R

clean:
	R -e "unlink('*.txt')"



