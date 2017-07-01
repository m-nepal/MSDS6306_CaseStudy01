# MSDS6306_CaseStudy01
Case Study Submitted for MSDS 6306 Summer 2017 SMU.

# Data Set Description
Beers dataset contains a list of 2410 US craft beers and Breweries dataset contains 558 US breweries.
Both data set are present in <a href="https://github.com/m-nepal/MSDS6306_CaseStudy01/tree/master/Data"> Data Directory</a> in the project. 

##### Beers
* Name: Name of the beer.
* Beer_ID: Unique identier of the beer.
* ABV: Alcohol by volume of the beer.
* IBU: International Bitterness Units of the beer.
* Brewery_ID: Brewery id associated with the beer.
* Style: Style of the beer.
* Ounces: Ounces of beer.

##### Breweries
* Brew_ID: Unique identier of the brewery.
* Name: Name of the brewery.
* City: City where the brewery is located.
* State: State where the brewery is located.

## Required Library
Download <a href="https://cran.r-project.org/">R<a/> and <a href="https://www.rstudio.com/products/rstudio/download/">Rstudio</a> and install as you follow the code.

Once you download and install R and R studio, you need following libraries to complete the analyisis.
<ul><li><a href="http://ggplot2.org/">ggplot2<a/></li><li><a href="https://cran.r-project.org/web/packages/dplyr/index.html">dplyr<a/></li></ul>

#### SessionInfo :
R version 3.3.2 (2016-10-31)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows >= 8 x64 (build 9200)`

## What we are trying to achieve?
This project analyses the data with some of the basic features available in **R**.There are plenty of other analyis we can conduct in <a href="https://cran.r-project.org/">R<a/>, but this project focuses on the following:
<ul>
<li>Numbers of breweries per state</li>
<li>Merging <a href="https://github.com/m-nepal/MSDS6306_CaseStudy01/tree/master/Data">**Beers** and **Brewery**<a/> data set based on common brewery_id</li>
<li>Reporting number's of NA's in each column</li>
<li>Computing median of ABV and IBU per state and plotting bar chart</li>
<li>Reporting number's of NA's in each column</li>
<li>Computing maximum alcohalic beer and most bitter beer by state</li>
<li>Finding the relation between bitterness and it's alcohalic content</li>
</ul>

# Deliverable 
  <a href="https://github.com/m-nepal/MSDS6306_CaseStudy01.git">MSDS6306_CaseStudy01</a>  
  
# Author
 <a href ="https://github.com/m-nepal/MSDS6306_CaseStudy01/graphs/contributors">Mohan Nepal</a>
