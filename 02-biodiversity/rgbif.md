### rgbif




```r
library('rgbif')
```

## Number of occurrences

Search by type of record, all observational in this case


```r
occ_count(basisOfRecord='OBSERVATION')
#> [1] 87403105
```

Records for **Puma concolor** with lat/long data (georeferened) only. Note that `hasCoordinate` in `occ_search()` is the same as `georeferenced` in `occ_count()`.


```r
occ_count(taxonKey=2435099, georeferenced=TRUE)
#> [1] 2857
```

Records from Denmark


```r
denmark_code <- isocodes[grep("Denmark", isocodes$name), "code"]
occ_count(country=denmark_code)
#> [1] 10282229
```

## Search for taxon names

* `name_lookup()` does full text search of all name data.


```r
out <- name_lookup(query = 'mammalia')
```


```r
names(out)
#> [1] "meta"        "data"        "facets"      "hierarchies" "names"
```


```r
out$meta
#>   offset limit endOfRecords  count
#> 1      0   100        FALSE 147220
```


```r
head(out$data)
#>         key scientificName                           datasetKey nubKey
#> 1 119383812       Mammalia 4b4931d6-e70b-4ae8-b067-3fb5e1776061    359
#> 2 119508567       Mammalia 4c2f5f6a-ba43-47ca-8554-e17176773803    359
#> 3 119370263       Mammalia 532843db-4c4b-458a-b1c2-1a3982eeb891    359
#> 4 119370733       Mammalia eba29bd8-005c-438b-a9d0-6da43b35468e    359
#> 5 119374418       Mammalia 3e78f998-3f38-4307-9292-7ff052b8455b    359
#> 6 119375518       Mammalia 531f77bf-5599-45cf-8024-aec7cf4c96c3    359
#>   parentKey   parent  kingdom   phylum kingdomKey phylumKey  classKey
#> 1 119383811 Chordata Animalia Chordata  119383810 119383811 119383812
#> 2 119508557 Chordata Animalia Chordata  119508264 119508557 119508567
#> 3 119370262 Chordata Animalia Chordata  119370261 119370262 119370263
#> 4 119370732 Chordata Animalia Chordata  119370719 119370732 119370733
#> 5 119374417 Chordata Animalia Chordata  119374416 119374417 119374418
#> 6 119375517 Chordata Animalia Chordata  119375447 119375517 119375518
#>   canonicalName taxonomicStatus  rank numDescendants numOccurrences
#> 1      Mammalia        ACCEPTED CLASS              0              0
#> 2      Mammalia        ACCEPTED CLASS              0              0
#> 3      Mammalia        ACCEPTED CLASS              0              0
#> 4      Mammalia        ACCEPTED CLASS              0              0
#> 5      Mammalia        ACCEPTED CLASS              0              0
#> 6      Mammalia        ACCEPTED CLASS              0              0
#>   habitats nomenclaturalStatus threatStatuses synonym    class order
#> 1     <NA>                  NA             NA   FALSE Mammalia  <NA>
#> 2     <NA>                  NA             NA   FALSE Mammalia  <NA>
#> 3     <NA>                  NA             NA   FALSE Mammalia  <NA>
#> 4     <NA>                  NA             NA   FALSE Mammalia  <NA>
#> 5     <NA>                  NA             NA   FALSE Mammalia  <NA>
#> 6     <NA>                  NA             NA   FALSE Mammalia  <NA>
#>   family orderKey familyKey authorship nameType extinct publishedIn
#> 1   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#> 2   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#> 3   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#> 4   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#> 5   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#> 6   <NA>       NA        NA       <NA>     <NA>      NA        <NA>
#>   accordingTo taxonID
#> 1        <NA>    <NA>
#> 2        <NA>    <NA>
#> 3        <NA>    <NA>
#> 4        <NA>    <NA>
#> 5        <NA>    <NA>
#> 6        <NA>    <NA>
```


```r
out$facets
#> NULL
```


```r
out$hierarchies[1:2]
#> $`119383812`
#>     rankkey     name
#> 1 119383810 Animalia
#> 2 119383811 Chordata
#> 
#> $`119508567`
#>     rankkey     name
#> 1 119508264 Animalia
#> 2 119508557 Chordata
```


```r
out$names[2]
#> $`113391223`
#>   vernacularName language
#> 1        Mammals      eng
```

* `name_backbone()` - search against the GBIF backbone taxonomy


```r
name_backbone(name = 'Helianthus', rank = 'genus', kingdom = 'plants')
#> $usageKey
#> [1] 3119134
#> 
#> $scientificName
#> [1] "Helianthus L."
#> 
#> $canonicalName
#> [1] "Helianthus"
#> 
#> $rank
#> [1] "GENUS"
#> 
#> $status
#> [1] "ACCEPTED"
#> 
#> $confidence
#> [1] 97
#> 
#> $matchType
#> [1] "EXACT"
#> 
#> $kingdom
#> [1] "Plantae"
#> 
#> $phylum
#> [1] "Magnoliophyta"
#> 
#> $order
#> [1] "Asterales"
#> 
#> $family
#> [1] "Asteraceae"
#> 
#> $genus
#> [1] "Helianthus"
#> 
#> $kingdomKey
#> [1] 6
#> 
#> $phylumKey
#> [1] 49
#> 
#> $classKey
#> [1] 220
#> 
#> $orderKey
#> [1] 414
#> 
#> $familyKey
#> [1] 3065
#> 
#> $genusKey
#> [1] 3119134
#> 
#> $synonym
#> [1] FALSE
#> 
#> $class
#> [1] "Magnoliopsida"
```


## Single occurrence records

Get data for a single occurrence. Note that data is returned as a list, with slots for metadata and data, or as a hierarchy, or just data.

Just data


```r
occ_get(key = 766766824, return = 'data')
#>              name       key decimalLatitude decimalLongitude        issues
#> 1 Corvus monedula 766766824         59.4568          17.9054 depunl,gass84
```

Just taxonomic hierarchy


```r
occ_get(key=766766824, return='hier')
#>              name     key    rank
#> 1        Animalia       1 kingdom
#> 2        Chordata      44  phylum
#> 3            Aves     212   class
#> 4   Passeriformes     729   order
#> 5        Corvidae    5235  family
#> 6          Corvus 2482468   genus
#> 7 Corvus monedula 2482473 species
```

Get many occurrences. `occ_get` is vectorized


```r
occ_get(key=c(766766824, 101010, 240713150, 855998194), return='data')
#>                   name       key decimalLatitude decimalLongitude
#> 1      Corvus monedula 766766824         59.4568          17.9054
#> 2 Platydoras armatulus    101010              NA               NA
#> 3             Pelosina 240713150        -77.5667         163.5830
#> 4     Sciurus vulgaris 855998194         58.4068          12.0438
#>           issues
#> 1  depunl,gass84
#> 2               
#> 3 cdround,gass84
#> 4  depunl,gass84
```


## Search for occurrences

* `occ_search()`


```r
occ_search(scientificName = "Ursus americanus", limit = 20)
#> Records found [7782] 
#> Records returned [20] 
#> No. unique hierarchies [1] 
#> No. media records [19] 
#> Args [scientificName=Ursus americanus, limit=20, offset=0, fields=all] 
#> First 10 rows of data
#> 
#>                name        key decimalLatitude decimalLongitude
#> 1  Ursus americanus 1249277297        35.76789        -75.80894
#> 2  Ursus americanus 1229610234        44.06062        -71.92692
#> 3  Ursus americanus 1229610216        44.06086        -71.92712
#> 4  Ursus americanus 1253300445        44.65481        -72.67270
#> 5  Ursus americanus 1249284297        43.68723        -72.32891
#> 6  Ursus americanus 1249296297        39.08590       -105.24586
#> 7  Ursus americanus 1253314877        49.25782       -122.82786
#> 8  Ursus americanus 1253317181        43.64214        -72.52494
#> 9  Ursus americanus 1262389246        43.80871        -72.20964
#> 10 Ursus americanus 1257415362        44.32746        -72.41007
#> ..              ...        ...             ...              ...
#> Variables not shown: issues (chr), datasetKey (chr), publishingOrgKey
#>      (chr), publishingCountry (chr), protocol (chr), lastCrawled (chr),
#>      lastParsed (chr), extensions (chr), basisOfRecord (chr), taxonKey
#>      (int), kingdomKey (int), phylumKey (int), classKey (int), orderKey
#>      (int), familyKey (int), genusKey (int), speciesKey (int),
#>      scientificName (chr), kingdom (chr), phylum (chr), order (chr),
#>      family (chr), genus (chr), species (chr), genericName (chr),
#>      specificEpithet (chr), infraspecificEpithet (chr), taxonRank (chr),
#>      dateIdentified (chr), year (int), month (int), day (int), eventDate
#>      (chr), modified (chr), lastInterpreted (chr), references (chr),
#>      identifiers (chr), facts (chr), relations (chr), geodeticDatum (chr),
#>      class (chr), countryCode (chr), country (chr), rightsHolder (chr),
#>      identifier (chr), verbatimEventDate (chr), datasetName (chr), gbifID
#>      (chr), verbatimLocality (chr), collectionCode (chr), occurrenceID
#>      (chr), taxonID (chr), license (chr), recordedBy (chr), catalogNumber
#>      (chr), http...unknown.org.occurrenceDetails (chr), institutionCode
#>      (chr), rights (chr), identificationID (chr), eventTime (chr),
#>      occurrenceRemarks (chr), coordinateAccuracy (dbl),
#>      coordinateAccuracyInMeters (dbl), informationWithheld (chr)
```

Ideally, search for names first, make sure you have the right name, then pass the GBIF key to the `occ_search()` function:


```r
key <- name_suggest(q='Helianthus annuus', rank='species')$key[1]
occ_search(taxonKey=key, limit=20)
#> Records found [20337] 
#> Records returned [20] 
#> No. unique hierarchies [1] 
#> No. media records [12] 
#> Args [taxonKey=3119195, limit=20, offset=0, fields=all] 
#> First 10 rows of data
#> 
#>                 name        key decimalLatitude decimalLongitude
#> 1  Helianthus annuus 1249279611        34.04810       -117.79884
#> 2  Helianthus annuus 1249286909        32.58747        -97.10081
#> 3  Helianthus annuus 1253308332        29.67463        -95.44804
#> 4  Helianthus annuus 1262375813        29.82586        -95.45604
#> 5  Helianthus annuus 1262379231        34.04911       -117.80066
#> 6  Helianthus annuus 1262385911        32.78328        -96.70352
#> 7  Helianthus annuus 1143516596        35.42767       -105.06884
#> 8  Helianthus annuus 1095851641         0.00000          0.00000
#> 9  Helianthus annuus 1088900309        33.95239       -117.32011
#> 10 Helianthus annuus 1135523136        33.96709       -117.99769
#> ..               ...        ...             ...              ...
#> Variables not shown: issues (chr), datasetKey (chr), publishingOrgKey
#>      (chr), publishingCountry (chr), protocol (chr), lastCrawled (chr),
#>      lastParsed (chr), extensions (chr), basisOfRecord (chr), taxonKey
#>      (int), kingdomKey (int), phylumKey (int), classKey (int), orderKey
#>      (int), familyKey (int), genusKey (int), speciesKey (int),
#>      scientificName (chr), kingdom (chr), phylum (chr), order (chr),
#>      family (chr), genus (chr), species (chr), genericName (chr),
#>      specificEpithet (chr), taxonRank (chr), dateIdentified (chr), year
#>      (int), month (int), day (int), eventDate (chr), modified (chr),
#>      lastInterpreted (chr), references (chr), identifiers (chr), facts
#>      (chr), relations (chr), geodeticDatum (chr), class (chr), countryCode
#>      (chr), country (chr), rightsHolder (chr), identifier (chr),
#>      verbatimEventDate (chr), datasetName (chr), gbifID (chr),
#>      verbatimLocality (chr), collectionCode (chr), occurrenceID (chr),
#>      taxonID (chr), license (chr), recordedBy (chr), catalogNumber (chr),
#>      http...unknown.org.occurrenceDetails (chr), institutionCode (chr),
#>      rights (chr), eventTime (chr), identificationID (chr),
#>      coordinateAccuracy (dbl), coordinateAccuracyInMeters (dbl),
#>      occurrenceRemarks (chr), elevation (dbl), elevationAccuracy (dbl),
#>      stateProvince (chr), recordNumber (chr), municipality (chr), locality
#>      (chr), language (chr), type (chr), ownerInstitutionCode (chr),
#>      identifiedBy (chr), nomenclaturalCode (chr), institutionID (chr),
#>      dataGeneralizations (chr), footprintWKT (chr), county (chr),
#>      occurrenceStatus (chr), footprintSRS (chr), higherClassification
#>      (chr), collectionID (chr), informationWithheld (chr)
```

Most parameters are vectorized, so you can pass in more than one value:


```r
splist <- c('Cyanocitta stelleri', 'Junco hyemalis', 'Aix sponsa')
keys <- sapply(splist, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE)
occ_search(taxonKey = keys, limit = 5)
#> Occ. found [7192170 (1174), 2492010 (2471625), 2498387 (775152)] 
#> Occ. returned [7192170 (5), 2492010 (5), 2498387 (5)] 
#> No. unique hierarchies [7192170 (1), 2492010 (1), 2498387 (1)] 
#> No. media records [7192170 (5), 2492010 (4), 2498387 (5)] 
#> Args [taxonKey=7192170,2492010,2498387, limit=5, offset=0, fields=all] 
#> First 10 rows of data from 7192170
#> 
#>                  name        key decimalLatitude decimalLongitude  issues
#> 1 Cyanocitta stelleri 1147228297        34.73360        -119.9871        
#> 2 Cyanocitta stelleri 1147069796        39.61584        -120.5881 cdround
#> 3 Cyanocitta stelleri 1147244155        39.61584        -120.5881 cdround
#> 4 Cyanocitta stelleri 1147049486        39.61584        -120.5881 cdround
#> 5 Cyanocitta stelleri 1147110343        39.61584        -120.5881 cdround
#> Variables not shown: datasetKey (chr), publishingOrgKey (chr),
#>      publishingCountry (chr), protocol (chr), lastCrawled (chr),
#>      lastParsed (chr), extensions (chr), basisOfRecord (chr),
#>      establishmentMeans (chr), taxonKey (int), kingdomKey (int), phylumKey
#>      (int), classKey (int), orderKey (int), familyKey (int), genusKey
#>      (int), speciesKey (int), scientificName (chr), kingdom (chr), phylum
#>      (chr), order (chr), family (chr), genus (chr), species (chr),
#>      genericName (chr), specificEpithet (chr), infraspecificEpithet (chr),
#>      taxonRank (chr), continent (chr), stateProvince (chr), year (int),
#>      month (int), day (int), eventDate (chr), modified (chr),
#>      lastInterpreted (chr), references (chr), identifiers (chr), facts
#>      (chr), relations (chr), geodeticDatum (chr), class (chr), countryCode
#>      (chr), country (chr), institutionID (chr), county (chr), language
#>      (chr), gbifID (chr), type (chr), occurrenceStatus (chr),
#>      catalogNumber (chr), vernacularName (chr), institutionCode (chr),
#>      rights (chr), behavior (chr), identifier (chr), nomenclaturalCode
#>      (chr), higherGeography (chr), verbatimEventDate (chr), endDayOfYear
#>      (chr), georeferenceVerificationStatus (chr), locality (chr),
#>      collectionCode (chr), verbatimLocality (chr), occurrenceID (chr),
#>      recordedBy (chr), startDayOfYear (chr), occurrenceRemarks (chr),
#>      accessRights (chr)
```
