## Cleaning taxonomic names



### Load libraries


```r
library('taxize')
```

Most of us will start out with a species list, something like the one below. Note that each of the names is spelled incorrectly.

There are many ways to resolve taxonomic names in taxize. Of course, the ideal name resolver will do the work behind the scenes for you so that you don't have to do things like fuzzy matching. There are a few services in taxize like this we can choose from: 

One option is the Global Names Resolver service from EOL (see function *gnr_resolve*):


```r
splist <- c("Pinos contorta","Collomia grandiflorra", "Abies magnificaa","Datura wrighti","Mimulus bicolour","Nicotiana glauca","Maddia sativa","Bartlettia scapposa")
```


```r
sources <- gnr_datasources()
eol <- sources$id[sources$title == 'EOL']
out <- gnr_resolve(splist, data_source_ids = eol, stripauthority = TRUE)
head(out)
```

```
#>     user_supplied_name      submitted_name               matched_name
#> 12    Abies magnificaa    Abies magnificaa  Abies magnifica A. Murray
#> 13    Abies magnificaa    Abies magnificaa            Abies magnifica
#> 14    Abies magnificaa    Abies magnificaa   Abies magnifica A. Murr.
#> 25 Bartlettia scapposa Bartlettia scapposa Bartlettia scaposa A. Gray
#> 26 Bartlettia scapposa Bartlettia scapposa         Bartlettia scaposa
#> 27 Bartlettia scapposa Bartlettia scapposa    Bartlettia scaposa Gray
#>    data_source_title score
#> 12               EOL  0.75
#> 13               EOL  0.75
#> 14               EOL  0.75
#> 25               EOL  0.75
#> 26               EOL  0.75
#> 27               EOL  0.75
```
