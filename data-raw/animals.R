## Loads Animals data

animals <-
  readr::read_csv("data-raw/files/Animals.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(meat_index = ifelse(test = meat_index == "null",
                                    yes = NA,
                                    no = meat_index)) %>%
  dplyr::mutate(harvest_type =
                  ifelse(test = harvest_type == 0,
                         yes = "Pick up",
                         no = ifelse(test = harvest_type == 1,
                                     yes = "Grab",
                                     no = "Not used")),
                harvest_tool =
                  ifelse(test = harvest_tool == "null",
                         yes = NA,
                         no = harvest_tool)) %>%
  dplyr::select(-english_display_type, -english_display_building,
                -meat_index) %>%
  dplyr::rename(animal_name = name)

usethis::use_data(animals, overwrite = TRUE)

