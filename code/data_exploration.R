# MTH6134 Statistical Modelling II
# Group Project - Exploratory Data Analysis

# 1. Read the datasets
players <- read.csv("league_players.csv")
matches <- read.csv("ashford_matches.csv")

# 2. View the first six observations
head(players)
head(matches)

# 3. Check the structure of the datasets
str(players)
str(matches)

# 4. Summary statistics
summary(players)
summary(matches)

# 5. Check for missing values
colSums(is.na(players))
colSums(is.na(matches))

# 6. Explore player ages
hist(players$age,
     main = "Distribution of Player Ages",
     xlab = "Age")

# 7. Explore training load
barplot(table(players$training_load),
        main = "Distribution of Training Load",
        xlab = "Training Load",
        ylab = "Number of Players")

# 8. Explore player injuries
table(players$injured)

# 9. Explore goals scored
hist(matches$goals_scored,
     main = "Goals Scored by Ashford United",
     xlab = "Goals Scored")
# 10. Classify variables
str(players)
str(matches)

# Convert categorical variables to factors
players$team <- factor(players$team)
players$position <- factor(players$position)
matches$home_away <- factor(matches$home_away)

# 11. Explore age and minutes played
plot(players$age, players$minutes_played,
     main = "Age vs Minutes Played",
     xlab = "Player Age",
     ylab = "Minutes Played")

# 12. Fit a normal linear regression model
model_week2 <- lm(minutes_played ~ age,
                  data = players)

summary(model_week2)

# 13. Add fitted regression line
abline(model_week2, col = "red")

# 14. Model diagnostics
plot(model_week2)
