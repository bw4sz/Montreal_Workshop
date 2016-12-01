*.html: *.Rmd
	Rscript  --no-init-file -e "getwd();sapply(list.files(pattern='.Rmd'), rmarkdown::render)"
