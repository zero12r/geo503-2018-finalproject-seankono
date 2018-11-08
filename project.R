install.packages("RSocrata")
install.packages("maptools")
install.packages("tidycensus")

library("RSocrata")

crime <- read.socrata(
  "https://data.buffalony.gov/resource/d6g9-xbgu.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(crime)

codevi <- read.socrata(
  "https://data.buffalony.gov/resource/6qc6-gtgy.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(codevi)



library(tidycensus)
library(tidyverse)
census_api_key("a228276714dbd52068673939d5ccb03af28a4cab", overwrite = FALSE, install = TRUE)
Sys.getenv("a228276714dbd52068673939d5ccb03af28a4cab")

erie<- get_acs(state = "NY", county = "Erie", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)
head(erie)
View(erie)


library(maptools)
bufftracts<- readShapePoly("C:/Users/Asus/Documents/Project/bufftractsproj.shp") 
plot(bufftracts)
bufftracts@data
View(bufftracts)
