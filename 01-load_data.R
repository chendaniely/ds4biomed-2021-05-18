3 + 3

library(tidyverse)

read_csv("data/spreadsheets/all.csv")

dat <- read_csv("data/spreadsheets/all.csv")

# "data/medicaldata_tumorgrowth.csv"
tumor <- read_csv("data/medicaldata_tumorgrowth.csv")

library(readxl)

tumor_xl <- read_excel("data/medicaldata_tumorgrowth.xlsx")

tumor

select(tumor, Size)
select(tumor, size)

select(tumor, Group, Day, Size)
select(tumor, Group, Size, Day)


select(tumor, Size)

tumor %>%
  select(Size)

tumor %>%
  select(Group, Day, Size)


filter(tumor, Group == 1)

tumor %>%
  filter(Group == 1)

tumor %>%
  filter(Group == 1, Day == 0)

tumor %>%
  filter(Day == 0 | Day == 13)

tumor %>%
  select(Group, Day, Size) %>%
  filter(Size > 2000)

filter(select(tumor, Group, Day, Size), Size > 2000)

filtered <- tumor %>%
  select(Group, Day, Size) %>%
  filter(Size > 2000)

write_csv(filtered, "data/tumor_filtered.csv")
