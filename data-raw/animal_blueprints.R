## Loads Animal Blueprints

animal_blueprints <-
  readr::read_csv("data-raw/files/Animal Blueprints.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-null) %>%
  dplyr::mutate(is_farm = ifelse(test = is_farm == "Farm",
                                 yes = TRUE,
                                 no = FALSE)) %>%
  dplyr::select(-english_name) %>%
  dplyr::rename(animal_name = name,
                purchase_price = price)

usethis::use_data(animal_blueprints, overwrite = TRUE)
