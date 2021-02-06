## Loads NPC Gift Tastes
## TODO fix parsing failures

npc_gift_tastes <-
  readr::read_csv(file = "data-raw/files/NPC Gift Tastes.csv") %>%
  make_cols_snake_case()

usethis::use_data(npc_gift_tastes, overwrite = TRUE)
