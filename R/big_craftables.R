## Loads Big Craftables data

## TODO: fix loading. many of the datasets have a parsing error.

big_craftables <-
  readr::read_csv(file = "data-raw/files/Big Craftables.csv") %>%
  rstardew::make_cols_snake_case()

usethis::use_data(big_craftables, overwrite = TRUE)
