## Loads NPC Dispositions
## TODO add a convenience function for one-hot encoding relationships

npc_dispositions <-
  readr::read_csv("data-raw/files/NPC Dispositions.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(love_interest =
                  convert_to_na(x = love_interest, value = "null"))

usethis::use_data(npc_dispositions, overwrite = TRUE)
