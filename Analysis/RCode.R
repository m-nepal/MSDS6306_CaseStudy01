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
bv<- read.csv("Beers.csv",header= TRUE,na.strings = "NA")
brwv <- read.csv("Breweries.csv",header = TRUE, na.strings = "NA")
# check the two data set that you just read from .csv files
head(bv)
head(brwv)
# calulate the numbers of breweries in each state, used two method to verify 
brwv.per.state1 <- data.frame(table(brwv$State))
brwv.per.state2  <- aggregate(rep(1, length(brwv$State)),by=list(brwv$State), sum)

# numbers of NA in each column
missing.bv <- apply(bv,2, function(x){sum(is.na(x))})
missing.brwv <- apply(brwv,2, function(x){sum(is.na(x))})

# merge beers and breweries by Brewery_id
combined.data <- merge(bv, brwv, by.bv= bv$Brewery_id, by.brwv=brwv$Brew_ID, all.x = TRUE)


missing.combined <- apply(combined.data, 2, function(x){ sum(is.na(x))})

#


