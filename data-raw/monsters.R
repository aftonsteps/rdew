## Loads Monsters data

monsters <-
  readr::read_csv("data-raw/files/Monsters.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(distance_threshold_for_moving_toward_player =
                  convert_to_na(x = distance_threshold_for_moving_toward_player,
                                value = -1)) %>%
  dplyr::select(-english_name, -dplyr::contains("unimplemented")) %>%
  dplyr::mutate(
    unnest_me = purrr::map(
      .x = objects_to_drop,
      .f = column_splitter,
      column_names = c("object_id", "object_drop_chance"))) %>%
  tidyr::unnest(unnest_me) %>%
  dplyr::relocate(object_id,
                  object_drop_chance,
                  .after = duration_of_random_movements) %>%
  dplyr::select(-objects_to_drop) %>%
  dplyr::mutate(
    dplyr::across(
      c(object_id, object_drop_chance),
      as.numeric))


usethis::use_data(monsters, overwrite = TRUE)
