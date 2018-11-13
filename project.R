library(tidycensus)
library(tidyverse)

erie<- get_acs(state = "NY", county = "Erie", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)
load("data/eriecensus.Rda")
load("data/buffcrime.Rda")


library(sf)

buffalotracts<- read_sf("data/geo_export_c9004500-af2b-4c4d-8cde-4de9d5831f2e.shp")
View(buffalotracts)       
load("data/bufftract.Rda")

library(sf)
crimepoints<- st_as_sf(crime, coords=c("longitude", "latitude"),
                         crs= 4326)
load("data/crimepoints.Rda")

library(dplyr)
joined.tracts <- merge(bufftract, erie, by.x = "geoid10", by.y = "GEOID",
                       +all.y = FALSE)
load("data/joinedtracts.Rda")
View(crimepoints)

plot(crimepoints)
plot(joined.tracts)
plot(buffalotracts)


