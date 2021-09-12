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
                  as.numeric(object_id)) %>%
  dplyr::mutate(item_type = factor(item_type,
                                   levels = c("loved_items",
                                              "liked_items",
                                              "neutral_items",
                                              "disliked_items",
                                              "hated_items"))) %>%
  dplyr::arrange(name, desc(item_type)) %>%
  dplyr::distinct(name, object_id, .keep_all = TRUE) %>%
  dplyr::arrange(name, item_type, object_id) %>%
  dplyr::left_join(objects %>% dplyr::select(object_id, name),
                   by = "object_id",
                   suffix = c("", "_object")) %>%
  dplyr::rename("object_name" = "name_object") %>%
  dplyr::left_join(categories %>% dplyr::select(object_id, category_name),
                   by = "object_id")

usethis::use_data(npc_gift_tastes, overwrite = TRUE)
