
========================================================
transition: rotate

<h2>Find the Best Car for You Shiny Application</h2>  
<h3>Beth Fioretta</h3>
<h3>1/31/2016</h3>
-------------

![presentation_app](find_car.jpg)

========================================================
## INTRODUCTION
<small>
This presentation is for the Developing Data Products Course Project from Coursera. The assignment has two parts. 

* First, create a Shiny application and deploy it on Rstudio's servers. 

* Second, use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation for the application.  


Links:
* The application developed for the first part of the assignment is available at: https://bfioretta.shinyapps.io/developingdataproducts/  
* The presentation is available at: https://github.com/BFioretta/DevelopingDataProducts  
* Files for the presentation are available on GitHub: https://github.com/BFioretta/DevelopingDataProducts
</small>

========================================================
## FIND THE BEST CAR FOR YOU SHINY APPLICATION
<small>
This application allows the user to find the best car for them based on their selections for Transmission type, Cylinder, MPG and HP preferences.  The application utilizes the mtcars dataset.  

* First, use the radio buttons to select whether you prefer a Manual or Automatic transmission.
* Then, use the check boxes to select one or more cyclinder options.
* Lastly, use the sliders to indicate your preference ranges for Horse Power (HP) and Miles Per Gallon (MPG).
* When all selections have been made, click on the Search button to refresh the listing on the right with the cars which fit the criteria chosen.
</small>

========================================================
## MTCARS DATASET
<small>
The data utilized by the application is the mtcars dataset.  This data was provided by the 1974 Motor Trend US magazine.  It consists of fuel consumption and 10 other aspects of automomobile design and performance for 32 cars (1973-1974).
Below is a sample of the data:
</small>

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

========================================================
## DATA FILTERING
<small>
The Shiny code uses a simple filter statement based on the selections by the user.
* am represents the Transmission choice
* cyl represents the Cylinder choice
* MilesPerGallon represents the MPG range chosen
* Horsepower represents the HP range chosen

Below is the actual filter statement used:

* data <- isolate(filter(data, Transmission %in% input$am, Cylinders %in% input$cyl, MilesPerGallon %in% mpg_seq, Horsepower %in% hp_seq))
</small>
