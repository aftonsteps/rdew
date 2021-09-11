## Loads category data

## Names to replace NA's with
na_replacements <-
  data.frame(category_value = c("Object.BigCraftableCategory",
                                "Object.sellAtPierres",
                                "sellAtFishShopCategory",
                                "Object.equipmentCategory",
                                "Object.hatCategory",
                                "Object.ringCategory",
                                "Object.weaponCategory",
                                "Object.toolCategory"),
             category_name = c("Big Craftable",
                               "Object to Sell at Pierre's",
                               "Object to Sell at Fish Shop",
                               "Equipment",
                               "Hat",
                               "Ring",
                               "Weapon",
                               "Tool"))

categories <-
  readr::read_csv("data-raw/man_files/categories.csv") %>%
  make_cols_snake_case() %>%
  dplyr::rename(object_id = objectid,
                game_name = category_name) %>%
  dplyr::left_join(na_replacements, by = "category_value") %>%
  dplyr::mutate(category_name =
                  ifelse(test = is.na(category_name),
                         yes = game_name,
                         no = category_name))

usethis::use_data(categories, overwrite = TRUE)

