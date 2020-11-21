## Loads crops object information dataset

crops_object_information <-
  readr::read_csv(file = "data-raw/files/Crops Object Information.csv") %>%
  make_cols_snake_case()

usethis::use_data(crops_object_information, overwrite = TRUE)
