## Parses Rings data

rings <- readr::read_csv("data-raw/files/Rings.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(edibility = convert_to_na(x = edibility, value = -300))

usethis::use_data(rings, overwrite = TRUE)
