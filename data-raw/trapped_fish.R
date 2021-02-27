## Loads Trapped Fish data

trapped_fish <-
  readr::read_csv("data-raw/files/TrappedFish.csv") %>%
  make_cols_snake_case()

usethis::use_data(trapped_fish, overwrite = TRUE)
