## Loads NPC Gift Tastes
npc_gift_tastes <-
  readr::read_csv(file = "data-raw/files/NPC Gift Tastes.csv") %>%
  make_cols_snake_case() %>%
  tidyr::pivot_longer(cols = dplyr::ends_with("_dialogue"),
                      names_to = "dialogue_type",
                      values_to = "dialogue") %>%
  tidyr::pivot_longer(cols = dplyr::ends_with("_items"),
                      names_to = "item_type",
                      values_to = "item") %>%
  dplyr::mutate(dialogue_match =
                  stringr::str_remove(dialogue_type, "_dialogue"),
                item_match =
                  stringr::str_remove(item_type, "_items")) %>%
  dplyr::filter(dialogue_match == item_match) %>%
  dplyr::mutate(unnest_me =
                  purrr::map(.x = item,
                             .f = column_splitter,
                             column_names = "object_id")) %>%
  tidyr::unnest(unnest_me) %>%
  dplyr::relocate(object_id,
                  .after = item) %>%
  dplyr::select(-item,
                -dplyr::ends_with("_match")) %>%
  dplyr::mutate(object_id =
                  as.numeric(object_id))

usethis::use_data(npc_gift_tastes, overwrite = TRUE)
