### spocc





```r
library('spocc')
```

## spocc unifies access to biodiversity data across sources

### Data sources

* [GBIF](http://www.gbif.org/)
* [BISON](http://bison.usgs.ornl.gov/)
* [eBird](http://ebird.org/content/ebird/)
* [iNaturalist](http://www.inaturalist.org/)
* [Berkeley Ecoengine](https://ecoengine.berkeley.edu/)
* [AntWeb](http://www.antweb.org/)
* [VertNet](http://vertnet.org/)
* [iDigBio](https://www.idigbio.org/)

## Get data


```r
out <- occ(query = 'Accipiter striatus', from = 'gbif')
```

GBIF data w/ metadata


```r
out$gbif
#> Species [Accipiter striatus (500)] 
#> First 10 rows of [Accipiter_striatus]
#> 
#> Source: local data frame [500 x 118]
#> 
#>                  name  longitude latitude  prov              issues
#>                 <chr>      <dbl>    <dbl> <chr>               <chr>
#> 1  Accipiter striatus  -97.21962 32.88749  gbif      cdround,gass84
#> 2  Accipiter striatus  -98.24809 26.10815  gbif      cdround,gass84
#> 3  Accipiter striatus  -72.48018 43.72704  gbif      cdround,gass84
#> 4  Accipiter striatus  -95.50117 29.76086  gbif      cdround,gass84
#> 5  Accipiter striatus -116.67145 32.94147  gbif      cdround,gass84
#> 6  Accipiter striatus -123.44703 48.54571  gbif      cdround,gass84
#> 7  Accipiter striatus -123.44703 48.54571  gbif      cdround,gass84
#> 8  Accipiter striatus  -97.63810 30.24674  gbif cdround,cudc,gass84
#> 9  Accipiter striatus  -97.40153 30.74022  gbif      cdround,gass84
#> 10 Accipiter striatus  -81.85267 28.81852  gbif              gass84
#> ..                ...        ...      ...   ...                 ...
#> Variables not shown: key <int>, datasetKey <chr>, publishingOrgKey <chr>,
#>   publishingCountry <chr>, protocol <chr>, lastCrawled <chr>, lastParsed
#>   <chr>, extensions <chr>, basisOfRecord <chr>, taxonKey <int>, kingdomKey
#>   <int>, phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
#>   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
#>   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
#>   genericName <chr>, specificEpithet <chr>, taxonRank <chr>,
#>   dateIdentified <chr>, coordinateAccuracy <dbl>, year <int>, month <int>,
#>   day <int>, eventDate <date>, modified <chr>, lastInterpreted <chr>,
#>   references <chr>, identifiers <chr>, facts <chr>, relations <chr>,
#>   coordinateAccuracyInMeters <dbl>, geodeticDatum <chr>, class <chr>,
#>   countryCode <chr>, country <chr>, rightsHolder <chr>, identifier <chr>,
#>   informationWithheld <chr>, verbatimEventDate <chr>, datasetName <chr>,
#>   gbifID <chr>, verbatimLocality <chr>, collectionCode <chr>, occurrenceID
#>   <chr>, taxonID <chr>, license <chr>, recordedBy <chr>, catalogNumber
#>   <chr>, http...unknown.org.occurrenceDetails <chr>, institutionCode
#>   <chr>, rights <chr>, occurrenceRemarks <chr>, identificationID <chr>,
#>   eventTime <chr>, sex <chr>, establishmentMeans <chr>, continent <chr>,
#>   stateProvince <chr>, institutionID <chr>, county <chr>, language <chr>,
#>   type <chr>, preparations <chr>, occurrenceStatus <chr>,
#>   nomenclaturalCode <chr>, higherGeography <chr>, endDayOfYear <chr>,
#>   locality <chr>, disposition <chr>, otherCatalogNumbers <chr>,
#>   startDayOfYear <chr>, accessRights <chr>, higherClassification <chr>,
#>   individualCount <int>, elevation <dbl>, elevationAccuracy <dbl>,
#>   identificationVerificationStatus <chr>, locationAccordingTo <chr>,
#>   identifiedBy <chr>, georeferencedDate <chr>, georeferencedBy <chr>,
#>   georeferenceProtocol <chr>, georeferenceVerificationStatus <chr>,
#>   verbatimCoordinateSystem <chr>, organismID <chr>,
#>   previousIdentifications <chr>, identificationQualifier <chr>,
#>   samplingProtocol <chr>, georeferenceSources <chr>, dynamicProperties
#>   <chr>, infraspecificEpithet <chr>, and 13 more <...>.
```

empty


```r
out$ebird$data
#> $Accipiter_striatus
#> data frame with 0 columns and 0 rows
```

metadata, your query parameters, time the call executed, etc.


```r
out$gbif$meta
#> $source
#> [1] "gbif"
#> 
#> $time
#> [1] "2016-04-25 12:06:50 CEST"
#> 
#> $found
#> [1] 529394
#> 
#> $returned
#> [1] 500
#> 
#> $type
#> [1] "sci"
#> 
#> $opts
#> $opts$scientificName
#> [1] "Accipiter striatus"
#> 
#> $opts$limit
#> [1] 500
#> 
#> $opts$fields
#> [1] "all"
#> 
#> $opts$config
#> list()
```

just data


```r
out$gbif$data
#> $Accipiter_striatus
#> Source: local data frame [500 x 118]
#> 
#>                  name  longitude latitude              issues  prov
#>                 <chr>      <dbl>    <dbl>               <chr> <chr>
#> 1  Accipiter striatus  -97.21962 32.88749      cdround,gass84  gbif
#> 2  Accipiter striatus  -98.24809 26.10815      cdround,gass84  gbif
#> 3  Accipiter striatus  -72.48018 43.72704      cdround,gass84  gbif
#> 4  Accipiter striatus  -95.50117 29.76086      cdround,gass84  gbif
#> 5  Accipiter striatus -116.67145 32.94147      cdround,gass84  gbif
#> 6  Accipiter striatus -123.44703 48.54571      cdround,gass84  gbif
#> 7  Accipiter striatus -123.44703 48.54571      cdround,gass84  gbif
#> 8  Accipiter striatus  -97.63810 30.24674 cdround,cudc,gass84  gbif
#> 9  Accipiter striatus  -97.40153 30.74022      cdround,gass84  gbif
#> 10 Accipiter striatus  -81.85267 28.81852              gass84  gbif
#> ..                ...        ...      ...                 ...   ...
#> Variables not shown: key <int>, datasetKey <chr>, publishingOrgKey <chr>,
#>   publishingCountry <chr>, protocol <chr>, lastCrawled <chr>, lastParsed
#>   <chr>, extensions <chr>, basisOfRecord <chr>, taxonKey <int>, kingdomKey
#>   <int>, phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
#>   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
#>   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
#>   genericName <chr>, specificEpithet <chr>, taxonRank <chr>,
#>   dateIdentified <chr>, coordinateAccuracy <dbl>, year <int>, month <int>,
#>   day <int>, eventDate <date>, modified <chr>, lastInterpreted <chr>,
#>   references <chr>, identifiers <chr>, facts <chr>, relations <chr>,
#>   coordinateAccuracyInMeters <dbl>, geodeticDatum <chr>, class <chr>,
#>   countryCode <chr>, country <chr>, rightsHolder <chr>, identifier <chr>,
#>   informationWithheld <chr>, verbatimEventDate <chr>, datasetName <chr>,
#>   gbifID <chr>, verbatimLocality <chr>, collectionCode <chr>, occurrenceID
#>   <chr>, taxonID <chr>, license <chr>, recordedBy <chr>, catalogNumber
#>   <chr>, http...unknown.org.occurrenceDetails <chr>, institutionCode
#>   <chr>, rights <chr>, occurrenceRemarks <chr>, identificationID <chr>,
#>   eventTime <chr>, sex <chr>, establishmentMeans <chr>, continent <chr>,
#>   stateProvince <chr>, institutionID <chr>, county <chr>, language <chr>,
#>   type <chr>, preparations <chr>, occurrenceStatus <chr>,
#>   nomenclaturalCode <chr>, higherGeography <chr>, endDayOfYear <chr>,
#>   locality <chr>, disposition <chr>, otherCatalogNumbers <chr>,
#>   startDayOfYear <chr>, accessRights <chr>, higherClassification <chr>,
#>   individualCount <int>, elevation <dbl>, elevationAccuracy <dbl>,
#>   identificationVerificationStatus <chr>, locationAccordingTo <chr>,
#>   identifiedBy <chr>, georeferencedDate <chr>, georeferencedBy <chr>,
#>   georeferenceProtocol <chr>, georeferenceVerificationStatus <chr>,
#>   verbatimCoordinateSystem <chr>, organismID <chr>,
#>   previousIdentifications <chr>, identificationQualifier <chr>,
#>   samplingProtocol <chr>, georeferenceSources <chr>, dynamicProperties
#>   <chr>, infraspecificEpithet <chr>, and 13 more <...>.
```

## Data Form

```
response -- |
            | -- gbif --- |
                          | -- meta 
                          | -- data -- | 
                                       | -- Accipiter_striatus
                                       | -- Puma_concolor
            | -- ecoengine
            ... and so on for each data source

```

## Combine data

`occ2df()` pulls a few key columns


```r
out <- occ(query = 'Accipiter striatus', from = c('gbif', 'ebird'))
occ2df(out)
#> Source: local data frame [1,000 x 6]
#> 
#>                  name  longitude latitude  prov       date        key
#>                 <chr>      <dbl>    <dbl> <chr>     <date>      <chr>
#> 1  Accipiter striatus  -97.21962 32.88749  gbif 2016-01-30 1249281822
#> 2  Accipiter striatus  -98.24809 26.10815  gbif 2016-01-13 1229927690
#> 3  Accipiter striatus  -72.48018 43.72704  gbif 2016-01-17 1233600875
#> 4  Accipiter striatus  -95.50117 29.76086  gbif 2016-01-09 1229610478
#> 5  Accipiter striatus -116.67145 32.94147  gbif 2016-01-12 1229613664
#> 6  Accipiter striatus -123.44703 48.54571  gbif 2016-01-30 1249281491
#> 7  Accipiter striatus -123.44703 48.54571  gbif 2016-01-30 1249281424
#> 8  Accipiter striatus  -97.63810 30.24674  gbif 2016-01-16 1229927481
#> 9  Accipiter striatus  -97.40153 30.74022  gbif 2016-01-27 1249286013
#> 10 Accipiter striatus  -81.85267 28.81852  gbif 2016-01-17 1253301153
#> ..                ...        ...      ...   ...        ...        ...
```

* Combining data within source easy 
* Combining data across data sources messy, but can be done - ask me
