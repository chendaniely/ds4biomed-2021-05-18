library(tidyverse)
library(ggplot2)
library(medicaldata)
# install.packages("remotes")
# remotes::install_github("higgi13425/medicaldata")

blood <- blood_storage

names(blood)

blood %>%
  group_by(Recurrence) %>%
  summarise(count = n())

ggplot(data = blood, mapping = aes(x = Recurrence)) + geom_bar()

ggplot(data = blood, mapping = aes(x = Age)) + geom_histogram(bins = 10)

ggplot(blood, aes(x = PVol, y = PreopPSA, color = as.factor(sGS))) +
  geom_point() +
  facet_wrap(~RBC.Age.Group)
