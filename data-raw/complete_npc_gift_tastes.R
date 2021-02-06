## Creates complete NPC Gift Tastes
## Requires NPC Gift Tastes and Universal Gift Tastes datasets

## TODO: add a function that actuall merges the data correctly, instead
## of a dummy-code 1 id?

if (! "npc_gift_tastes" %in% ls() & ! "universal_gift_tastes" %in% ls()) {
  source("data-raw/npc_gift_tastes.R")
  source("data-raw/universal_gift_tastes.R")
}

complete_npc_gift_tastes <-
  universal_gift_tastes %>%
  tidyr::pivot_wider(names_from = c("universal_type"),
                     values_from = c("items")) %>%
  make_cols_snake_case() %>%
  dplyr::mutate(id = rep(1)) %>%
  dplyr::full_join(npc_gift_tastes %>%
                     dplyr::mutate(id = rep(1)),
                   by = "id") %>%
  dplyr::mutate(loved_items = paste(loved_items, love),
                liked_items = paste(liked_items, like),
                disliked_items = paste(disliked_items, dislike),
                hated_items = paste(hated_items, hate),
                neutral_items = paste(neutral_items, neutral)) %>%
  dplyr::select(-c(love, like, dislike, hate, neutral, id))

usethis::use_data(complete_npc_gift_tastes, overwrite = TRUE)

