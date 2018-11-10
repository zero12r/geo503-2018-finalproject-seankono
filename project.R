install.packages("RSocrata")
install.packages("maptools")
install.packages("tidycensus")
install.packages("dplyr")
install.packages("GISTools")

library("RSocrata")

crime <- read.socrata(
  "https://data.buffalony.gov/resource/d6g9-xbgu.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(crime)


bufftract <- read.socrata(
  "https://data.buffalony.gov/resource/pg8k-g5iz.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(bufftract)




library(tidycensus)
library(tidyverse)
census_api_key("a228276714dbd52068673939d5ccb03af28a4cab", overwrite = FALSE, install = TRUE)
Sys.getenv("a228276714dbd52068673939d5ccb03af28a4cab")

erie<- get_acs(state = "NY", county = "Erie", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)
head(erie)
View(erie)

library(dplyr)

joined.tracts <- merge(bufftract, erie, by.x = "geoid10", by.y = "GEOID",
                       all.y = FALSE)
View(joined.tracts)

library(GISTools)
library(sp)

library(maptools)
buffalotracts<- readShapePoly("C:/Users/Asus/Documents/R/R(Git)/geo503-2018-seankono/geo_export_c9004500-af2b-4c4d-8cde-4de9d5831f2e.shp")

buffalotracts<- readShapePoly("C:/Users/Asus/Documents/R/R(Git)/geo503-2018-seankono/geo_export_c9004500-af2b-4c4d-8cde-4de9d5831f2e.shp")

?SpatialPointsDataFrame
crimepoints<- SpatialPointsDataFrame(crime, data=)
