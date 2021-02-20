## Loads NPC Dispositions

npc_dispositions <-
  readr::read_csv("data-raw/files/NPC Dispositions.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(love_interest =
                  convert_to_na(x = love_interest, value = "null"))

usethis::use_data(npc_dispositions, overwrite = TRUE)
