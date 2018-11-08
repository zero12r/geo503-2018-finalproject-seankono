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