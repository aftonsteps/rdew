## Loads Monsters data

monsters <-
  readr::read_csv("data-raw/files/Monsters.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(distance_threshold_for_moving_toward_player =
                  convert_to_na(x = distance_threshold_for_moving_toward_player,
                                value = -1)) %>%
  dplyr::select(-english_name, -dplyr::contains("unimplemented"))

usethis::use_data(monsters, overwrite = TRUE)
