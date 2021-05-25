library(tidyverse)

tumor <- read_csv("data/tumorgrowth_long.csv")
tumor

tumor_tidy <- tumor %>%
  pivot_longer(`0`:last_col(), names_to = "day", values_to = "size")

tumor_tidy %>%
  mutate(day_num = as.numeric(day)) %>%
  group_by(Group, day_num) %>%
  summarize(avg_size = mean(size, na.rm = TRUE))

tb <- read_csv("data/tb_long.csv")

tb_long <- tb %>%
  pivot_longer(starts_with(c('m', 'f')))

tb_long %>%
  separate(name, into = c("sex", "age_group"), sep = 1)

cms <- read_csv("data/cms_utilization.csv")

cms_long <- cms %>%
  pivot_longer(`2007`:last_col(), names_to = "year")

cms_tidy <- cms_long %>%
  pivot_wider(names_from = variable, values_from = value)

# somethimes things get loaded weirdly
tumor_base <- read.csv("data/tumorgrowth_long.csv")

tumor %>%
  pivot_longer(X0:last_col()) %>%
  mutate(day = str_replace(name, "X", ""))
