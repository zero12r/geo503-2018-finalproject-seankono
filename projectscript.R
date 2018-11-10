library(RSocrata)

df <- read.socrata(
   "https://data.buffalony.gov/resource/d6g9-xbgu.json",
   app_token = "jtxzwzPsjknrX3ozK0YwNynS4",
   email     = "geojared@buffalo.edu",
   password  = "sp8shell!")
   
df.larceny <- read.socrata(
   "https://data.buffalony.gov/resource/d6g9-xbgu.json?incident_type_primary=LARCENY/THEFT",
   app_token = "jtxzwzPsjknrX3ozK0YwNynS4",
   email     = "geojared@buffalo.edu",
   password  = "sp8shell!")


codevi <- read.socrata(
  "https://data.buffalony.gov/resource/6qc6-gtgy.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(codevi)

library(maptools)
bufftracts<- readShapePoly("C:/Users/Asus/Documents/Project/bufftractsproj.shp") 
plot(bufftracts)
bufftracts@data
View(bufftracts)

# Materials and methods

Narrative and most code will go here.  Describe what you are doing and show how to do it (with code).

You can do bullets like this:
  
  * The first most important thing
* The second most important thing
* The third most important thing

You can do numbers like this:
  
  1. The first most important thing
2. The second most important thing
3. The third most important thing

See [http://rmarkdown.rstudio.com/](http://rmarkdown.rstudio.com/) for all the amazing things you can do.


Here's my first code chunk.
```{r}
1+2
```

Load any required packages in a code chunk (you may need to install some packages):

```{r, message=F, warning=F}
library(dplyr)
library(ggplot2)
library(maps)

knitr::opts_chunk$set(cache=TRUE)  # cache the results for quick compiling
```


We are going to use the `occ()` function to download _occurrence_ records for the American robin (_Turdus migratorius_) from the [Global Biodiversity Information Facility](gbif.org).

<img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/Turdus-migratorius-002.jpg" alt="alt text" width="200">
<small><small><small>Licensed under CC BY-SA 3.0 via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Turdus-migratorius-002.jpg#/media/File:Turdus-migratorius-002.jpg)</small></small></small>

```{r, warning=F} 
## define which species to query
sp='Turdus migratorius'

## run the query and convert to data.frame()
```
This can take a few seconds.

```{r, fig.width=6, fig.height=3, fig.cap="Map illustrating the known occurrence locations"}
# Load coastline
map=map_data("world")


```



