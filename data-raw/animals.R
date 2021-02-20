## Loads Animals data
## TODO: Remember to update links to the wiki in the documentation once
## ownership is transferred to ConcernedApe

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
                                     no = "Not used")))

usethis::use_data(animals, overwrite = TRUE)
