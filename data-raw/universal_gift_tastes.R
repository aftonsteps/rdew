## Loads Universal Gift Tastes

universal_gift_tastes <-
  readr::read_csv("data-raw/files/Universal Gift Tastes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(universal_type =
                  gsub(pattern = "Universal_",
                       replacement = "",
                       x = universal_type))

usethis::use_data(universal_gift_tastes, overwrite = TRUE)
