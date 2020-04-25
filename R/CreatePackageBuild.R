#Create a new r package to save a permanent data set
install.packages("devtools")
library(devtools)
install.packages("usethis")
library(usethis)
devtools::create("C:/Users/micha/OneDrive/Documents/Test/")
usethis::use_data(name='mydataset')
3
file.create("~/Test/Package/data.R")
getwd()
TexasCounties <-read.csv("~/Test/TexasCounties/TexasCountyMerger_10.csv")
as.data.frame(TexasCounties)
TexasCounties$LatLong <- paste(TexasCounties$y_long,TexasCounties$x_lat,sep=":")
head(TexasCounties)
str(TexasCounties)
usethis::use_data(TexasCounties,overwrite=TRUE)
data(TexasCounties)
str(TexasCounties)


GasolinePrice<- read.csv(file='~/Test/GasolinePrice.csv')
as.data.frame(GasolinePrice)
usethis::use_data(GasolinePrice,overwrite=TRUE)
data(GasolinePrice)
str(GasolinePrice)
GasolinePrice$Value[470]
max(GasolinePrice$Value)
floor(which(GasolinePrice$Value==max(GasolinePrice$Value))/(12))+1980


#From Map.R line 70

Map<-read.csv(file='~/Test/Map.csv')
as.data.frame(Map)
usethis::use_data(Map,overwrite = TRUE)
data(Map)
str(Map)
CC<-gvisGeoChart(Exports,locationvar="Country",colorvar="Profit",options=list(height=300, width=200))
plot(CC)
library(rmarkdown)
render("~/Test/Package/Markdown.Rmd",output_file="report.html")
render("~/Test/TexasCounties/CountyMarkdown.Rmd",output_file="CountyReport.html")
render("~/Test/Package/CommoditiesReport26.Rmd",output_file="~/Test/Package/CountyReport14.html")


render("~/Test/Package/MotionChart.Rmd",output_file="~/Test/Package/MotionChart.html")


plot(GasolinePrice,col="blue",pch=20)
str(GasolinePrice)
CX<-gvisGeoChart(Map,"State","Reg",options=list(region="US",displayMode="regions",resolution="provinces",width=350,height=300))
plot(CX)

