# Title:        Create and tidy fixtures dataset
# Author:       Ewan Carr
# Started:      2025-07-25

library(tidyverse)
library(here)
library(zoo)

fixtures <- tibble(
  date = ymd(c(
    "2024-07-12",
    "2024-10-25",
    "2024-10-29",
    "2024-11-30",
    "2024-12-03",
    "2025-02-21",
    "2025-02-26",
    "2025-04-04",
    "2025-04-08",
    "2025-05-30",
    "2025-06-03",
    "2025-06-29",
    "2025-07-05",
    "2025-07-09",
    "2025-07-13",
    "2025-07-17",
    "2025-07-22"
  )),
  opponent = c(
    "Republic of Ireland",
    "Germany",
    "South Afria",
    "USA",
    "Switzerland",
    "Portugal",
    "Spain",
    "Belgium",
    "Belgium",
    "Portugal",
    "Spain",
    "Jamaica",
    "France",
    "Netherlands",
    "Wales",
    "Sweden",
    "Italy"
  ),
  venue = c(
    "home",
    "home",
    "home",
    "home",
    "home",
    "home",
    "home",
    "home",
    "away",
    "home",
    "away",
    "home",
    "neutral",
    "neutral",
    "home",
    "neutral",
    "neutral"
  ),
  game_type = c(
    "qualifier",
    "friendly",
    "friendly",
    "friendly",
    "friendly",
    "nations_league",
    "nations_league",
    "nations_league",
    "nations_league",
    "nations_league",
    "nations_league",
    "friendly",
    "tournament",
    "tournament",
    "tournament",
    "tournament",
    "tournament"
  ),
  goals_for = c(
    2,
    3,
    2,
    0,
    1,
    1,
    1,
    5,
    2,
    6,
    1,
    7,
    1,
    4,
    6,
    3,
    NA
  ),
  goals_against = c(1, 4, 1, 0, 0, 1, 0, 0, 3, 0, 2, 0, 2, 0, 1, 2, NA),
  opponent_elo = c(
    1600,
    1984,
    1600,
    2100,
    1820,
    1500,
    2050,
    1800,
    1800,
    1800,
    2050,
    1400,
    2056,
    1726,
    1500,
    2100,
    1582
  )
)

write_csv(fixtures, here("data", "raw", "fixtures.csv"))
