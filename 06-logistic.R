library(medicaldata)
library(tidyverse)

blood <- blood_storage

blood %>%
  group_by(Recurrence) %>%
  summarize(count = n())

mod1 <- glm(Recurrence ~ Age, data = blood, family = "binomial")
mod1
summary(mod1)

mod2 <- glm(Recurrence ~ Age + PVol + PreopPSA,
            data = blood, family = "binomial")
mod2
summary(mod2)

library(broom)

mod2 %>%
  tidy() %>%
  mutate(odds = exp(estimate))


