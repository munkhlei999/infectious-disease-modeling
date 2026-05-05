install.packages(c("tidyverse", "outbreaks", "lubridate", "ggplot2"))

library(tidyverse)
library(outbreaks)
library(lubridate)
library(ggplot2)

data(package = "outbreaks")

data("fluH7N9_china_2013")

df <- fluH7N9_china_2013

glimpse(df)

p <- df %>%
  count(date_of_onset) %>%
  ggplot(aes(x = date_of_onset, y = n)) +
  geom_col() +
  labs(
    title = "H7N9 outbreak curve, China 2013",
    x = "Date of onset",
    y = "Number of cases"
  )

print(p)

ggsave(
  filename = "outputs/figures/h7n9_epidemic_curve.png",
  plot = p,
  width = 8,
  height = 5
)