#install all used packages

install.packages("dplyr", repos = "http://cran.us.r-project.org")
install.packages("tidyr", repos = "http://cran.us.r-project.org")
install.packages("tidyverse", repos = "http://cran.us.r-project.org")
install.packages("Hmisc", repos = "http://cran.us.r-project.org")
install.packages("filesstrings", repos = "http://cran.us.r-project.org")
tinytex::install_tinytex(force = TRUE)

library(tidyverse)

text <- 'Install Packages'
write_lines(text, "../../gen/data-preparation/temp/install_packages.txt")

