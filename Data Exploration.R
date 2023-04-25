library("tidyverse") 
library("rpivotTable")
library("knitr")

# import excel file into RStudio
library(readxl)
BD <- read.excel("Bank Credit Risk Data.xlsx", sheet = "Base Data", skip = 2)

Example Questio 1:
Context: Use data(‘ceosal1’). This is a data set from a 1991 issue of Business Week of CEO’s salaries in 1990.  
The data.frame has 209 observations on 12 variables: 

- `salary`: 1990 salary, thousands $ 
- `pcsalary`: percent change salary, 1989-1990 
- `sales`: 1990 firm sales, millions $ 
- `roe`: return on equity, 1988-1990 avg 
- `pcroe`: percent change roe, 1988-1990
- `ros`: return on firm’s stock, 1988-1990
- `indus`: =1 if industrial firm 
- `finance`: =1 if financial firm
- `consprod`: =1 if consumer product firm 
- `utility`: =1 if transport or utilities 
- `lsalary`: natural log of salary 
- `lsales`: natural log of sales

# example of drawing a histogram
h.s <- hist (ceosal1$`salary`,
             main= 'Histogram of salary',
             xlab = 'salary ( thousands $ )',
             ylab = 'No. of CEO salaries',
             col = c('darkorange'),
             ylim = c(0,200),
             labels = TRUE)
