## Loads Quests data

quests <-
  readr::read_csv("data-raw/files/Quests.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(solution_or_trigger =
                  ifelse(test = solution_or_trigger %in%
                           c("null", ".", "-1"),
                         yes = NA,
                         no = solution_or_trigger)) %>%
  dplyr::mutate(next_quest =
                  convert_to_na(x = next_quest, value = -1),
                reward_description =
                  convert_to_na(x = reward_description, value = -1))

usethis::use_data(quests, overwrite = TRUE)
