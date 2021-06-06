## Loads Bundles data

## Load dependencies
load_if_doesnt_exist("item_quality")

bundles <-
  readr::read_csv("data-raw/files/Bundles.csv") %>%
  make_cols_snake_case() %>%
  tidyr::separate(col = room_id_and_sprite_index,
                  into = c("room_id", "sprite_index"),
                  sep = "/") %>%
  dplyr::mutate(number_of_objects_required =
                  ifelse(test = is.na(number_of_objects_required),
                         yes =
                           (stringr::str_count(required_objects, " ") + 1) / 3,
                         no = number_of_objects_required)) %>%
  split_item_quantity_quality(colname = "required_objects",
                              varname = "required") %>%
  dplyr::mutate(required_object_is_gold = grepl(pattern = "-1",
                                                x = required_object_id)) %>%
  dplyr::rename(required_minimum_quality_num = required_minimum_quality) %>%
  dplyr::left_join(item_quality,
                   by = c("required_minimum_quality_num" = "value")) %>%
  dplyr::rename(required_minimum_quality = quality) %>%
  dplyr::left_join(objects %>%
                     dplyr::select(object_id, reward_object = name) %>%
                     dplyr::full_join(crafting_recipes %>%
                                        dplyr::select(yield_object_id,
                                                      reward_object = name),
                                      by = c("object_id" =
                                               "yield_object_id",
                                             "reward_object" =
                                               "reward_object")),
                   by = c("reward_object_id" = "object_id")) %>%
  dplyr::left_join(objects %>%
                     dplyr::select(object_id, required_object = name),
                   by = c("required_object_id" = "object_id")) %>%
  dplyr::mutate(reward_object = ifelse(test = bundle_name == "The Missing",
                                       yes = "Movie Theater",
                                       no = reward_object),
                number_of_reward_object_given =
                  ifelse(test = bundle_name == "The Missing",
                         yes = 1,
                         no = number_of_reward_object_given)) %>%
  dplyr::relocate(reward_object, .after = reward_object_id) %>%
  dplyr::relocate(required_object_is_gold,
                  .after = required_object_id) %>%
  dplyr::relocate(required_object, .after = required_object_id)

usethis::use_data(bundles, overwrite = TRUE)
