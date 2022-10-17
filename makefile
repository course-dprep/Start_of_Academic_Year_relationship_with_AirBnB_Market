
all: paper

data-preparation: 
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis

paper: analysis
	make -C src/paper

clean: 
	Rscript src/data-preparation/clean_up.R
	