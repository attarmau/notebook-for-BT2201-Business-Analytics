library("tidyverse") 
library("rpivotTable")
library("knitr")
# import excel file into RStudio
library(readxl)
BD <- read.excel("Bank Credit Risk Data.xlsx", sheet = "Base Data", skip = 2)
