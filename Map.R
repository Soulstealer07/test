library(rvest)
library(dplyr)
Gas <- "https://gasprices.aaa.com/state-gas-price-averages/"
Gas_52 <- read_html(Gas)


Reg <- Gas_52 %>% 
  rvest::html_nodes('.regular') %>%
  rvest::html_text()
head(Reg)
Reg
gsub("[^0-9.]","",Reg)
Reg<-Reg[-c(1)]
Reg<-gsub("[$]","",Reg)
head(Reg)
Reg<-as.numeric(as.character(Reg))
Reg
str(Reg)
MidGrade <- Gas_52 %>%
  rvest::html_nodes('.mid_grade') %>%
  rvest::html_text()

head(MidGrade)
MidGrade
gsub("[^0-9.]","",MidGrade)
MidGrade<-MidGrade[-c(1)]
MidGrade<-gsub("[$]","",MidGrade)
head(MidGrade)
MidGrade<-as.numeric(as.character(MidGrade))
MidGrade

Premium <- Gas_52 %>% 
  rvest::html_nodes('.premium') %>%
  rvest::html_text()

head(Premium)
Premium
gsub("[^0-9.]","",Premium)
Premium<-Premium[-c(1)]
Premium<-gsub("[$]","",Premium)
head(Premium)
Premium<-as.numeric(as.character(Premium))
Premium

Diesel <- Gas_52 %>% 
  rvest::html_nodes('.diesel') %>%
  rvest::html_text()

head(Diesel)
Diesel
gsub("[^0-9.]","",Diesel)
Diesel<-Diesel[-c(1)]
Diesel<-gsub("[$]","",Diesel)
head(Diesel)
Diesel<-as.numeric(as.character(Diesel))
Diesel

State<-c("Alaska","Alabama","Arkansas","Arizona","California","Colorado","Connecticut","District of Columbia","Delaware","Florida","Georgia","Hawaii","Iowa","Idaho","Illinois","Indiana","Kansas","Kentucky","Lousiana","Massachusetts","Maryland","Maine","Michigan","Minnesota","Missouri","Mississippi","Montana","North Carolina","North Dakota","Nebraska","New Hampshire","New Jersey","New Mexico","Nevada","New York","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Virginia","Vermont","Washington","Wisconsin","West Virginia","Wyoming")
str(State)
Map_Gas <- cbind(State,Reg,MidGrade,Premium,Diesel)
Map_Gas
class(Map_Gas)
Map_Gas<-as.data.frame(Map_Gas)
class(Map_Gas)
str(Map_Gas)

Map<-data.frame(state.name,Reg)


M7<-gvisGeoChart(Map,"State","Reg",options=list(region="US",displayMode="regions",resolution="provinces",width=600,height=400))
plot(M7)
data("Exports")
Exports
data(states)
str(state.name)
str(State)
state.x77
str(state.x77)
