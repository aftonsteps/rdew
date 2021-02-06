## Loads hats dataset

hats <-
  readr::read_csv(file = "data-raw/files/Hats.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(skip_hair_draw = as.logical(skip_hair_draw)) %>%
  dplyr::mutate(prismatic = ifelse(test = is.na(prismatic),
                                   yes = FALSE,
                                   no = ifelse(prismatic == "Prismatic",
                                               yes = TRUE,
                                               no = prismatic)))

usethis::use_data(hats, overwrite = TRUE)
