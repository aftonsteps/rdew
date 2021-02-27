## Load Achievements data

achievements <-
  readr::read_csv("data-raw/files/Achievements.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(prerequisite_achievement =
                  convert_to_na(prerequisite_achievement, value = -1))

usethis::use_data(achievements, overwrite = TRUE)
