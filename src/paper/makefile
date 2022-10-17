OUTPUT = ../../gen/paper/audit

all: $(OUTPUT)/final_report.pdf

final_report.pdf: final_report.Rmd 
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='C:/Program Files/RStudio/bin/quarto/bin/tools'); rmarkdown::render('final_report.Rmd')"

$OUTPUT/final_report.pdf: move_final_report.R final_report.pdf
	Rscript move_final_report.R