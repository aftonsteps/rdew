## Loads weapons dataset

weapons <-
  readr::read_csv(file = "data-raw/files/Weapons.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(base_mine_level =
                  convert_to_na(x = base_mine_level,
                                value = -1),
                min_mine_level =
                  convert_to_na(x = min_mine_level,
                                value = -1))

usethis::use_data(weapons, overwrite = TRUE)
