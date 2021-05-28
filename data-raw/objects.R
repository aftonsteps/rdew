## Loads Objects dataset

objects <-
  readr::read_csv("data-raw/files/Objects.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(edibility = convert_to_na(x = edibility, value = -300)) %>%
  dplyr::mutate(food_or_drink =
                  ifelse(test = food_and_drink %in% c("food", "drink"),
                         yes = food_and_drink,
                         no = NA),
                geode_possible_items =
                  ifelse(test = grepl(pattern = "^[0-9]", x = food_and_drink),
                         yes = food_and_drink,
                         no = NA),
                buffs =
                  ifelse(test = grepl(pattern = "^[0-9]", x = buffs),
                         yes = buffs,
                         no = NA)) %>%
  dplyr::select(-food_and_drink, -english_name) %>%
  tidyr::separate(col = buffs,
                  sep = " ",
                  remove = FALSE,
                  extra = "merge",
                  fill = "right",
                  into = c("buff_farming",
                           "buff_fishing",
                           "buff_mining",
                           "buff_digging_unimplemented",
                           "buff_luck",
                           "buff_foraging",
                           "buff_crafting",
                           "buff_max_energy",
                           "buff_magnetism",
                           "buff_speed",
                           "buff_defense",
                           "buff_attack"))

usethis::use_data(objects, overwrite = TRUE)


x <-
  tibble::tibble(name = c("Ice Cream", "Stir Fry"),
         ingredients = c("-6 1 245 1", "78 1 404 1 250 3 247 1"),
         yield_object_id = c(233, 606),
         unlock_conditions = c("f Jodi 7", "l 100")) %>%
  dplyr::mutate( ingredients =
                   stringr::str_split(ingredients, " ") ) %>%
  tidyr::unnest(ingredients) %>%
  dplyr::mutate(row_number = (dplyr::row_number()+1) %/% 2,
                type =
                  dplyr::case_when(dplyr::row_number()%%2 == 0 ~ "ingredient_qty",
                                   TRUE ~ "ingredient_id")) %>%
  tidyr::pivot_wider(names_from = type, values_from = ingredients)
