# Deletes files in all subdirectories with the endings specified here
fileEndings <- c('*.csv', '*.RData')
for (fi in fileEndings) { 
  files <- list.files(getwd(),fi,include.dirs=F,recursive=T,full.names=T,all.files=T)
  file.remove(files)
}

# Delete all files in temp and in paper folder directories
# (does note delete hidden files starting with . (e.g. .gitkeep is not deleted))
unlink(paste(getwd(),'/gen/analysis/temp/*',sep=''),recursive=T,force=T)
unlink(paste(getwd(),'/gen/data-preparation/temp/*',sep=''),recursive=T,force=T)
unlink(paste(getwd(),'/gen/paper/*',sep=''),recursive=T,force=T)


