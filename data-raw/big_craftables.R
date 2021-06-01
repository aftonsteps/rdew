## Loads Big Craftables data

big_craftables <-
  readr::read_csv(file = "data-raw/files/Big Craftables.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-english_name)

usethis::use_data(big_craftables, overwrite = TRUE)
