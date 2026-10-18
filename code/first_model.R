# MTH6134 Statistical Modelling II
# First Statistical Model: Logistic Regression

# Read player data
players <- read.csv("league_players.csv")

# Fit logistic regression model
model1 <- glm(injured ~ age,
              data = players,
              family = binomial)

# Display model results
summary(model1)

# Calculate odds ratios
exp(coef(model1))

# Calculate confidence intervals for odds ratios
exp(confint.default(model1))

# Compare with an intercept-only model
model0 <- glm(injured ~ 1,
              data = players,
              family = binomial)

# Likelihood ratio test
anova(model0, model1, test = "Chisq")
