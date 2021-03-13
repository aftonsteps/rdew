## Loads FoodsAndDrinks data

foods_and_drinks <-
  readr::read_csv("data-raw/files/FoodsAndDrinks.csv") %>%
  remove_parens_from_colnames() %>%
  make_cols_snake_case()

usethis::use_data(foods_and_drinks, overwrite = TRUE)
