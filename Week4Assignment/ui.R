
library(shiny)
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict Expense based on Year"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderYear", "What is the Year?", value= 1950, min=1940,max=1960,step = 5),
      checkboxInput("showPlots","Show/Hide Additional Plots",value=TRUE),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1", height = 350, width = 700) ,
      h4("Predicted Expense from Model",height = 10, width = 10),
      textOutput("pred1"),
      conditionalPanel("input.showPlots==true", plotOutput("plot2",height=300),
                       plotOutput("plot3",height=300))
      
    )
      )
    )
  )
  