# plant names using `names_list`




```r
library("taxize")
```

`names_list()` is a function that gets you names from Theplantlist

By default gets generic names, and returns 10 items


```r
names_list()
#>  [1] "Adelia"        "Anacolosa"     "Helichrysum"   "Ficus"        
#>  [5] "Ptarmica"      "Logania"       "Kleinia"       "Gloxinia"     
#>  [9] "Nanobryum"     "Brachionidium"
```

Get 5 species names


```r
names_list('species', 5)
#> [1] "Bulbophyllum ikongoense"   "Holostigma heterophyllum" 
#> [3] "Multidentia sclerocarpa"   "Dimorphanthera alpivaga"  
#> [5] "Hieracium plantaginifrons"
```

Get 10 family names


```r
names_list('family', 10)
#>  [1] "Azaleaceae"     "Platycaryaceae" "Hederaceae"     "Balanitaceae"  
#>  [5] "Cneoraceae"     "Medeolaceae"    "Stratiotaceae"  "Lopeziaceae"   
#>  [9] "Dilatridaceae"  "Gesneriaceae"
```
