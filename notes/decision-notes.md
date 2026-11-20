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


### Week 3: model-planning draft for group review

Retain `notes/week03-glm-planning.md` as the single Week 3 planning note. It proposes Bernoulli/logit for injury, Poisson/log for goals, and Gaussian/identity for minutes played. The note now states the conditional assumptions and the limitations of ordinal predictors, season-total minutes and grouped observations. No additional model has been fitted as part of these edits.



## Question 1 — Player Injury Risk Analysis

**Date:** 20 November 2026

### Research Question

Which player characteristics are associated with the probability of injury during the 2023/24 Midland Premier League season?

### Dataset and Exploratory Analysis

We used `league_players.csv`, containing observations for 620 players from 24 clubs.

The response variable was `injured`, which takes the value 1 if a player was injured during the season and 0 otherwise.

Of the 620 players, 115 (18.5%) were injured.

Exploratory analysis showed differences in observed injury rates across playing positions:

- Defenders: 15.74%
- Forwards: 18.38%
- Goalkeepers: 27.42%
- Midfielders: 18.93%

### Model Choice

We selected binomial logistic regression because the response variable is binary.

The initial full model included age, training load, previous injuries, BMI and playing position.

This allowed us to investigate the association between each characteristic and injury status while adjusting for the other predictors.

### Model Selection

We compared the full model against a reduced model containing only age, training load and previous injuries.

The likelihood ratio test produced:

- Test statistic: 3.0438
- Degrees of freedom: 4
- p-value: 0.5505

There was insufficient evidence that adding BMI and playing position improved model fit.

The reduced model also had a lower AIC (547.27) than the full model (552.23).

**Decision:** Select the reduced logistic regression model containing age, training load and previous injuries.

### Selected Model Results

In the reduced model:

- Age: OR = 1.111, 95% CI = (1.050, 1.176), p = 0.000292.
- Training load: OR = 1.377, 95% CI = (1.110, 1.709), p = 0.003705.
- Previous injuries: OR = 1.667, 95% CI = (1.395, 1.993), p < 0.001.

All three variables were positively associated with injury odds after adjustment for the other predictors.

### Model Diagnostics

The calibration plot showed reasonable agreement between observed and predicted injury proportions, although some deviations were present, particularly among players with higher predicted injury probabilities.

Cook's distances were generally low, although a few observations had comparatively higher influence.

The standardised deviance residuals formed two bands, as expected for individual binary observations. Several large positive residuals represented injured players with low fitted injury probabilities.

### Limitations and Further Checks

The analysis identifies associations rather than causal effects.

Players were grouped within 24 clubs, but this model did not explicitly account for possible within-club dependence.

A sensitivity check of the comparatively influential observations should be completed before the analysis is finalised.

The standard residual deviance chi-squared approximation is not considered a reliable standalone goodness-of-fit assessment for these ungrouped binary data.

### Files

- `code/question1_injuries.R`
- `outputs/model_results/q1_results.txt`
- `outputs/graphs/q1_injury_position.png`
- `outputs/graphs/q1_residuals.png`
- `outputs/graphs/q1_cooks.png`
- `outputs/graphs/q1_calibration.png`
