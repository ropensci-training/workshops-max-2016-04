## mapping biodiversity data



## Load libraries


```r
library('rgbif')
library('spocc')
library('mapr')
```

## Interactive maps

### Leaflet.js

[Leaflet JS](http://leafletjs.com/) is an open source mapping library that can leverage various layers from multiple sources. Using the [`leaflet`](http://cran.rstudio.com/package=leaflet) library, we can generate a local interactive map of species occurrence data.

An example:


```r
spp <- c('Danaus plexippus','Accipiter striatus','Pinus contorta')
dat <- occ(query = spp, from = 'gbif', has_coords = TRUE, limit = 100)
map_leaflet(dat)
```

![leafletmap](figure/leaflet.png)

### Geojson map as a Github gist


```r
spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')
dat <- occ(query = spp, from = 'gbif', has_coords = TRUE, limit = 100)
dat <- fixnames(dat)
map_gist(dat, color = c("#976AAE", "#6B944D", "#BD5945"))
```

![gistmap](figure/gistmap.png)

## Static maps

### base plots

Base plots, or the built in plotting facility in R accessed via `plot()`, is quite fast, but not easy or efficient to use, but are good for a quick glance at some data.


```r
spnames <- c('Accipiter striatus', 'Setophaga caerulescens', 'Spinus tristis')
out <- occ(query = spnames, from = 'gbif', has_coords = TRUE, limit = 100)
map_plot(out, cex = 1, pch = 10)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

### ggplot2

`ggplot2` is a powerful package for making visualizations in R. Read more about it [here](https://cran.rstudio.com/web/packages/ggplot2/).


```r
dat <- occ(query = 'Lynx rufus californicus', from = 'gbif', has_coords = TRUE, limit = 200)
map_ggplot(dat, map = "usa")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

### ggmap

Using the `ggmap` package we can create a ggplot, but with map data behind the points.


```r
map_ggmap(dat)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)
