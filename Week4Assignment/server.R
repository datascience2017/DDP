#server code
library(shiny)
library(tidyr)
library(dplyr)
datasets::USPersonalExpenditure
Exp <- as.data.frame(USPersonalExpenditure)
#Using tidyr to transform data from wide to long format
d <- Exp %>% mutate(Category=as.factor(rownames(Exp))) %>% gather(year,Category) 
colnames(d)= c("Category", "Year", "Expense")

shinyServer(function(input, output) {
  
  model1 <- lm(Expense~as.factor(Year), data = d)
  model1pred <- reactive({predict(model1,newdata=data.frame(Year=input$sliderYear))})
  
  output$plot1 <- renderPlot({
    plot(d$Year, d$Expense,xlab="Year", ylab="Expenses in billions", bty="n",pch=16,
         xlim=c(1940,1960),ylim=c(0,80))
    legend(25,250,c("Model 1 Prediction", "Model 2 Prediction"),pch=16,
           col=c("red","blue"),bty="n",cex=1.2)
    points(input$sliderYear,model1pred(),col="red", pch=16, cex=2)
  })
  output$plot2 <- renderPlot({
    boxplot(d$Expense~d$Year,data=d,col=d$Category, main=" Summary of Expenses over the Years",
            xlab="Year", ylab="Expense in billions (USD)")
  })
  output$plot3 <- renderPlot({
    plot(d$Category, d$Expense, col=d$Year, mode="markers", main="Summary of Category of Expenses over the Years",
         xlab="Expense Category", ylab="Expense in billions (USD)")
  })
  output$pred1 <- renderText({model1pred()})
})