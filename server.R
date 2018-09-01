#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output) {
  
  data(mtcars) 
  model<-lm(mpg~wt+qsec+am,data=mtcars)
  
  output$plot<-renderPlot({
    par(mfrow=c(1,3))
    plot(mtcars$mpg~mtcars$wt,xlab="weight",ylab="miles per gallon")
    plot(mtcars$mpg~mtcars$qsec,xlab="1/4 mile time",ylab ="miles per gallon")
    plot(mtcars$mpg~mtcars$am,xlab="transmission mode",ylab="miles per gallon")
  
  })
  
  modelpred<-reactive({
    wt<-input$wt
    qsec<-input$qsec
    am<-input$am
    p.w<-input$p.w
    pred<-predict(model,newdata = data.frame(wt=wt,qsec=qsec,am=am))
  })
  output$prediction<-renderText({modelpred()})
  
  
})
