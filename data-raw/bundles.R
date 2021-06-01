## Loads Bundles data
load_if_doesnt_exist("item_quality")

bundles <-
  readr::read_csv("data-raw/files/Bundles.csv") %>%
  make_cols_snake_case() %>%
  tidyr::separate(col = room_id_and_sprite_index,
                  into = c("room_id", "sprite_index"),
                  sep = "/") %>%
  dplyr::mutate(number_of_items_required =
                  ifelse(test = is.na(number_of_items_required),
                         yes =
                           (stringr::str_count(required_objects, " ") + 1) / 3,
                         no = number_of_items_required)) %>%
  split_item_quantity_quality(colname = "required_objects",
                              varname = "required") %>%
  dplyr::mutate(required_object_is_gold = grepl(pattern = "-1",
                                                x = required_object_id)) %>%
  dplyr::relocate(room_id:required_object_id, required_object_is_gold) %>%
  dplyr::rename(required_minimum_quality_num = required_minimum_quality) %>%
  dplyr::left_join(item_quality,
                   by = c("required_minimum_quality_num" = "value")) %>%
  dplyr::rename(required_minimum_quality = quality)

usethis::use_data(bundles, overwrite = TRUE)
