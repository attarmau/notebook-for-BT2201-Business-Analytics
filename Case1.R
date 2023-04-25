# predictive/prescriptive analytics
library(tseries) 
library(forecast)
library(lpSolve)
library(TTR)
library(stats)

# descriptive analytics
library(Rmisc)
library(rcompanion)
library(rpivotTable)
library(car)
library(rstatix)
library(psych)

# general use
library(wooldridge)
library(knitr)
library(tidyverse)

#Case: CEO Salaries 
Context: Use data(‘ceosal1’). This is a data set from a 1991 issue of Business Week of CEO’s salaries in 1990.  

The data.frame has 209 observations on 12 variables: 

- `salary`: 1990 salary, thousands $ 
- `pcsalary`: percent change salary, 1989-1990 
- `sales`: 1990 firm sales, millions $ 
- `roe`: return on equity, 1988-1990 avg 
- `pcroe`: percent change roe, 1988-1990
- `ros`: return on firm’s stock, 1988-1990
- `indus`: =1 if industrial firm 
- `finance`: =1 if financial firm
- `consprod`: =1 if consumer product firm 
- `utility`: =1 if transport or utilities 
- `lsalary`: natural log of salary 
- `lsales`: natural log of sales

Each observation represents a CEO's salary with its respective firm characteristics. As a business analytics analyst, you are tasked to conduct the required analyses and present your findings according to the questions below. 

#data('ceosal1') 
#CS<-ceosal1

# Q1.(a) Plot a histogram for `salary`. What can you deduce about the distribution of CEO salaries from this histogram? (2 mark)
h.s <- hist (ceosal1$`salary`,
             main= 'Histogram of salary',
             xlab = 'salary ( thousands $ )',
             ylab = 'No. of CEO salaries',
             col = c('darkorange'),
             ylim = c(0,200),
             labels = TRUE)
             
# Q1.(b) In the past, the proportion of CEO with salary greater than $1 million has averaged around 0.50 (i.e. population proportion for `salary` >= 1million is 0.50). Based on the sample in this dataset, is there sufficient evidence (at 5% level of significance) to conclude that the population proportion for salary being greater than  $1million is equal to 0.5? State your hypotheses, conduct the hypotheses test and provide conclusions. -> z statistic
# H0: proportion = 0.5 ; H1: proportion != 0.5
sly1000 <- ceosal1 %>% filter (salary >= 1000) 
psly1000 <- nrow(sly1000) / nrow(Salaries)
psly1000
z <- (psly1000 - 0.5) / sqrt(0.5*(1-0.5)/nrow(Salaries))
z
# compute critical value
cv95 <- qnorm(0.05)
cv95
z < cv95
## Since the test statistic z is smaller than the critical value, we reject the null hypothesis.Therefore, we reject H0:'the proportion of CEO with salary greater than $1 million has averaged equal to 0.50' at 5% level of significance.

# Q1.(c) You are tasked to explore if CEO salaries vary across firm types.
(i) First, create a variable `firm` and label it as “1” if it is an industrial firm, “2” if it is a financial firm, “3” if it is a consumer product firm, and “4” if it is a transport or utilities firm. -> ANOVA

ceosal1$firm[ceosal1[,'indus'] == 1] <- '1'
ceosal1$firm[ceosal1[,'finance'] == 1] <- '2'
ceosal1$firm[ceosal1[,'consprod'] == 1] <- '3'
ceosal1$firm[ceosal1[,'utility'] == 1] <- '4'
table(ceosal1$firm)

# (ii) Now, conduct the appropriate test(s) to assess if the mean CEO salary is significantly different across firm type. Present your hypotheses, the results and conclusions. 

```{r ceo-read-dataset, echo=TRUE}
# H0: μ1 = μ2 = μ3 = μ4; H1: At least one μis different from the others

## check normality
par(mfcol = c (2,2))
label1 <- ceosal1 %>% filter(indus == 1)
label2 <- ceosal1 %>% filter(finance == 1)
label3 <- ceosal1 %>% filter(consprod == 1)
label4 <- ceosal1 %>% filter(utility == 1)

## plot histogram
hist(label1$salary, main = 'Histogram for `industrial firm`', xlab = 'salary' )
hist(label2$salary, main = 'Histogram for `financial firm`', xlab = 'salary' )
hist(label3$salary, main = 'Histogram for `consumer product firm`', xlab = 'salary' )
hist(label4$salary, main = 'Histogram for `transport or utilities firm`', xlab = 'salary' )

## plot ggplot
par(mfcol = c (2,2))
qqnorm(label1$salary, main = ' QQplot for `industrial firm`', xlab = 'salary')
qqnorm(label1$salary, main = ' QQplot for `industrial firm`', xlab = 'salary')
qqnorm(label1$salary, main = ' QQplot for `industrial firm`', xlab = 'salary')
qqnorm(label1$salary, main = ' QQplot for `industrial firm`', xlab = 'salary')

## check equal variance assumption
fligner.test(salary~ firm, ceosal1)

## conduct ANOVA (不一定需要這行)
aov.sly <- aov(ceosal1$salary ~ as.factor(ceosal1$firm)) 
summary(aov.sly)

## Conclusion: Since P-value < 0.05, we reject the null hypothesis that 'the mean CEO salary is the same across firm type'.
