
all: analysis

data-preparation: 
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	

clean: 
	Rscript src/data-preparation/clean-up.R
	