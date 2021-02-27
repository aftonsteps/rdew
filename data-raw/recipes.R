## Loads Recipes data

recipes <-
  readr::read_csv("data-raw/files/Recipes.csv") %>%
  make_cols_snake_case()

usethis::use_data(recipes, overwrite = FALSE)
