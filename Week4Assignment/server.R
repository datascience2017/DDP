#install.packages("shiny")
library(shiny)
library(tidyr)
library(dplyr)

# In this study, we are using the dataset: US Personal Expenditure from the year 1940 till 1960.
# This study shows interactive plots using Shiny package.
# I have also created a model using linear regression to predict Expenses based on year.
# If you move the slider, to change the year(example : 1940 or 1950 etc), you will see predicted expenses for that year.
# Plot 1: This plot displays the Expenses based on the year and also the predicted expenses as per the model created.
# If click on the checkbox 'Show/hide Plot': you will be able to see additional plots that may be useful information about the data.
# Plot 2: This boxplot displays the overall Expenditure across the years.
# Plot 3: This boxplot displays the overall Expenditure across the expense categories(Medical, Food etc)

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
    boxplot(d$Expense~d$Year,data=d,col=d$Category, main=" Summary of Expenses by Year",
            xlab="Year", ylab="Expense in billions (USD)")
  })
  output$plot3 <- renderPlot({
    plot(d$Category, d$Expense, col=d$Year, mode="markers", main="Summary of Expenses over the Years by Category",
         xlab="Expense Category", ylab="Expense in billions (USD)")
  })
  output$pred1 <- renderText({model1pred()})
})