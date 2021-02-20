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
  dplyr::mutate(magical = ifelse(test = is.na(magical),
                                    yes = FALSE,
                                    no = magical))

usethis::use_data(building_blueprints, overwrite = TRUE)
