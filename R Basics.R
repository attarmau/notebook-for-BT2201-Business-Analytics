This section is for reviewing and practicing applying the concepts related to the Basics of R. 

# i)	Extract the column `supp`
ToothGrowth$supp
ToothGrowth[,2]
ToothGrowth[,'supp']
ToothGrowth %>% select(supp) #using dplyr

# ii) 	Extract rows where `supp` is equal to “VC” and `dose` is less than 1 and assign the output to df2
df2 <- ToothGrowth[ToothGrowth$supp=='VC' & ToothGrowth$dose<1,]
df2 <- ToothGrowth %>% filter (supp=='VC' & dose<1) #using dplyr

# iii)  Extract the values of `len` where `supp` is equal to “VC”
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
