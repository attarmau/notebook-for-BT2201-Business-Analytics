library("tidyverse") 
library("rpivotTable")
library("knitr")

# import excel file into RStudio
library(readxl)
BD <- read.excel(".xlsx", sheet = "Base Data", skip = 2)
