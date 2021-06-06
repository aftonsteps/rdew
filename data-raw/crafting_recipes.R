## Loads Crafting Recipes dataset

crafting_recipes <-
  readr::read_csv("data-raw/files/Crafting Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused) %>%
  dplyr::mutate(ring = ifelse(test = big_craftable == "Ring",
                              yes = TRUE,
                              no = FALSE)) %>%
  tidyr::separate(yield_object_id,
                  sep = " ",
                  remove = TRUE,
                  into = c("yield_object_id", "num_yield_object"),
                  fill = "right") %>%
  dplyr::mutate(big_craftable =
                  ifelse(test = big_craftable == "true",
                         yes = TRUE,
                         no = FALSE),
                num_yield_object = ifelse(test = is.na(num_yield_object),
                                          yes = 1,
                                          no = num_yield_object),
                yield_object_id = as.numeric(yield_object_id)) %>%
  dplyr::select(name,
                ingredients,
                yield_object_id,
                num_yield_object,
                big_craftable,
                ring,
                unlock_conditions)

usethis::use_data(crafting_recipes, overwrite = TRUE)
