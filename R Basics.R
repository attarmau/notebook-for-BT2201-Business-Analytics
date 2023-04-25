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
