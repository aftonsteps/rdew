## Loads Bundles data

bundles <-
  readr::read_csv("data-raw/files/Bundles.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(required_object_id =
                  convert_to_na(x = required_object_id, value = -1)) %>%
  dplyr::mutate(required_object_is_gold =
                  ifelse(test = is.na(required_object_id),
                         yes = TRUE,
                         no = FALSE)) %>%
  dplyr::select(room_id_and_sprite_index:required_object_id,
                required_object_is_gold,
                dplyr::everything()) %>%
  dplyr::mutate(required_min_quality_of_objects =
                  ifelse(test = required_min_quality_of_objects > 5,
                         yes = NA,
                         no = required_min_quality_of_objects))

usethis::use_data(bundles, overwrite = TRUE)
