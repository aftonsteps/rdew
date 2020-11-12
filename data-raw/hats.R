## Loads hats dataset

## TODO: fix a parsing warning

hats <-
  readr::read_csv(file = "data-raw/files/Hats.csv") %>%
  rstardew::make_cols_snake_case()

usethis::use_data(hats, overwrite = TRUE)
