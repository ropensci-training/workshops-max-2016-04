slides:
	Rscript -e 'rmarkdown::render("01-taxonomy/slides/index.Rmd")'
	Rscript -e 'rmarkdown::render("02-biodiversity/slides/index.Rmd")'
	Rscript -e 'rmarkdown::render("03-merging/index.Rmd")'
	Rscript -e 'rmarkdown::render("envdata/index.Rmd")'

ot:
	open 01-taxonomy/slides/index.html

ob:
	open 02-biodiversity/slides/index.html

om:
	open 03-merging/index.html

oe:
	open envdata/index.html

less:
	Rscript -e 'x <- c("identifiers.Rmd", "names_to_use.Rmd", "taxize_usecase1.Rmd", "taxize_usecase2.Rmd", "taxize_usecase3.Rmd", "taxize_usecase4.Rmd"); lapply(x, knitr::knit)';\
	Rscript -e 'x <- c("rbison_usecase1.Rmd", "rgbif_cleaning.Rmd", "rgbif_usecase1.Rmd", "rgbif_usecase2.Rmd", "rgbif.Rmd", "rnbn.Rmd", "spocc.Rmd"); lapply(x, knitr::knit)'

ex:
	Rscript -e 'x <- c("ex_commsci.R", "ex_downstream.R", "ex_identifiers.R"); lapply(x, knitr::knit)';\
	Rscript -e 'x <- c("ex_cleaning.R", "ex_getdata.R", "ex_mapping.R"); lapply(x, knitr::knit)'
