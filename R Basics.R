This section is for reviewing and practicing applying the concepts related to the Basics of R. 

# i) Extract the column `supp`
ToothGrowth$supp
ToothGrowth[,2]
ToothGrowth[,'supp']
ToothGrowth %>% select(supp) #using dplyr

# ii) Extract rows where `supp` is equal to “VC” and `dose` is less than 1 and assign the output to df2
df2 <- ToothGrowth[ToothGrowth$supp=='VC' & ToothGrowth$dose<1,]
df2 <- ToothGrowth %>% filter (supp=='VC' & dose<1) #using dplyr

# iii) Extract the values of `len` where `supp` is equal to “VC”
ToothGrowth$len[ToothGrowth$supp=='VC']
ToothGrowth %>% filter (supp=='VC') %>% select(len) #using dplyr

# iv)	Use the class function to check the class attribute for each of the outputs. 
# Use is.data.frame function to check whether the output is a dataframe or a vector.
class(df2)
is.data.frame(df2)

#### Adding/Removing/Changing data columns for Toothgrowth data. 
#  i)	Change the variable name from `len` to `length` and assign the output to df3.1
df3.1 <- ToothGrowth
columes(df3.1)[colnames(df3.1) = 'len'] <- 'length'

df3.1 <- ToothGrowth %>% rename (length=len) #using dplyr
df3.1

#  ii)	Increase the value of len by 0.5 if supp is equal to OJ and assign the output to df3.2
df3.2 <- ToothGrowth
df3.2$len[df3.2[,'supp'] == 'OJ'] <- df3.2$len[df3.2[,'supp'] == 'OJ'] + 0.5

df3.2 %>%
  mutate(len = ifelse(supp == 'OJ', len + 0.5, len)) #dplyrs

#  iii) Remove the column `dose` from the data and assign the output to df3.3
df3.3 <- ToothGrowth[, -3]
df3.3 <- subset(ToothGrowth, select = -c(dose))
df3.3

df3.3 <- ToothGrowth %>% select(-c(dose))
df3.3
#  iv) Increase the value of `dose` by 0.1 for all records and rename `dose` to `dose.new` and assign output to df3.4 
df3.4 <- ToothGrowth
df3.4$dose.new <- df3.4$dose + 0.1
df3.4

#  v) Create a new variable `high.dose` and assign it a value of "TRUE" if `dose` is more than 1 and "FALSE" if `dose` is less than or equal to 1. Assign the dataframe with the new variable `high.dose` to df3.5. 
#     Export df3.5 to a csv file. Discuss what is the r code to export as an excel file (.xlsx). 
df3.5 <- ToothGrowth
df3.5$high.dose[df3.5[,'dose'] > 1] <- 'TRUE'
df3.5$high.dose[df3.5[,'dose'] <= 1] <- 'FALSE'
df3.5

#### Sorting
#  i)	There are two functions in Base R “sort” and “order” to perform sorting. How do these two functions differ? 
#       Try to do a sort with each function on ToothGrowth$len.
## 'sort' returns the original object, sorted in ascending order by default.
## 'order' returns the indices of the sorted object, also in ascending order by fault.
myvector <- c(10,30,15,40)
sort(myvector)
order(myvector)

#  ii)	Using a base R function (e.g. order), how can you sort the dataframe `ToothGrowth` in decreasing order of `len`? 
ToothGrowth[order(ToothGrowth$len, decreasing = TRUE), ]

#  iii) What dplyr functions can you use to sort `ToothGrowth` in increasing order of `len`?
ToothGrowth %>% arrange(len)

#        Can you also sort the dataframe in decreasing order of `len`?  
ToothGrowth %>% arrange(desc(len))

#### Factors
#  i)	Check if `supp` is a factor vector. First type ToothGrowth$supp. What do you observe with the output? 
ToothGrowth$supp

#  ii)	Next use is.factor() and is.ordered() to check if supp is a factor and if so whether it is an ordered factor. 
is.factor(ToothGrowth$supp)
is.ordered(ToothGrowth$supp)

#  iii) Now supposed we find that vitamin C (VC) is a superior supplement compared to orange juice (OJ), and we want to order `supp` such that VC is a higher level than OJ, how could we do this? 
factor_supp <- factor(ToothGrowth$supp, levels=c('OJ', 'VC'), ordered = TRUE)
factor_supp

#### Example

This part will use dataset `ChickWeight`. 
# This dataset is from an experiment conducted to study the effect of diet on early growth of chicks. 

# The 2 variables are defined as follows:
  
# - weight: body weight of the chick (gm).
# - Time: number of days since birth when the measurement was made.
# - Chick: a unique identifier for the chick. 
# - Diet: a variable from 1, ..., 4 indicating which experimental diet the chick received.

#### 1) Inspect the dataset
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
# i) Assign the dataset `ChickWeight` to `dfc`.
dfc <- ChickWeight

# ii) Rename the variable in `dfc` from `weight` to `wtkg`. 
dfc$wtkg <- dfc$weight
dfc$wtkg

# iii) Convert the values in `wtkg` from grams to kilograms [hint: 1 kg = 1000g]
dfc$wtkg <- dfc$wtkg / 1000

# iv) Create a new *factor* variable in `dfc` called `size`. `size` is an ordered factor with two values "Small" and "Large". 
#     The chicks are considered "Small" if their weight is less than 0.12kg, otherwise they are considered "Large". Assign the 
#     values to the variable `Size` based on this definition. (2 marks)
# You may use dplyr or base R functions for this question part. 
dfc$size[dfc[, 'wtkg'] < 0.12] <- 'Small'
dfc$size[dfc[, 'wtkg'] >= 0.12] <- 'Large'
dfc

#### 3) Data Extraction
# i)	Extract the columns `wtkg` and `Time` from `dfc` and assign it to `dfc3`. Export `dfc3` as a csv file. (2 marks)
dfc3 <- dfc[,'wtkg' & 'time']
write.csv(dfc3, "dfc3.csv")

# ii) Using Base R functions, extract the rows from `dfc` where `Time` is less than  12 AND `Size` is equal to Large. 
#      How many rows are extracted? 
dfc[dfc$Time < 12 & dfc$Size == 'Large', ]

# iii) Using dplyr functions, remove the `wtkg` and `Diet` columns and retain only the rows where  `Size` is Large, `Time` is 
#      less than 12 and Diet is 3 or 4. Assign this output to `dfc3iii`. How many observations are there in `dfc3iii`?
dfc3iii <- dfc [,-4 & -5]
dfc3iii <- subset(dfc, select = -c(wtkg & Diet))
dfc3iii
dfc3iii <- dfc[dfc$size == "Large" & dfc$Time < 12 & dfc$Diet == 3 | 4,]
dfc3iii
count(dfc3iii)
#the rows represent the chicks that have reached 'Large' size before 12 days.

# (For tutorial discussion: How would you described the rows of observations that were extracted in parts ii and iii?) 

#### 4) Sorting
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
