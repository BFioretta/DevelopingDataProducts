---
title       : Developing Data Products Course Project
subtitle    : Find the Best Car for You
author      : Beth Fioretta
job         : Insurance Company
logo        : Logo.jpg
framework   : io2012        
highlighter : highlight.js  
hitheme     : tomorrow       
mode        : selfcontained 
knit        : slidify::knit2slides
---

## INTRODUCTION
This presentation is for the Developing Data Products Course Project from Coursera. The assignment has two parts. 

* First, create a Shiny application and deploy it on Rstudio's servers. 

* Second, use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation for the application.  


Links:
* The application developed for the first part of the assignment is available at: https://bfioretta.shinyapps.io/developingdataproducts/  
* The presentation is available at: https://github.com/BFioretta/DevelopingDataProducts  
* Files for the presentation are available on GitHub: https://github.com/BFioretta/DevelopingDataProducts

---

## FIND THE BEST CAR FOR YOU SHINY APPLICATION
This application allows the user to find the best car for them based on their selections for Transmission type, Cylinder, MPG and HP preferences.  The application utilizes the mtcars dataset.  

* First, use the radio buttons to select whether you prefer a Manual or Automatic transmission.
* Then, use the check boxes to select one or more cyclinder options.
* Lastly, use the sliders to indicate your preference ranges for Horse Power (HP) and Miles Per Gallon (MPG).

* When all selections have been made, click on the Search button to refresh the listing on the right with the cars which fit the criteria chosen.

---

## MTCARS DATASET
The data utilized by the application is the mtcars dataset.  This data was provided by the 1974 Motor Trend US magazine.  It consists of fuel consumption and 10 other aspects of automomobile design and performance for 32 cars (1973-1974).
Below is a summary of the data:

```
##       mpg             cyl             disp             hp       
##  Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
##  Median :19.20   Median :6.000   Median :196.3   Median :123.0  
##  Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
##  Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
##       drat             wt             qsec             vs        
##  Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
##  1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
##  Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
##  Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
##  3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
##  Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
##        am              gear            carb      
##  Min.   :0.0000   Min.   :3.000   Min.   :1.000  
##  1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
##  Median :0.0000   Median :4.000   Median :2.000  
##  Mean   :0.4062   Mean   :3.688   Mean   :2.812  
##  3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
##  Max.   :1.0000   Max.   :5.000   Max.   :8.000
```

---

## DATA FILTERING
The Shiny code uses a simple filter statement based on the selections by the user.
* am represents the Transmission choice
* cyl represents the Cylinder choice
* MilesPerGallon represents the MPG range chosen
* Horsepower represents the HP range chosen

Below is the actual filter statement used:
* data <- isolate(filter(data, Transmission %in% input$am, Cylinders %in% input$cyl, MilesPerGallon %in% mpg_seq, Horsepower %in% hp_seq))

---


