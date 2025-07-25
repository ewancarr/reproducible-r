# Title:        Plot the results of the prediction model
# Author:       Ewan Carr
# Started:      2025-07-17

library(tidyverse)
library(here)

results <- readRDS(here("outputs", "results.rds"))

p <- results |>
  ggplot() +
  aes(x = result, y = probability, fill = result) +
  geom_col() +
  labs(
    title = "Predicted Outcome Probabilities vs Italy",
    x = "Result",
    y = "Probability"
  ) +
  theme_minimal()

ggsave(p, file = here("outputs", "prediction_plot.png"))
