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
                  as.numeric(object_id)) %>%
  dplyr::mutate(category_id = ifelse(test = object_id < 0,
                                     yes = object_id,
                                     no = NA),
                object_id = ifelse(test = object_id > 0,
                                   yes = object_id,
                                   no = NA)) %>%
  dplyr::left_join(objects %>% dplyr::select(object_id, name),
                   by = "object_id",
                   suffix = c("", "_object")) %>%
  dplyr::rename("object_name" = "name") %>%
  dplyr::left_join(categories %>% dplyr::select(category_id, category_name),
                   by = "category_id") %>%
  dplyr::select(universal_type,
                object_id,
                object_name,
                category_id,
                category_name)

usethis::use_data(universal_gift_tastes, overwrite = TRUE)
