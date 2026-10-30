# Week 3 — Introduction to Generalised Linear Models

## Aim

The aim of this activity is to identify suitable response variables and explanatory variables in the two datasets and consider appropriate statistical models.

## 1. Player injury data

**Response variable:** `injured`

This is a binary variable, taking the value 1 if a player was injured and 0 otherwise.

**Potential explanatory variables:**
- Age
- Training load
- Previous injuries
- BMI
- Playing position

**Proposed model:** Binomial GLM with a logit link (logistic regression).

This model is suitable because the response represents one of two possible outcomes.

## 2. Match data

**Response variable:** `goals_scored`

This is a count variable representing the number of goals scored by Ashford United.

**Potential explanatory variables:**
- Home or away
- Opponent rank

**Proposed model:** Poisson GLM with a log link.

This is a reasonable initial candidate because goals scored are non-negative integer counts. The suitability of the Poisson distribution would need to be checked.

## 3. Minutes played

**Response variable:** `minutes_played`

This is a non-negative numerical variable.

**Potential explanatory variables:**
- Age
- Position
- Training load

**Proposed model:** Gaussian GLM with an identity link (normal linear regression) as an initial approach.

Minutes played is a duration recorded in whole minutes, not an event count. A Gaussian model assumes approximately normal errors around the conditional mean and constant conditional error variance. The overall response distribution does not itself have to be normal. Residual diagnostics would help assess these assumptions.

## 4. Assumptions and modelling choices

- The logit link keeps fitted injury probabilities between zero and one; one trial per player gives a Bernoulli response.
- The log link keeps expected goal counts positive. A Poisson model assumes equal conditional mean and variance, given the predictors. Raw mean and variance comparisons alone do not validate it.
- Training load and opponent rank are ordinal variables. Entering them numerically assumes the same change in the linear predictor for each one-unit increase. Treating them as factors is an alternative, but requires more parameters.
- Final opponent rank describes the completed season. The proposed match analysis is retrospective, not a forecast using information available before a fixture.
- Season-total minutes played may be affected by injury. It is therefore omitted from the initial injury-predictor list.
- Players share club environments, and matches may share opponents. Independence is a provisional assumption to revisit later in the module.
- These observational associations in simulated data do not establish causation.

## 5. Week 3 scope

The brief asks us to identify responses, explanatory variables and outcome types. This note addresses that activity; a separate Week 3 R script or new fitted model is not necessary. Week 2 exploration is reproduced by `code/data_exploration.R`. The existing `code/first_model.R` is preliminary Week 4 binary-regression work, and is retained in the project history. Count-regression fitting is suggested for Week 6.

## Conclusion

The two datasets contain different response types, meaning that the same statistical model may not be appropriate for every analysis.

Generalised linear models allow us to choose a probability distribution and link function that suit the response variable.

These are proposed analyses rather than final selected models.
