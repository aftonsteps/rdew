## Loads weapons dataset

weapons <-
  readr::read_csv(file = "data-raw/files/Weapons.csv") %>%
  rstardew::make_cols_snake_case()

usethis::use_data(weapons, overwrite = TRUE)
