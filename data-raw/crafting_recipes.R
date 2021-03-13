## Loads Crafting Recipes dataset

crafting_recipes <-
  readr::read_csv("data-raw/files/Crafting Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused) %>%
  dplyr::mutate(big_craftable =
                  ifelse(test = big_craftable == "true",
                         yes = "Big Craftable",
                         no = ifelse(test = big_craftable == "false",
                                     yes = "Other",
                                     no = big_craftable)))

usethis::use_data(crafting_recipes, overwrite = TRUE)
