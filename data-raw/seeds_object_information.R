## Loads seeds object information dataset

seeds_object_information <-
  readr::read_csv(file = "data-raw/files/Seeds Object Information.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(objectid, name, sell_price, dplyr::everything())

usethis::use_data(seeds_object_information, overwrite = TRUE)
