install.packages("RSocrata")
library("RSocrata")
install.packages("maptools")

df <- read.socrata(
  "https://data.buffalony.gov/resource/d6g9-xbgu.json",
  app_token = "y67OCQdGIHD80tqceGSZV8rj1",
  email     = "seankono@buffalo.edu",
  password  = "Skbuff66$")
View(df)

install.packages("tidycensus")
library(tidycensus)
library(tidyverse)
census_api_key("a228276714dbd52068673939d5ccb03af28a4cab", overwrite = FALSE, install = TRUE)
Sys.getenv("a228276714dbd52068673939d5ccb03af28a4cab")

library(maptools)
bufftracts<- readShapePoly("C:/Users/Asus/Documents/Project/bufftractsproj.shp") 
plot(bufftracts)

bufftracts@data
