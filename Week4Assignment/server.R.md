US Personal Expenditure 
========================================================
author: 
date: November 22, 2017
autosize: true

Data Summary
========================================================

In this study, we are using the dataset: US Personal Expenditure from the year 1940 till 1960.



```
             Category Year Expense
1    Food and Tobacco 1940  22.200
2 Household Operation 1940  10.500
3  Medical and Health 1940   3.530
4       Personal Care 1940   1.040
5   Private Education 1940   0.341
6    Food and Tobacco 1945  44.500
```


========================================================
This study shows interactive plots using Shiny package. 

The application can be viewed at: https://datascience2017coursera.shinyapps.io/Week4Assignment/

The application is build using Shiny package and the source code is in 2 files:
- `ui.R`
- `server.R`

Both files can be found here: [GitHub repo](https://github.com/datascience2017/DDP/tree/master/Week4Assignment)

Sumamry
========================================================
A model using linear regression has been created to predict Expenses based on year. 

If you move the slider, to change the year(example : 1940 or 1950 etc), you will see predicted expenses for that year. 

Plot 1: This plot displays the Expenses based on the year and also the predicted expenses as per the model created.

If click on the checkbox 'Show/hide Plot': you will be able to see additional plots that may be useful information about the data. 
Plot 2: This boxplot displays the overall Expenditure across the years.
Plot 3: This boxplot displays the overall Expenditure across the expense categories(Medical, Food etc.).

