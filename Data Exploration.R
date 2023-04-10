 This part will use dataset `ChickWeight`. 
# This dataset is from an experiment conducted to study the effect of diet on early growth of chicks. 

# The 2 variables are defined as follows:
  
# - weight: body weight of the chick (gm).
# - Time: number of days since birth when the measurement was made.
# - Chick: a unique identifier for the chick. 
# - Diet: a variable from 1, ..., 4 indicating which experimental diet the chick received.

#### 1) Inspect the dataset (2 marks)
# i) Use the functions you have learnt in Part 1 of this tutorial to inspect the dataset `ChickWeight`. Describe this dataset in 
#    terms of the number of observations, number of variables, and type of variables. (2 marks)
?ChickWeight
nrow(ChickWeight)
ls(ChickWeight)
typeof(ChickWeight)
summary(ChickWeight)
head(ChickWeight)
tail(ChickWeight)

#### 2) Variables (5 marks)
# i) Assign the dataset `ChickWeight` to `dfc`. (1 mark)
dfc <- ChickWeight

# ii) Rename the variable in `dfc` from `weight` to `wtkg`. (1 mark)
dfc$wtkg <- dfc$weight
dfc$wtkg

# iii) Convert the values in `wtkg` from grams to kilograms [hint: 1 kg = 1000g] (1 mark)
dfc$wtkg <- dfc$wtkg / 1000

# iv) Create a new *factor* variable in `dfc` called `size`. `size` is an ordered factor with two values "Small" and "Large". 
#     The chicks are considered "Small" if their weight is less than 0.12kg, otherwise they are considered "Large". Assign the 
#     values to the variable `Size` based on this definition. (2 marks)
# You may use dplyr or base R functions for this question part. 
dfc$size[dfc[, 'wtkg'] < 0.12] <- 'Small'
dfc$size[dfc[, 'wtkg'] >= 0.12] <- 'Large'
dfc

#### 3) Data Extraction (6 marks)
# i)	Extract the columns `wtkg` and `Time` from `dfc` and assign it to `dfc3`. Export `dfc3` as a csv file. (2 marks)
dfc3 <- dfc[,'wtkg' & 'time']
write.csv(dfc3, "dfc3.csv")

# ii) Using Base R functions, extract the rows from `dfc` where `Time` is less than  12 AND `Size` is equal to Large. 
#      How many rows are extracted? (2 marks)
dfc[dfc$Time < 12 & dfc$Size == 'Large', ]

# iii) Using dplyr functions, remove the `wtkg` and `Diet` columns and retain only the rows where  `Size` is Large, `Time` is 
#      less than 12 and Diet is 3 or 4. Assign this output to `dfc3iii`. How many observations are there in `dfc3iii`? (2 marks)
dfc3iii <- dfc [,-4 & -5]
dfc3iii <- subset(dfc, select = -c(wtkg & Diet))
dfc3iii
dfc3iii <- dfc[dfc$size == "Large" & dfc$Time < 12 & dfc$Diet == 3 | 4,]
dfc3iii
count(dfc3iii)
#the rows represent the chicks that have reached 'Large' size before 12 days.

# (For tutorial discussion: How would you described the rows of observations that were extracted in parts ii and iii?) 


#### 4) Sorting (7 marks)
# i)	Using base R, keep only observations where Time is 8 and assign these data to a dataframe dfc4. Sort `dfc4` in increasing 
#     order of `Size`. Looking at `dfc4`, how many large and small chicks are there at Time=8? (3 marks)
# ii)	Using dplyr, keep only observation of day 21, then sort the data in decreasing order of `wtkg` followed by increasing order
#     Chick`. The output should have the observations arranged in decreasing order of wtkg and for observations with the same wtkg, the observations will be ordered in increasing order of Chick. Which three Chicks have the highest weight at day 21? (4 marks)

#i
dfc4 <- dfc[dfc$Time == 8,]
sort(dfc4$size)
count(dfc4[dfc4$size == 'Large',])
count(dfc4[dfc4$size == 'Small',])


#ii
dfc [order(dfc$wtkg, decreasing = TRUE) & order(dfc$Chick, decreasing = FALSE),]
dfc [dfc$Time == 21,]
#Which three Chicks have the highest weight at day 21? -> 400, 388, 232
