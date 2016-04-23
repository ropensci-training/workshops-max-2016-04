###########
# Get scientific names from common names

## Type in some common names
namelist <- c("","","","","")

## Call the funciton comm2sci with db='ncbi'
comm2sci(commnames = namelist, db="ncbi", simplify=TRUE)

## Now use a different backend, eol

comm2sci(commnames = namelist, db="eol", simplify=TRUE)

## Now use a different backend, tropicos

comm2sci(commnames = namelist, db="tropicos", simplify=TRUE)

###########
# Now try to convert a scientific name back to a common name
# by passing scientific name into sci2comm
# If you don't get a name back try a different name

out <- comm2sci(commnames = namelist, db="ncbi", simplify=TRUE)
sci2comm(out$salmon[[1]])
