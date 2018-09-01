#
# This shiny app runs a prediction model over mtcars dataset.
#
# 

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Model to predict miles per gallon using weigth,transmission mode and 1/4 mile time"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Enter the following details to predict the species:"),
      numericInput("wt","Enter the weigth",value=0),
      numericInput("am","Enter the transmission mode",value=0,min = 0,max=1),
      numericInput("qsec","Enter the 1.4 mile time",value=0),
      h5("These information will be used to predict the miles per gallon for the car"),
      submitButton("submit")
      
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("The following graphs show the relationships between miles per gallon and predictors."),
      plotOutput("plot"),
      h4("The prediction based on the following information is:"),
      textOutput("prediction")
      
    )
  )
  ))
