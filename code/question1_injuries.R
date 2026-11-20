
# MTH6134 - Group Project
# Question 1: Player Injury Risk

# 1. Import and inspect the data
players <- read.csv("league_players.csv")
players$position <- factor(players$position)

str(players)
summary(players)
colSums(is.na(players))
table(players$injured)

# 2. Explore injury rates by position
injury_rates <- tapply(players$injured,
                       players$position, mean)
print(100 * injury_rates)

dir.create("outputs/graphs",
           recursive = TRUE,
           showWarnings = FALSE)

dir.create("outputs/model_results",
           recursive = TRUE,
           showWarnings = FALSE)

png("outputs/graphs/q1_injury_position.png",
    width = 1000, height = 700)

barplot(100 * injury_rates,
        main = "Injury Rates by Playing Position",
        xlab = "Position",
        ylab = "Injured Players (%)")
dev.off()

# 3. Fit full logistic regression model
model_full <- glm(
  injured ~ age + training_load +
    prev_injuries + bmi + position,
  family = binomial(link = "logit"),
  data = players
)

summary(model_full)

# 4. Fit reduced model
model_reduced <- glm(
  injured ~ age + training_load + prev_injuries,
  family = binomial(link = "logit"),
  data = players
)

summary(model_reduced)

# 5. Compare the two models
anova(model_reduced, model_full, test = "Chisq")
AIC(model_full, model_reduced)

# 6. Calculate odds ratios and confidence intervals
exp(coef(model_reduced))
exp(confint.default(model_reduced))

# 7. Model diagnostics
p_hat <- fitted(model_reduced)

png("outputs/graphs/q1_residuals.png",
    width = 1000, height = 700)

plot(p_hat, rstandard(model_reduced),
     xlab = "Fitted Injury Probability",
     ylab = "Standardised Deviance Residual",
     main = "Question 1: Residual Diagnostics")
abline(h = 0, lty = 2)
dev.off()

png("outputs/graphs/q1_cooks.png",
    width = 1000, height = 700)

plot(cooks.distance(model_reduced),
     ylab = "Cook's Distance",
     main = "Question 1: Influence Diagnostics")
dev.off()

# 8. Calibration plot
# Ten groups containing approximately equal player counts
group <- ceiling(rank(p_hat, ties.method = "first") /
                   length(p_hat) * 10)

observed <- tapply(players$injured, group, mean)
predicted <- tapply(p_hat, group, mean)

png("outputs/graphs/q1_calibration.png",
    width = 1000, height = 700)

plot(predicted, observed,
     xlim = c(0, 1), ylim = c(0, 1),
     xlab = "Predicted Injury Probability",
     ylab = "Observed Injury Proportion",
     main = "Question 1: Calibration",
     pch = 19)
abline(0, 1, lty = 2)
dev.off()

# 9. Save statistical results
capture.output(
  summary(model_full),
  summary(model_reduced),
  anova(model_reduced, model_full, test = "Chisq"),
  AIC(model_full, model_reduced),
  exp(coef(model_reduced)),
  exp(confint.default(model_reduced)),
  file = "outputs/model_results/q1_results.txt"
)
# Question 1 - Influence sensitivity analysis

# Calculate Cook's distances
cooks <- cooks.distance(model_reduced)

# Identify the five most influential observations
top5 <- order(cooks, decreasing = TRUE)[1:5]

# Display their observation numbers and Cook's distances
data.frame(
  observation = top5,
  cooks_distance = cooks[top5]
)

# Refit model excluding these five observations
model_sensitivity <- glm(
  injured ~ age + training_load + prev_injuries,
  family = binomial(link = "logit"),
  data = players[-top5, ]
)

# Compare original and sensitivity-model odds ratios
comparison <- data.frame(
  Original = exp(coef(model_reduced)),
  Without_Top5 = exp(coef(model_sensitivity))
)

print(round(comparison, 3))
