# cleaning variables
rm(list=ls())
ls()
# set the working dir and imprt the two csv files

setwd("C:/Users/mohan/Desktop/MSDS6306_CaseStudy01/Data")
# here we are replacing blank cell as NA
beers <- read.csv("Beers.csv", sep = ",", header = TRUE,na.strings = c("","NA"))
breweries <- read.csv("Breweries.csv", header = TRUE, sep=",",na.strings =c("","NA"))
# check the content of beers and breweries
head(beers)
head(breweries)

# used two method to verify number of brewery per state

brewery_ps_way1 <- data.frame(table(breweries$State))

brewery_ps_way2 <- aggregate(rep(1, length(breweries$State)),by=list(breweries$State), sum)
# check the number of brwery per state by calling head method
head(brewery_ps_way1)
# In this result, Var1 represnets the State and  Freq represents the number of brewery in that state
head(brewery_ps_way2)
#in this method Group.1 column is State and x represnts the number of brewery
# first 6 rows,  we can verify both of the method are giving the same result.
# Using dplyr package rename method to give meaning full name
install.packages("dplyr")
library(dplyr)
breweriesPerState <- rename(brewery_ps_way1,State = Var1,Breweries_Count = Freq)
head(breweriesPerState)
# We can apply the same rename method in way 2 also.
# Merging two data set on Brew_ID
merged_data <- merge(beers, breweries, by.x = "Brewery_id",by.y = "Brew_ID")
dim(merged_data)
# Here Beer name is listed as Name.x and Brewery name as Name.y 
# Use rename method to give some meaning full name on merged data
# use rename method from "dplyr" package
merged_new <- rename(merged_data, Beer = Name.x , Brewery = Name.y)
head(merged_new)
tail(merged_new)

# Report NA's each column
missing.beer <- apply(beers,2, function(x){sum(is.na(x))})
missing.brewery <- apply(breweries,2, function(x){sum(is.na(x))})
missing.merged <- apply(merged_new, 2, function(x){ sum(is.na(x))})
# another way to report missing merge
merged_2 <- replace(merged_new, merged_new == "", NA)
missing.merged_2 <- apply(merged_2, 2, function(x){ sum(is.na(x))})
# check the missing contents 
missing.beer
missing.brewery
missing.merged
missing.merged_2

# Assign a new merged data set to a new variable for easy use for further analysis
cleanedData <- merged_2
# Check first 6 and last 6 rows
head(cleanedData)
tail(cleanedData)
# For computing median for alcohal content and IBU for each state used two methods for comparing the result
#install.packages("dplyr")
library(dplyr)
library(ggplot2)

#finding medain ABV and IBU per state
median_per_state_way1 <- ddply(cleanedData, .(State), summarize,  ABV=median(ABV), IBU=median(IBU))
median_per_state_way2 <- cleanedData %>% group_by(State) %>% summarise_at(vars(ABV, IBU), median)
head(median_per_state_way1)
head(median_per_state_way2)
# the above method doesn't seem to provide correct result, so I used another method here just to verify
median_ABV_IBU <- aggregate(cbind(cleanedData$ABV,cleanedData$IBU)~State, FUN = median,cleanedData,na.rm = TRUE)
head(median_ABV_IBU)
#here ABV is named as V1 and IBU as V2, so using colnames we can rename to give meaningful name
colnames(median_ABV_IBU) <- c("State","Median_ABV","Median_IBU")
head(median_ABV_IBU)
# bar chart???
ggplot(median_ABV_IBU,aes(median_ABV_IBU$State, y=median_ABV_IBU$Median_ABV))+
    geom_bar(stat="identity")+labs(x="State",y="ABV") + ggtitle("IBU median per State")
ggplot(median_ABV_IBU,aes(median_ABV_IBU$State, y=median_ABV_IBU$Median_IBU))+
  geom_bar(stat="identity")+labs(x="State",y="IBU")+ggtitle("ABV median per State")

#combined
library(reshape2)
bpdata <- melt(median_ABV_IBU$State)
ggplot(bpdata,aes(Block,value,fill=variable))+
  geom_bar(stat="identity",position="dodge")

# Which state MAX alcohalic beer?

max_ABV <- max(cleanedData$ABV,na.rm = TRUE)
max_ABV_2 <- arrange(cleanedData,desc(cleanedData$ABV))
max_ABV_3 <- head(max_ABV_2,1)
max_ABV_State <- data.frame(max_ABV_3$State,max_ABV_3$ABV)

# IBU
max_IBU <- max(cleanedData$IBU,na.rm = TRUE)
max_IBU_2 <- arrange(cleanedData,desc(cleanedData$IBU))
max_IBU_3 <- head(max_IBU_2,1)
max_IBU_State <- data.frame(max_IBU_3$State,max_IBU_3$IBU)

# let's find out which state has  the max ABV and Most bitter beer
max_ABV_State 
max_IBU_State
# CO has max ABV and OR has most bitter beer

# summary statistics of ABV
summary(cleanedData$ABV)



# install.packages
install.packages("ggplot2")
library(ggplot2)
ggplot(beers, aes(x = ABV, y = IBU)) + geom_point(na.rm=TRUE)+geom_smooth(method=lm,se=FALSE, na.rm=TRUE)







