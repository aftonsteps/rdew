## Loads seeds object information dataset
## TODO add convenience function for calculating the purchase price of seeds
## TODO consider renaming all instances of "objectid" to "object_id" ?

seeds_object_information <-
  readr::read_csv(file = "data-raw/files/Seeds Object Information.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(objectid, name, purchase_price = price, dplyr::everything())

usethis::use_data(seeds_object_information, overwrite = TRUE)
