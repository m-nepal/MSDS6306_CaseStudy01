# make sure your working directory
getwd()
# Create directory as Data and Analysis for separation of concern
dir.create("Analysis")
dir.create("Data")
# Copy the two data set provided in the data directory in back end
# Set the working directrory as data directory
setwd("C:/Users/mohan/Desktop/MSDS6306_CaseStudy01/Data")
# make sure you have your two files 
list.files()
# read and assign the bv variable for beers data set
bv<- read.csv("Beers.csv",header= TRUE)
brv <- read.csv("Breweries.csv",header = TRUE)
# check the two data set that you just read from .csv files
head(bv)
head(brv)
# calulate the numbers of breweries in each state, used to method to verify 
brv.per.state1 <- data.frame(table(brv$State))
brv.per.state2  <- aggregate(rep(1, length(brv$State)),by=list(brv$State), sum)




