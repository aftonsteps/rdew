## Loads Crops data

crops <-
  readr::read_csv(file = "data-raw/files/Crops.csv") %>%
  rstardew::make_cols_snake_case()

usethis::use_data(crops, overwrite = TRUE)
