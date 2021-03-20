## Loads Recipes data

cooking_recipes <-
  readr::read_csv("data-raw/files/Cooking Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused) %>%
  dplyr::mutate(unlock_conditions =
                  ifelse(test = name == "Cookies",
                         yes = "f Evelyn 4 OR Stardrop Saloon 300g after f Evelyn 4",
                         no = unlock_conditions))

usethis::use_data(cooking_recipes, overwrite = TRUE)
