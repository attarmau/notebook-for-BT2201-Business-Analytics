library("tidyverse") 
library("rpivotTable")
library("knitr")

# import excel file into RStudio
library(readxl)
BD <- read.excel("this is your files name.xlsx", sheet = "Base Data", skip = 2)
