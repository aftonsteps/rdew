## Loads Objects dataset

objects <-
  readr::read_csv("data-raw/files/Objects.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(edibility = convert_to_na(x = edibility, value = -300))

usethis::use_data(objects, overwrite = TRUE)
