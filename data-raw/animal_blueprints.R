## Loads Animal Blueprints

animal_blueprints <-
  readr::read_csv("data-raw/files/Animal Blueprints.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-null) %>%
  dplyr::mutate(is_farm = ifelse(test = is_farm == "Farm",
                                 yes = TRUE,
                                 no = FALSE))

usethis::use_data(animal_blueprints, overwrite = TRUE)
