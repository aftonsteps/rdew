## Loads Animal Blueprints

animal_blueprints <-
  readr::read_csv("data-raw/files/Animal Blueprints.csv") %>%
  make_cols_snake_case()

usethis::use_data(animal_blueprints, overwrite = TRUE)
