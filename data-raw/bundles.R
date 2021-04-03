## Loads Bundles data

bundles <-
  readr::read_csv("data-raw/files/Bundles.csv") %>%
  make_cols_snake_case() %>%
  tidyr::separate(col = room_id_and_sprite_index,
                  into = c("room_id", "sprite_index"),
                  sep = "/") %>%
  dplyr::mutate(required_object_is_gold = grepl(pattern = "-1",
                                                x = required_objects)) %>%
  dplyr::select(room_id:required_objects,
                required_object_is_gold,
                dplyr::everything())

usethis::use_data(bundles, overwrite = TRUE)
