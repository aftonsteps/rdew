## Loads Big Craftables data

big_craftables <-
  readr::read_csv(file = "data-raw/files/Big Craftables.csv") %>%
  make_cols_snake_case() %>%
  dplyr::rename(object_name = name,
                lamp_type = is_lamp,
                category_id = category,
                sell_price = price) %>%
  dplyr::select(-english_name) %>%
  dplyr::left_join(categories %>% dplyr::select(category_id, category_name),
                   by = "category_id") %>%
  dplyr::relocate(category_name, .after = "category_id")

usethis::use_data(big_craftables, overwrite = TRUE)
