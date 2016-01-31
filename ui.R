# Developing Data Products- Course Project
# ui.R file for Shiny App
# Beth Fioretta - 1/31/2016

# This app is intended to help a user choose a car based on their desired Cylinders, Transmission, 
# MPG and HP, using the mtcars dataset

library(markdown)

shinyUI(navbarPage("Determine the Best Car Choices for You",
  tabPanel("Application",
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        helpText("Choose your preferences below and then click Search:"),

        # Provide selections for Transmission, Cylinders, MPG and HP and a Search button
        radioButtons('am', 'Transmission:', c("Automatic"=0, "Manual"=1)),
        checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
        sliderInput('mpg', 'Miles Per Gallon', min=10, max=35, value=c(10,35), step=1),
        sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
        actionButton("searchButton", label = "Search")
      ),
                              
      # Display the resulting table of car choices
      mainPanel(
        dataTableOutput('table')
      )
    )
  ),

    # Display the Help/About Tab
    tabPanel("About",
    mainPanel(
      includeMarkdown("About.md")
    )
  )
))