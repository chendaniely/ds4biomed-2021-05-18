library(tidyverse)

tumor_subset <- read_csv("data/tumor_filtered.csv")

tumor <- read_csv("data/medicaldata_tumorgrowth.csv")

tumor %>%
  filter(Day == 0) %>%
  select(Size)

tumor %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  mean()

tumor %>%
  filter(Group == 1, Day == 0) %>%
  pull(Size) %>%
  mean()

tumor %>%
  filter(Group == 2, Day == 0) %>%
  pull(Size) %>%
  mean()


tumor %>%
  filter(Day == 0) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size))

agg <- tumor %>%
  group_by(Group, Day) %>%
  summarize(avg_size = mean(Size))
