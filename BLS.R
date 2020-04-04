library(googleVis)
library(tidyr)
library(dplyr)
library(scales)


data(Fruits)
str(Fruits)
head(Fruits)


M1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(M1)

M2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date",date.format = "\%Y\%m\%d") 
plot(M2)

Coffee <- read.csv(file='~/Test/Coffee.csv')
str(Coffee)

M3 <- gvisMotionChart(Coffee, idvar="Period", timevar="Year")
plot(M3)

str(Coffee_2)

M4 <- gvisMotionChart(Coffee_2, idvar="Period", timevar="Year")
plot(M4)
