all: slides

slides:
	Rscript -e 'rmarkdown::render("01-taxonomy/slides/index.Rmd")'
	Rscript -e 'rmarkdown::render("02-biodiversity/slides/index.Rmd")'

ot:
	open 01-taxonomy/slides/index.html

ob:
	open 02-biodiversity/slides/index.html
