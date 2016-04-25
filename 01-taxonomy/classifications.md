## classifications



Next to identifiers, taxonomic classifications are possibly the next most
widely and useful bits of data.

Most people want to know what higher taxonomic groups their taxa are nested within. 

With identifiers we just played with, we can now get classification data.


```r
library('taxize')
```

## classification - via id


```r
classification(9696, db = 'ncbi')
#> $`9696`
#>                    name         rank      id
#> 1    cellular organisms      no rank  131567
#> 2             Eukaryota superkingdom    2759
#> 3          Opisthokonta      no rank   33154
#> 4               Metazoa      kingdom   33208
#> 5             Eumetazoa      no rank    6072
#> 6             Bilateria      no rank   33213
#> 7         Deuterostomia      no rank   33511
#> 8              Chordata       phylum    7711
#> 9              Craniata    subphylum   89593
#> 10           Vertebrata      no rank    7742
#> 11        Gnathostomata      no rank    7776
#> 12           Teleostomi      no rank  117570
#> 13         Euteleostomi      no rank  117571
#> 14        Sarcopterygii      no rank    8287
#> 15 Dipnotetrapodomorpha      no rank 1338369
#> 16            Tetrapoda      no rank   32523
#> 17              Amniota      no rank   32524
#> 18             Mammalia        class   40674
#> 19               Theria      no rank   32525
#> 20             Eutheria      no rank    9347
#> 21        Boreoeutheria      no rank 1437010
#> 22       Laurasiatheria   superorder  314145
#> 23            Carnivora        order   33554
#> 24           Feliformia     suborder  379583
#> 25              Felidae       family    9681
#> 26              Felinae    subfamily  338152
#> 27                 Puma        genus  146712
#> 28        Puma concolor      species    9696
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "ncbi"
```


```r
classification(5285750, db = 'gbif')
#> $`5285750`
#>             name    rank      id
#> 1        Plantae kingdom       6
#> 2      Pinophyta  phylum     101
#> 3      Pinopsida   class     194
#> 4        Pinales   order     640
#> 5       Pinaceae  family    3925
#> 6          Pinus   genus 2684241
#> 7 Pinus contorta species 5285750
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "gbif"
```

## classification - via taxonomic name


```r
classification("Puma concolor", db = 'ncbi')
#> $`Puma concolor`
#>                    name         rank      id
#> 1    cellular organisms      no rank  131567
#> 2             Eukaryota superkingdom    2759
#> 3          Opisthokonta      no rank   33154
#> 4               Metazoa      kingdom   33208
#> 5             Eumetazoa      no rank    6072
#> 6             Bilateria      no rank   33213
#> 7         Deuterostomia      no rank   33511
#> 8              Chordata       phylum    7711
#> 9              Craniata    subphylum   89593
#> 10           Vertebrata      no rank    7742
#> 11        Gnathostomata      no rank    7776
#> 12           Teleostomi      no rank  117570
#> 13         Euteleostomi      no rank  117571
#> 14        Sarcopterygii      no rank    8287
#> 15 Dipnotetrapodomorpha      no rank 1338369
#> 16            Tetrapoda      no rank   32523
#> 17              Amniota      no rank   32524
#> 18             Mammalia        class   40674
#> 19               Theria      no rank   32525
#> 20             Eutheria      no rank    9347
#> 21        Boreoeutheria      no rank 1437010
#> 22       Laurasiatheria   superorder  314145
#> 23            Carnivora        order   33554
#> 24           Feliformia     suborder  379583
#> 25              Felidae       family    9681
#> 26              Felinae    subfamily  338152
#> 27                 Puma        genus  146712
#> 28        Puma concolor      species    9696
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "ncbi"
```


```r
classification("Pinus contorta", db = 'gbif')
#> $`Pinus contorta`
#>             name    rank      id
#> 1        Plantae kingdom       6
#> 2      Pinophyta  phylum     101
#> 3      Pinopsida   class     194
#> 4        Pinales   order     640
#> 5       Pinaceae  family    3925
#> 6          Pinus   genus 2684241
#> 7 Pinus contorta species 5285750
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "gbif"
```

## Many ids as input


```r
ids <- get_ids(names = "Poa annua", db = c('ncbi', 'itis', 'col', 'tropicos'))
cls <- classification(ids)
```


```r
cls
#> $ncbi
#> $`93036`
#>                                      name         rank      id
#> 1                      cellular organisms      no rank  131567
#> 2                               Eukaryota superkingdom    2759
#> 3                           Viridiplantae      kingdom   33090
#> 4                            Streptophyta       phylum   35493
#> 5                          Streptophytina      no rank  131221
#> 6                             Embryophyta      no rank    3193
#> 7                            Tracheophyta      no rank   58023
#> 8                           Euphyllophyta      no rank   78536
#> 9                           Spermatophyta      no rank   58024
#> 10                          Magnoliophyta      no rank    3398
#> 11                        Mesangiospermae      no rank 1437183
#> 12                             Liliopsida        class    4447
#> 13                          Petrosaviidae      no rank 1437197
#> 14                            commelinids     subclass    4734
#> 15                                 Poales        order   38820
#> 16                                Poaceae       family    4479
#> 17                              BOP clade      no rank  359160
#> 18                               Pooideae    subfamily  147368
#> 19                                 Poodae      no rank 1648037
#> 20                                  Poeae        tribe  147387
#> 21 Poeae Chloroplast Group 2 (Poeae type)      no rank 1652081
#> 22                                 Poinae     subtribe  640628
#> 23                                    Poa        genus    4544
#> 24                              Poa annua      species   93036
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "ncbi"
#> 
#> $itis
#> $`41107`
#>               name          rank     id
#> 1          Plantae       kingdom 202422
#> 2    Viridiplantae    subkingdom 954898
#> 3     Streptophyta  infrakingdom 846494
#> 4      Embryophyta superdivision 954900
#> 5     Tracheophyta      division 846496
#> 6  Spermatophytina   subdivision 846504
#> 7    Magnoliopsida         class  18063
#> 8         Lilianae    superorder 846542
#> 9           Poales         order 846620
#> 10         Poaceae        family  40351
#> 11             Poa         genus  41074
#> 12       Poa annua       species  41107
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "itis"
#> 
#> $col
#> $`3b35900f74ff6e4b073ddb95c32b1f8d`
#>           name    rank                               id
#> 1      Plantae kingdom 208cf441fe2e1662376a9ce9e80782e1
#> 2 Tracheophyta  phylum 73328ba4e1446e1ee3602956b66eb127
#> 3   Liliopsida   class 9547d6f9ee601e15b7f2a8c8c5b75cc0
#> 4       Poales   order 8706f65023e59e202544569f3f741a13
#> 5      Poaceae  family d01bb56e344e74c4cd8279d28612897e
#> 6          Poa   genus 05a770dabe07e396368e8417beef8599
#> 7    Poa annua species 3b35900f74ff6e4b073ddb95c32b1f8d
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "col"
#> 
#> $tropicos
#> $`25509881`
#>            name       rank        id
#> 1 Equisetopsida      class  43000109
#> 2   Magnoliidae   subclass  43000013
#> 3      Lilianae superorder 100352386
#> 4        Poales      order  50181956
#> 5       Poaceae     family  42000357
#> 6           Poa      genus  40012319
#> 
#> attr(,"class")
#> [1] "classification"
#> attr(,"db")
#> [1] "tropicos"
#> 
#> attr(,"class")
#> [1] "classification_ids"
```


## Combine classifications


```r
df <- rbind(cls)
head(df)
#>                 name         rank     id query   db
#> 1 cellular organisms      no rank 131567 93036 ncbi
#> 2          Eukaryota superkingdom   2759 93036 ncbi
#> 3      Viridiplantae      kingdom  33090 93036 ncbi
#> 4       Streptophyta       phylum  35493 93036 ncbi
#> 5     Streptophytina      no rank 131221 93036 ncbi
#> 6        Embryophyta      no rank   3193 93036 ncbi
```
