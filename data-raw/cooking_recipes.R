## Loads Recipes data

cooking_recipes <-
  readr::read_csv("data-raw/files/Cooking Recipes.csv") %>%
  make_cols_snake_case() %>%
  dplyr::select(-unused) %>%
  dplyr::mutate(unlock_conditions =
                  ifelse(test = name == "Cookies",
                         yes = "f Evelyn 4 OR Stardrop Saloon 300g after f Evelyn 4",
                         no = unlock_conditions),
                unnest_me =
                  purrr::map(
                    .x = ingredients,
                    .f = column_splitter,
                    column_names = c("ingredient_id", "ingredient_quantity")
                  )) %>%
  tidyr::unnest(unnest_me) %>%
  dplyr::relocate(ingredient_id,
                  ingredient_quantity,
                  .after = ingredients
  ) %>%
  dplyr::select(-ingredients) %>%
  dplyr::mutate(
    dplyr::across(
      dplyr::starts_with("ingredient_"),
      as.numeric))

usethis::use_data(cooking_recipes, overwrite = TRUE)
