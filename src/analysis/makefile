TEMP = ../../gen/analysis/temp/
DATA = ../../data
OUTPUT = ../../gen/analysis/audit

all: $(OUTPUT)/model_estimation.pdf

Rplots.pdf: exploration_post_prep.R 
	Rscript exploration_post_prep.R

$(TEMP)/model_estimation1.RData: multiple_regressions.R Rplots.pdf
	Rscript multiple_regressions.R

model_estimation.pdf: model_estimation.Rmd $(TEMP)/model_estimation1.RData
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='C:/Program Files/RStudio/bin/quarto/bin/tools'); rmarkdown::render('model_estimation.Rmd')"

$(OUTPUT)/model_estimation.pdf: move_model_estimation.R model_estimation.pdf
	Rscript move_model_estimation.R