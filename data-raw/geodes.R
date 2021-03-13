## Loads Geodes data

geodes <-
  readr::read_csv("data-raw/files/Geodes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(edibility = convert_to_na(x = edibility, value = -300))

usethis::use_data(geodes, overwrite = FALSE)
