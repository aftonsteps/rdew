## Loads Locations data

locations <-
  readr::read_csv("data-raw/files/Locations.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(spring_foraging =
                  convert_to_na(x = spring_foraging, value = -1),
                summer_foraging =
                  convert_to_na(x = summer_foraging, value = -1),
                fall_foraging =
                  convert_to_na(x = fall_foraging, value = -1),
                winter_foraging =
                  convert_to_na(x = winter_foraging, value = -1),
                spring_fishing =
                  convert_to_na(x = spring_fishing, value = -1),
                summer_fishing =
                  convert_to_na(x = summer_fishing, value = -1),
                fall_fishing =
                  convert_to_na(x = fall_fishing, value = -1),
                winter_fishing =
                  convert_to_na(x = winter_fishing, value = -1),
                artifact_data =
                  convert_to_na(x = artifact_data, value = -1))

usethis::use_data(locations, overwrite = TRUE)
