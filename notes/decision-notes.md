# MTH6134 Statistical Modelling II
## Group Project - Decision Notes

### Initial Project Setup

**Dataset:** Midland Premier League 2023/24

We have been provided with two datasets:

1. league_players.csv - Information about 620 players.
2. ashford_matches.csv - Information about 46 matches.

### Planned Exploratory Data Analysis

We plan to:
- Import both datasets into R.
- Examine the structure of the variables.
- Calculate summary statistics.
- Check for missing values.
- Produce exploratory graphs.

### Initial Statistical Model

We plan to investigate whether player age is
associated with injury status using logistic regression.

We selected logistic regression because the response
variable, injured, is binary (0 or 1).

### Further Work

We will evaluate the initial model and investigate
additional statistical models as the module progresses.

Our final analyses will be selected after reviewing
the full project brief.


### Week 2 — Completed Analysis

**Research question:** Is player age associated with total minutes played during the season?

We explored both datasets using summary statistics and graphical methods. We also fitted a simple normal linear regression model with minutes played as the response variable and age as the explanatory variable.

The fitted regression equation was:

Predicted minutes played = 2616.048 − 3.023 × Age

The coefficient for age was −3.023 (SE = 7.384, p = 0.682). Therefore, there was insufficient evidence of a linear association between age and minutes played at the 5% significance level.

The model had an R-squared value of 0.0002712, meaning that age explained approximately 0.027% of the observed variation in minutes played.

Residual diagnostics suggested some departures from normality in the tails and identified potentially unusual observations.

**Decision:** Retain the model as an initial exploratory example, while acknowledging its limited explanatory power.
