In the past, the proportion of CEO with salary greater than $1 million has averaged around 0.50 (i.e. population proportion for `salary` >= 1million is 0.50). Based on the sample in this dataset, is there sufficient evidence (at 5% level of significance) to conclude that the population proportion for salary being greater than  $1million is equal to 0.5? State your hypotheses, conduct the hypotheses test and provide conclusions.

# Z statistic <- one sample test for proportion
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
## Conclusion: Since the test statistic z is smaller than the critical value, we reject the null hypothesis.Therefore, we reject H0:'the proportion of CEO with salary greater than $1 million has averaged equal to 0.50' at 5% level of significance.
