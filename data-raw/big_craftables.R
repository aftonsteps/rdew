## Loads Big Craftables data

big_craftables <-
  readr::read_csv(file = "data-raw/files/Big Craftables.csv") %>%
  make_cols_snake_case()

usethis::use_data(big_craftables, overwrite = TRUE)
