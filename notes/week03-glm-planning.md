# Week 3: Introduction to Generalised Linear Models

## Aim

Identify suitable response variables and explanatory variables in the two datasets, and consider appropriate statistical models.

## 1. Player injury data

**Response variable:** `injured`

This is a binary variable: 1 if a player was injured during the season and 0 otherwise.

**Potential explanatory variables:**

- Age
- Training load
- Previous injuries
- BMI
- Playing position

**Proposed model:** Binomial GLM with a logit link (logistic regression).

With one observation of injury status per player, the response follows a Bernoulli distribution. The logit link keeps fitted probabilities between zero and one.

Season-total minutes played is omitted from the initial predictor list because injury may itself reduce the number of minutes played.

## 2. Match data

**Response variable:** `goals_scored`

This is a non-negative integer count of goals scored by Ashford United in each match.

**Potential explanatory variables:**

- Home or away
- Opponent rank

**Proposed model:** Poisson GLM with a log link.

The log link keeps expected goal counts positive. A Poisson model assumes that the conditional mean and variance are equal, given the explanatory variables. This assumption would need checking after fitting.

Final opponent rank describes the completed season, so this would be a retrospective analysis rather than a pre-match prediction.

## 3. Minutes played

**Response variable:** `minutes_played`

This is a quantitative duration recorded in whole minutes.

**Potential explanatory variables:**

- Age
- Playing position
- Training load

**Proposed model:** Gaussian GLM with an identity link, equivalent to normal linear regression.

The Week 2 model used age as the explanatory variable.

A Gaussian model assumes approximately normal errors around the conditional mean and constant conditional error variance. The overall distribution of minutes played does not itself have to be normal. Residual diagnostics help assess these assumptions.

## 4. Other modelling considerations

- Training load and opponent rank are ordinal variables. Entering them numerically assumes a constant change in the linear predictor for each one-unit increase.
- Treating these variables as factors is an alternative, but requires more parameters.
- Players within the same club may share characteristics, so independence is a provisional assumption.
- Matches against the same opponent may also be related.
- Associations in these simulated data do not establish causation.

## 5. Scope of the Week 3 activity

The Week 3 activity asks us to identify responses, explanatory variables and outcome types. These model proposals address that activity.

No additional model is fitted here. The existing logistic regression in `code/first_model.R` is preliminary work corresponding to the Week 4 activity. Count-regression fitting is suggested for Week 6.

## Conclusion

Different outcome types require different modelling approaches:

| Response | Outcome type | Proposed family | Link |
|---|---|---|---|
| Injury status | Binary | Bernoulli/binomial | Logit |
| Goals scored | Count | Poisson | Log |
| Minutes played | Quantitative duration | Gaussian | Identity |

These are initial proposals. Their assumptions and suitability will be assessed when the models are fitted.
