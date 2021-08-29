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
                  remove = TRUE,
                  extra = "merge",
                  fill = "right",
                  convert = TRUE,
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
                           "buff_attack")) %>%
  dplyr::rename(sell_price = price)

usethis::use_data(objects, overwrite = TRUE)
