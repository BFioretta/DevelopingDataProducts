# Developing Data Products- Course Project
# server.R file for Shiny App
# Beth Fioretta - 1/31/2016

# This app is intended to help a user choose a car based on their desired Cylinders, Transmission, 
# MPG and HP, using the mtcars dataset

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  # Display the cars that match the criteria chosen by the user
  output$table <- renderDataTable({
   
    input$searchButton 

    # Determine the ranges selected for MPG and HP
    mpg_seq <- isolate(seq(from = input$mpg[1], to = input$mpg[2], by = 0.1))
    hp_seq <- isolate(seq(from = input$hp[1], to = input$hp[2], by = 1))
    
    # Choose and name the columns to be displayed in the resulting data
    data <- isolate(transmute(mtcars, Car = rownames(mtcars), Transmission = am, Cylinders = cyl, MilesPerGallon = mpg, Horsepower = hp))
    
    # Filter the mtcars dataset by the criteria chosen by the user
    data <- isolate(filter(data, Transmission %in% input$am, Cylinders %in% input$cyl, MilesPerGallon %in% mpg_seq, Horsepower %in% hp_seq))
    data <- isolate(mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual")))
  
    # Sort by Car name
    data <- isolate(arrange(data, Car))
    data
  }, 
  # Allow the user to set how many results they want displayed at one time
  options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})