# load required packages
library(dplyr)
library(tidyr)
library(car) # for linearHypothesis()
library(ggplot2) # optional. we expect you to know base graphics, but allow ggplot if you find it easier
library(psych) # for pairs.panels()
library(factoextra) # for fviz_cluster()
library(wooldridge)
library(kernlab)

#Import the dataset and name it as gpa3
gpa3<-read.csv("/Users/judyhuang/Desktop/NUS/Business Analyst/Data Mining/dataset/gpa3.csv")

# ----------------------
#Select independent variables "X"
#The independent variables in gpa3X are used for part [Q2(b)]
# ----------------------
gpa3X = gpa3 %>% select(c("verbmath","hsrank", "hsperc","trmgpa", "tothrs","sat"))
psych::pairs.panels(gpa3X, lm=TRUE)

# --------------------
# create a binary variable 'pass',
# --------------------
gpa3$pass <- ifelse(gpa3$cumgpa > quantile(gpa3$cumgpa, 0.2), 1, 0)
