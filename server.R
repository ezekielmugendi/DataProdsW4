#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(ggplot2)

library(shiny)
data(iris)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$clustPlot <- renderPlot({
    
    modelo    <- kmeans(iris[,1:4],input$k,nstart=20)
    clasif<- cbind(iris,pred=as.factor(modelo$cluster))
    
    # Draw the scatter of the Iris data color coded by cluster
    
    ggplot(data=clasif)+geom_point(aes(x=Sepal.Width, y=Petal.Width,color=pred))
    
  })

  output$origPlot <- renderPlot({

    # Draw the scatter of the Iris data color coded by cluster
     ggplot(data=iris)+geom_point(aes(x=Sepal.Width, y=Petal.Width,color=Species))
    
 })
  
})
