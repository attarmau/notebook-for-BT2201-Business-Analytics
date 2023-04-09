You are hired as a consultant for the jurisdiction of "Ewon" to recommend the purchase of valley hectares or highlands hectares to conserve as many plant species as possible. The valley has 350 unique plant species, while the highlands has 240 unique plant species.

How many hectares of each habitat should be conserved? The decision is not so simple because you have a number of decision constaints to contend with. (such as the cost per hectare or the total new plant species that are added with; each new hectare conserved).

-   The cost per hectare for: (i) valley = 300 (thousands of dollars) (ii) highland = 200 (thousands of dollars)
-   The total unique plant species by habitat: (i) valley = 350 species (ii) highland = 240 species
-   Number of new species conserved for each additional hectare purchased: (i) valley = 5 species (ii) highland = 4 species. For each additional hectare purchased, there will be additional new species conserved e.g, 5 new species conserved for one more hectare of valley purchased.
-   Edge effects for (i) valley = 15 (ii) highland = 25. Edge effects refer to the new plant species that occur at the boundary of the valley or highland prior to the purchase of any valley or highlands hectares.
-   Social upheaval per hectare: (i) valley = 5 cases (ii) highland = 2 cases. For every hectare purchased, there are 5 and 2 cases of social upheaval for valley and highland respectively.

The maximum budget you have is 24,000 (thousands of dollars). The total social upheaval should be limited to not more than a total of 400 cases.
The decision is to identify how many highland hectares and how many valley hectares should be purchased to maximize the total plant species conserved, given the constraints above.

(Q3a) Write out the decision variables, objective function and constraints (using the table template provided above). Please include ALL relevant constraints.
X1: hectares of valley
x2: hectares of highland
| Maximize hectares of each habitat variables $X_1$, $X_2$ | hectares = 5 $X_1$ + 4 $X_2$ |
|----------------------------------------------|--------------------------|
| Subject to                                                  |                                  |
| Budget Constraint                                           | 300$X_1$ + 200$X_2$ $\leq$ 24000 |
| Social upheaval Constraint                                  | 5$X_1$ + 2$X_2$ $\leq$ 400       |
| Valley species Constraint                                   | $X_1$  + 0$X_2$ $\leq$ 70        |
| Highland species Constraint                                 | 0$X_1$ +  $X_2$ $\leq$ 60        |
| Non-Negativity Constraint 1                                 | $X_1$ $\geq$ 0                   |
| Non-Negativity Constraint 2                                 | $X_2$ $\geq$ 0                   |
