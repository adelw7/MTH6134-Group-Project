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

**Proposed model:** Normal linear regression as an initial approach.

We would need to examine the response distribution and model diagnostics before deciding whether this model is appropriate.

## Conclusion

The two datasets contain different response types, meaning that the same statistical model may not be appropriate for every analysis.

Generalised linear models allow us to choose a probability distribution and link function that suit the response variable.

These are proposed analyses rather than final selected models.
