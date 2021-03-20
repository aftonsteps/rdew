## Loads Caught Fish data

caught_fish <-
  readr::read_csv("data-raw/files/Caught Fish.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(locations = convert_to_na(x = locations, value = -1)) %>%
  dplyr::select(-locations)

usethis::use_data(caught_fish, overwrite = TRUE)
