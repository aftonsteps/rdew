## Loads Recipes data

cooking_recipes <-
  readr::read_csv("data-raw/files/Cooking Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused)

usethis::use_data(cooking_recipes, overwrite = TRUE)
