## Loads Universal Gift Tastes

universal_gift_tastes <-
  readr::read_csv("data-raw/files/Universal Gift Tastes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(universal_type =
                  gsub(pattern = "Universal_",
                       replacement = "",
                       x = universal_type),
                unnest_me =
                  purrr::map(.x = items,
                             .f = column_splitter,
                             column_names = "object_id")) %>%
  tidyr::unnest(unnest_me) %>%
  dplyr::relocate(object_id,
                  .after = items
  ) %>%
  dplyr::select(-items) %>%
  dplyr::mutate(object_id =
                  as.numeric(object_id))

usethis::use_data(universal_gift_tastes, overwrite = TRUE)
