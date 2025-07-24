# Title:        Import and tidy fixtures dataset
# Author:       Ewan Carr
# Started:      2025-07-25

library(tidyverse)
library(here)
library(zoo)

fixtures <- read_csv(here("1-data", "raw", "fixtures.csv")) |>
  arrange(date) |>
  mutate(
    win = as.integer(goals_for > goals_against),
    draw = as.integer(goals_for == goals_against),
    loss = as.integer(goals_for < goals_against),
    rest_days = as.numeric(date - lag(date)),
    form_win_rate = lag(rollapplyr(win, 3, sum, partial = TRUE)),
    recent_scoring = lag(rollapplyr(
      goals_for,
      3,
      mean,
      fill = NA,
      partial = TRUE
    )),
    fixture_type = if_else(game_type == "friendly", 0L, 1L)
  )
fixtures <- fixtures[-1, ]

saveRDS(fixtures, here("1-data", "clean", "fixtures.rds"))
