library("rcompanion") #this package is required for transformTukey function
library("rstatix") # for Welch ANOVA test
library("Rmisc")  # ci function to compute confidence interval
library("rpivotTable")
library("knitr")
library("psych")
library("dplyr") 
library("tidyr")

# i) compute the 95% and 99% confidence intervals for the mean of `Amount` for DVD sale transactions. Which interval is wider and how does a wider interval affect type 1 error?
dfD <- ST%>%filter(Product=='DVD')
plot(density(dfD$Amount), main = 'Density lot for 'Amount' for DVD orders)
uCIamt95 <- mean(dfD$Amount) - qt(0.025, df = nrow(dfD) - 1)*sd(dfD$Amount)sqrt(nrow(dfD))
lCIamt95 <- mean(dfD$Amount) + qt(0.025, df = nrow(dfD) - 1)*sd(dfD$Amount)sqrt(nrow(dfD))
print(cbind(lCIamt95, uCIamt95), digit = 4)
# ii) compute the 90% confidence interval for proportion of DVD sale transactions with sales amount being greater than \$22. Could the company reasonably conclude that the true proportion of DVD sale transactions with sales amount greater than \$22 is 30%? 
# iii) compute the 95% prediction interval for `Amount` for sales of DVD. Explain to the store manager what this prediction interval mean? 
