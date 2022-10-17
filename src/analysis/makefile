TEMP = ../../gen/analysis/temp/
DATA = ../../data

all: model_estimation.pdf

Rplots.pdf: exploration_post_prep.R 
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

model_estimation.pdf: model_estimation.Rmd $(TEMP)/model_estimation1.RData
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='C:/Program Files/RStudio/bin/pandoc'); rmarkdown::render('model_estimation.Rmd')"