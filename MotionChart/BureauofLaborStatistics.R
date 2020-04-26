#Install or update current library of packages
library(googleVis)
library(tidyr)
library(dplyr)
library(scales)

#Go to https://beta.bls.gov/dataQuery/find?fq=survey:[ap]&s=popularity:D       
#And then select Coffee, 100% ground roast, fifth from the top
#import the data into r in your working directory
#Read it into R
#I have included the data set in the Motion Chart Folder 
#Read in the data set from the Motion Chart folder


Coffee_2<-read.csv("~/Test/MotionChart/Coffee_2.csv")

M4 <- gvisMotionChart(Coffee_2, idvar="Period", timevar="Year")
plot(M4)

#After you launch the Motion Chart change your web browser settings to allow flash player
#This data set  contains all possible variables for all time

#Read in a comma separated values data set from the Motion Chart Folder
GasolinePrice<-read.csv("~/Test/MotionChart/GasolinePrice.csv")

#Go to R Folder and make Gasoline Price a permanent Data set lines 21-25
GasolinePrice<- read.csv(file='~/Test/GasolinePrice.csv')
str(GasolinePrice)
M5 <- gvisMotionChart(GasolinePrice, idvar = "Period", timevar = "Year")
plot(M5)
