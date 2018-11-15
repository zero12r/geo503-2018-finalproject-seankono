library(tidycensus)
library(tidyverse)

erie<- get_acs(state = "NY", county = "Erie", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)

load("data/eriecensus.Rda")
load("data/buffcrime.Rda")


library(sf)

load("data/crimepoints.Rda")


load("data/joinedtracts.Rda")



library(sp)
crime.spdf <- SpatialPointsDataFrame(coords = cbind(as.numeric(crime$longitude),
                      as.numeric(crime$latitude)), data = crime,
                      proj4string = CRS("+init=epsg:4326"))


library(rgdal)
openDataTracts <- readOGR("data/geo_export_c9004500-af2b-4c4d-8cde-4de9d5831f2e.shp",
                          stringsAsFactors = FALSE)

library(GISTools)
crimesInTracts <- poly.counts(crime.spdf, openDataTracts)


openDataTracts$crimeCounts <- crimesInTracts
openDataTracts$crimeCounts[which.max(openDataTracts$crimeCounts)] <- 0

library(sp)

spplot(openDataTracts, "crimeCounts")

openDataTracts@data <- merge(openDataTracts@data, erie, by.x = "geoid10_1", by.y = "GEOID",
                       all.y = FALSE, sort = FALSE)

spplot(openDataTracts, "crimeCounts")

openDataTracts$crimeDensity <- openDataTracts$crimeCounts / openDataTracts$total_pop

spplot(openDataTracts, "crimeDensity")

View(openDataTracts)

