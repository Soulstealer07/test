library(googleVis)
library(tidyr)
library(dplyr)
library(scales)



#Go to https://beta.bls.gov/dataQuery/find?fq=survey:[ap]&s=popularity:D       
#And then select Coffee, 100% ground roast, fifth from the top
#import the data into r in your working directory
#Read it into R
Coffee <- read.csv(file='~/Test/Coffee.csv')
str(Coffee)

M3 <- gvisMotionChart(Coffee, idvar="Period", timevar="Year")
plot(M3)

str(Coffee_2)

M4 <- gvisMotionChart(Coffee_2, idvar="Period", timevar="Year")
plot(M4)
