library(tidyverse)
library(here)
library(broom)
library(tinytable)

fixtures <- readRDS(here("data", "clean", "fixtures.rds"))
fixtures$opponent_elo <- scale(fixtures$opponent_elo)[, 1]
train <- filter(fixtures, !is.na(goals_for))

f_england <- glm(
  goals_for ~
    opponent_elo +
      form_win_rate +
      factor(venue) +
      log(rest_days) +
      fixture_type +
      recent_scoring,
  family = poisson(),
  data = train
)

f_opponent <- glm(
  goals_against ~
    opponent_elo +
      form_win_rate +
      factor(venue) +
      log(rest_days) +
      fixture_type +
      recent_scoring,
  family = poisson(),
  data = train
)

tidy(f_england)
tidy(f_opponent)

# Predict the outcome of the semi-final against Italy -------------------------
next_game <- filter(fixtures, is.na(goals_for))
goals_england <- predict(f_england, newdata = next_game, type = "response")
goals_opponent <- predict(f_opponent, newdata = next_game, type = "response")

set.seed(42)
n <- 1000
g_england <- rpois(n, goals_england)
g_opponent <- rpois(n, goals_opponent)
results <- tibble(g_england, g_opponent) |>
  mutate(result = case_when(
    g_england > g_opponent ~ "Win",
    g_england < g_opponent ~ "Loss",
    TRUE ~ "Draw"
  )) |>
  count(result) |>
  mutate(probability = n / sum(n))

tt(results) |>
  print()

saveRDS(results, file = here("outputs", "results.rds"))
