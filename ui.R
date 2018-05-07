#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Number of Clusters, Iris Data"),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("k",
                   "Choose Number of Clusters:",
                   min = 2,
                   max = 10,
                   value = 3)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       includeMarkdown("./readme.Rmd"),
       plotOutput("clustPlot"),
       plotOutput("origPlot")
    )
  )
))
