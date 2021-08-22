## Loads building blueprints
building_blueprints <-
  readr::read_csv("data-raw/files/Building Blueprints.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(map_to_warp_to =
                  convert_to_na(x = map_to_warp_to,
                                value = "null"),
                name_of_building_to_upgrade =
                  convert_to_na(x = name_of_building_to_upgrade,
                                value = "none"),
                max_occupants =
                  convert_to_na(x = max_occupants,
                                value = -1),
                action_behavior =
                  convert_to_na(x = action_behavior,
                                value = "null"),
                price =
                  convert_to_na(x = price,
                                value = -1)) %>%
  dplyr::mutate(magical =
                  ifelse(test = is.na(magical),
                         yes = FALSE,
                         no = magical),
                unnest_me =
                  purrr::map(.x = items_required,
                             .f = column_splitter,
                             column_names = c("required_object_id", "required_quantity")
                  )) %>%
  tidyr::unnest(unnest_me) %>%
  dplyr::relocate(required_object_id,
                  required_quantity,
                  .after = items_required) %>%
  dplyr::select(-items_required) %>%
  dplyr::mutate(
    dplyr::across(
      dplyr::starts_with("required_"),
      as.numeric))

usethis::use_data(building_blueprints, overwrite = TRUE)
