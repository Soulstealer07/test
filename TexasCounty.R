TexasCounty<-'https://en.wikipedia.org/wiki/List_of_counties_in_Texas'
TexasCounty_pop<-read_html(TexasCounty)
TexasCounty_pop <- TexasCounty_pop %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table[2]') %>%
  html_table()
TexasCounty_pop <- as.data.frame(TexasCounty_pop)
TexasCounty_pop <- TexasCounty_pop[-c(3,4,5,6,9)]
head(TexasCounty_pop)
str(TexasCounty_pop)
#This table has relevant population and size data
 
library(maps)
counties<-map_data("county")
Texas <- map('county','texas',fill=TRUE, col=palette())


library(ggmap)
library(ggplot2)
library(dplyr)
library(rjson)
library(jsonlite)
library(RCurl)
library(googleVis)

#This API has relevant location data latitude and longitude for each county in Texas
base_url <- "https://data.texas.gov/resource/ups3-9e8m.json"
County_Gov<-fromJSON(base_url)
str(County_Gov)
County_Gov<- County_Gov[-c(5,6,7,8)]
str(County_Gov)
County_combine <- cbind(TexasCounty_pop,County_Gov)
str(County_combine)

#Combine Wikipedia Table and Json Data


County_csv <- write.csv(County_combine,"C:/Users/micha/OneDrive/Documents/Test/TexasCounties/County_csv.csv")



G6 <- gvisGeoChart(TexasCountyMerger_10,locationvar = "LatLong",colorvar='Population',sizevar = "AreaSQMILES",hovervar = "County",options=list(region="US-TX",displayMode="Markers",resolution="provinces",width=600,height=400))
plot(G6)
