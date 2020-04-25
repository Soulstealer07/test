#First load all necessary packages to complete the project

library(rvest)
library(dplyr)
library(googleVis)

#Scrape the webpage with the relevant gasoline price data
Gas <- "https://gasprices.aaa.com/state-gas-price-averages/"
#Read it in and give it an object name to save in your global environment
Gas_52 <- read_html(Gas)

#Filter the html doc according to CSS inpector node names, first is regular gasoline prices, using rvest package
Reg <- Gas_52 %>% 
rvest::html_nodes('.regular') %>%
rvest::html_text()
head(Reg)
Reg

#Clean the code with gsub function
gsub("[^0-9.]","",Reg)
Reg<-Reg[-c(1)]
Reg<-gsub("[$]","",Reg)
head(Reg)
Reg<-as.numeric(as.character(Reg))
Reg
str(Reg)

#Get midgrade gasoline prices
MidGrade <- Gas_52 %>%
rvest::html_nodes('.mid_grade') %>%
rvest::html_text()

head(MidGrade)
MidGrade
#Clean the code with gsub
gsub("[^0-9.]","",MidGrade)
MidGrade<-MidGrade[-c(1)]
MidGrade<-gsub("[$]","",MidGrade)
head(MidGrade)
MidGrade<-as.numeric(as.character(MidGrade))
str(MidGrade)
MidGrade

#Finally get premium gasoline prices
Premium <- Gas_52 %>% 
rvest::html_nodes('.premium') %>%
rvest::html_text()

#Clean the code using gsub
head(Premium)
Premium
gsub("[^0-9.]","",Premium)
Premium<-Premium[-c(1)]
Premium<-gsub("[$]","",Premium)
head(Premium)
str(Premium)
Premium<-as.numeric(as.character(Premium))
Premium

#Get Diesel Gasoline prices
Diesel <- Gas_52 %>% 
rvest::html_nodes('.diesel') %>%
rvest::html_text()

head(Diesel)
Diesel

#Clean the code
gsub("[^0-9.]","",Diesel)
Diesel<-Diesel[-c(1)]
Diesel<-gsub("[$]","",Diesel)
head(Diesel)
str(Diesel)
Diesel<-as.numeric(as.character(Diesel))
Diesel

#Make a state vector of characters variables 
State<-c("Alaska","Alabama","Arkansas","Arizona","California","Colorado","Connecticut","District of Columbia","Delaware","Florida","Georgia","Hawaii","Iowa","Idaho","Illinois","Indiana","Kansas","Kentucky","Lousiana","Massachusetts","Maryland","Maine","Michigan","Minnesota","Missouri","Mississippi","Montana","North Carolina","North Dakota","Nebraska","New Hampshire","New Jersey","New Mexico","Nevada","New York","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Virginia","Vermont","Washington","Wisconsin","West Virginia","Wyoming")
str(State)

#Combine the data state vector with the other numeric gasoline price data vectors
Map_Gas <- cbind(State,Reg,MidGrade,Premium,Diesel)
str(Map_Gas)
head(Map_Gas)
class(Map_Gas)
#Convert the matrix of data vectors into a data frame object
Map_Gas<-as.data.frame(Map_Gas,stringsAsFactors = FALSE)
class(Map_Gas)
str(Map_Gas)

#Write the data frame object to a temporary file in the working directory

Map_csv<-write.csv(Map_Gas,"~/Test/CheapGasoline/Map_csv.csv")
#Go to R file folder and create a permanent data set from the temporary file lines 33-37
data(Map)
str(Map)
M7<-gvisGeoChart(Map,locationvar = 'State',colorvar = 'MidGrade',options=list(region="US",displayMode="regions",resolution="provinces",width=600,height=400))
plot(M7)






