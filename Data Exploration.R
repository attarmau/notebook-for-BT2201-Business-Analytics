library("tidyverse") 
library("rpivotTable")
library("knitr")

# import excel file into RStudio
library(readxl)
BD <- read.excel("Bank Credit Risk Data.xlsx", sheet = "Base Data", skip = 2)

# example of drawing a histogram
h.s <- hist (ceosal1$`salary`,
             main= 'Histogram of salary',
             xlab = 'salary',
             ylab = 'Amount of salary',
             col = c('darkorange'),
             ylim = c(0,160),
             labels = TRUE)
