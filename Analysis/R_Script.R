setwd("C:/Users/mohan/Desktop/MSDS6306_CaseStudy01/Data")
beer_import <- read.csv("Beers.csv", sep = ",", header = TRUE)
brewery_import <- read.csv("Breweries.csv", header = TRUE, sep=",")
head(brewery_import)
head(beer_import)
cleaned_beer <- rename(beer_import,Brew_ID = Brewery_id  )
head(cleaned_beer)

# used two method to verify number of brewery per state
# In this result, Var1 represnets the State and  Freq represents the number of brewery in that state
brewery.per.state1 <- data.frame(table(brewery_import$State))
#in this method Group.1 column is State and x represnts the number of brewery
brewery.per.state2  <- aggregate(rep(1, length(brewery_import$State)),by=list(brewery_import$State), sum)

# Merging two data set on Brew_ID

merged_data <- merge(cleaned_beer, brewery_import, by.x = "Brew_ID",by.y = "Brew_ID", all.x = FALSE,all.y = TRUE)
merged_data_all <- merge(cleaned_beer, brewery_import, by.x = "Brew_ID",by.y = "Brew_ID", all=TRUE)
merged_data_renamed <- rename(merged_data_all, Beer =Name.x , Brewery = Name.y)

# Report NA's each colu,n
missing.beer <- apply(cleaned_beer,2, function(x){sum(is.na(x))})
missing.brewery <- apply(brewery_import,2, function(x){sum(is.na(x))})
missing.merged <- apply(merged_data_renamed, 2, function(x){ sum(is.na(x))})

# median alcohal content and IBU for each state, plot bar chart
median_ABV <- tapply(merged_data_renamed$ABV,median) 

