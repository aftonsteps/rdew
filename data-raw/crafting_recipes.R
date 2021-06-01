## Loads Crafting Recipes dataset

crafting_recipes <-
  readr::read_csv("data-raw/files/Crafting Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused) %>%
  dplyr::mutate(ring = ifelse(test = big_craftable == "Ring",
                              yes = TRUE,
                              no = FALSE)) %>%
  dplyr::mutate(big_craftable =
                  ifelse(test = big_craftable == "true",
                         yes = TRUE,
                         no = FALSE)) %>%
  dplyr::select(name,
                ingredients,
                yield_object_id,
                big_craftable,
                ring,
                unlock_conditions)

usethis::use_data(crafting_recipes, overwrite = TRUE)
