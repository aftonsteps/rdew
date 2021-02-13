## Loads Animals data
## TODO: Add convenience dataset for harvest_type to make it more readable
## TODO: Remember to update links to the wiki in the documentation once
## ownership is transferred to ConcernedApe

animals <-
  readr::read_csv("data-raw/files/Animals.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(meat_index = ifelse(test = meat_index == "null",
                                    yes = NA,
                                    no = meat_index))

usethis::use_data(animals, overwrite = TRUE)
