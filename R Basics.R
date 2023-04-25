This section is for reviewing and practicing applying the concepts related to the Basics of R. 

# i)	Extract the column `supp`
ToothGrowth$supp
ToothGrowth[,2]
ToothGrowth[,'supp']
ToothGrowth %>% select(supp) #using dplyr

# ii)	Extract rows where `supp` is equal to “VC” and `dose` is less than 1 and assign the output to df2
df2 <- ToothGrowth[ToothGrowth$supp=='VC' & ToothGrowth$dose<1,]
df2 <- ToothGrowth %>% filter (supp=='VC' & dose<1) #using dplyr

# iii) Extract the values of `len` where `supp` is equal to “VC”
ToothGrowth$len[ToothGrowth$supp=='VC']
ToothGrowth %>% filter (supp=='VC') %>% select(len) #using dplyr
