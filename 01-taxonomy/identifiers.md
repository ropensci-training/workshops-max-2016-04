## identifiers



Taxonomic identifiers are the currency you need to convert your names to in order to get any other taxonomic data. 

Unfortunately, there is no one identifier for each taxon to rule them all - each database has their own identifier for the same taxon.

Here, get identifiers from 5 different sources for *Poa annua*. Then we can pass those ids to other functions that act on those ids without any other input

_p.s. this also demonstrates the interactive prompt, as you'll see_


```r
library('taxize')
```

## Get ids from many sources at once


```r
out <- get_ids(names = "Poa annua", db = c('ncbi', 'itis', 'col', 'tropicos'))
#>                      name         rank                            colid
#> 1               Poa annua      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 2               Poa annua      species acecf232225c28ce7150f205cd357e77
#> 3      Poa annua alpigena      species 58dec8fbc003ca565d5258b41e213094
#> 4        Poa annua maxima infraspecies d456240394f6b1e4de538d7bd0606022
#> 5      Poa annua purpurea      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 6       Poa annua pygmaea      species 58dec8fbc003ca565d5258b41e213094
#> 7       Poa annua reptans      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 8        Poa annua exilis      species acecf232225c28ce7150f205cd357e77
#> 9     Poa annua notabilis      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 10     Poa annua pilantha      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 11       Poa annua supina      species 58dec8fbc003ca565d5258b41e213094
#> 12        Poa annua varia      species 58dec8fbc003ca565d5258b41e213094
#> 13     Poa annua aquatica      species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 14    Poa annua eriolepis      species 3b35900f74ff6e4b073ddb95c32b1f8d
...
out
#> $ncbi
#> Poa annua 
#>   "93036" 
#> attr(,"class")
#> [1] "uid"
#> attr(,"match")
#> [1] "found"
#> attr(,"uri")
#> [1] "http://www.ncbi.nlm.nih.gov/taxonomy/93036"
#> 
#> $itis
#> Poa annua 
#>   "41107" 
#> attr(,"match")
#> [1] "found"
...
```


```r
out$col
#>                          Poa annua 
#> "3b35900f74ff6e4b073ddb95c32b1f8d" 
#> attr(,"class")
#> [1] "colid"
#> attr(,"match")
#> [1] "found"
#> attr(,"uri")
#> [1] "http://www.catalogueoflife.org/col/details/species/id/3b35900f74ff6e4b073ddb95c32b1f8d"
```

## From single source, e.g,: ITIS


```r
get_tsn("Poa annua")
#> [1] "41107"
#> attr(,"match")
#> [1] "found"
#> attr(,"uri")
#> [1] "http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=41107"
#> attr(,"class")
#> [1] "tsn"
```

## Coerce a name or id to a taxon identifier class


```r
get_gbifid("Poa annua")
#> [1] "2704179"
#> attr(,"class")
#> [1] "gbifid"
#> attr(,"match")
#> [1] "found"
#> attr(,"uri")
#> [1] "http://www.gbif.org/species/2704179"
```


```r
as.gbifid("2704179")
#> [1] "2704179"
#> attr(,"class")
#> [1] "gbifid"
#> attr(,"match")
#> [1] "found"
#> attr(,"uri")
#> [1] "http://www.gbif.org/species/2704179"
```

## Many names - the ids class

In this case get many identifiers for many names


```r
mynames <- c("Helianthus annuus", "Pinus contorta", "Collomia grandiflora")
out <- get_ids(names = mynames, db = c('ncbi','itis','col','tropicos'))
#>                              name    rank                            colid
#> 1               Helianthus annuus species 87e986b0873f648711900866fa8abde7
#> 2        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
#> 3  Helianthus annuus lenticularis species 87e986b0873f648711900866fa8abde7
#> 4        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
#> 5       Helianthus annuus jaegeri species 87e986b0873f648711900866fa8abde7
#> 6  Helianthus annuus lenticularis species edaca9efbba0f3de178f59be0d99362f
#> 7    Helianthus annuus petiolaris species 5647a45549aa0c15a95bb44844bf93cc
#> 8       Helianthus annuus texanus species 87e986b0873f648711900866fa8abde7
#> 9        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
#> 10  Helianthus annuus argophyllus species f9ea8aec85f3f21e148d29f361f7c016
#> 11 Helianthus annuus lenticularis species 87e986b0873f648711900866fa8abde7
#> 12  Helianthus annuus macrocarpus species 87e986b0873f648711900866fa8abde7
#> 13      Helianthus annuus texanus species 87e986b0873f648711900866fa8abde7
#>                    name_status kingdom     family                acc_name
...
```


```r
out$tropicos
#>    Helianthus annuus       Pinus contorta Collomia grandiflora 
#>            "2700851"           "24900183"           "25800485" 
#> attr(,"class")
#> [1] "tpsid"
#> attr(,"match")
#> [1] "found" "found" "found"
#> attr(,"uri")
#> [1] "http://tropicos.org/Name/2700851"  "http://tropicos.org/Name/24900183"
#> [3] "http://tropicos.org/Name/25800485"
```


```r
class(out)
#> [1] "ids"
```


```r
class(out$col)
#> [1] "colid"
```
