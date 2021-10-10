## Load Achievements data

achievements <-
  readr::read_csv("data-raw/files/Achievements.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(prerequisite_achievement =
                  convert_to_na(prerequisite_achievement, value = -1)) %>%
  dplyr::arrange(id) %>%
  dplyr::rename(hat_earned_object_id = hat_earned,
                achievement_name = name) %>%
  dplyr::left_join(hats %>% dplyr::select(object_id, hat_name),
                   by = c("hat_earned_object_id" = "object_id"))

usethis::use_data(achievements, overwrite = TRUE)
