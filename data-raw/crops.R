## Loads Crops data

crops <-
  readr::read_csv(file = "data-raw/files/Crops.csv") %>%
  make_cols_snake_case() %>%
  dplyr::mutate(growth_season_spring =
                  grepl(pattern = "spring", x = growth_seasons),
                growth_season_summer =
                  grepl(pattern = "summer", x = growth_seasons),
                growth_season_fall =
                  grepl(pattern = "fall", x = growth_seasons),
                growth_season_winter =
                  grepl(pattern = "winter", x = growth_seasons)) %>%
  dplyr::select(-growth_seasons) %>%
  tidyr::separate(col = tint_color,
                  into = c("tint_color", "tint_color_value"),
                  sep = " ",
                  extra = "merge",
                  fill = "right") %>%
  dplyr::mutate(tint_color = as.logical(tint_color)) %>%
  dplyr::select(object_id,
                dplyr::starts_with(match = "days_in_stage"),
                dplyr::starts_with(match = "growth_season"),
                dplyr::everything()) %>%
  dplyr::left_join(objects %>% dplyr::select(object_id, name),
                   by = "object_id") %>%
  dplyr::rename(seed_name = name)

seed_pattern <- " Seeds$| Starter$| Tuber$ | Shoot$"

multi_seeds <-
  data.frame(crop_name_estimate =
               rep(c("Spring", "Summer", "Fall", "Winter"), each=4),
             real_name =
               c("Wild Horseradish", "Daffodil", "Leek", "Dandelion",
                 "Grape", "Spice Berry", "Sweet Pea", NA,
                 "Blackberry", "Common Mushroom", "Hazelnut", "Wild Plum",
                 "Crocus", "Crystal Fruit", "Snow Yam", "Winter Root")) %>%
  dplyr::filter(!is.na(real_name))

special_match_lookup <-
  data.frame(crop_name_estimate =
               c("Cranberry", "Bean", "Spangle",
                 "Ancient", "Taro", "Pepper",
                 "Fairy", "Cactus", "Jazz"),
             real_name =
               c("Cranberries", "Green Bean", "Summer Spangle",
                 "Ancient Fruit", "Taro Root", "Hot Pepper",
                 "Fairy Rose", "Cactus Fruit", "Blue Jazz")) %>%
  dplyr::full_join(multi_seeds,
                   by = c("crop_name_estimate", "real_name"))


seed_names <-
  crops %>%
  dplyr::select(object_id, seed_name) %>%
  dplyr::mutate(crop_name_estimate =
                  gsub(pattern = seed_pattern,
                       replacement = "",
                       x = seed_name)) %>%
  dplyr::left_join(objects %>% dplyr::select(object_id, name),
                   by = c("crop_name_estimate" = "name"),
                   suffix = c("_seed", "_crop")) %>%
  dplyr::rename(seed_object_id = object_id_seed,
                crop_object_id = object_id_crop) %>%
  dplyr::left_join(special_match_lookup,
                   by = "crop_name_estimate") %>%
  dplyr::mutate(crop_name_estimate =
                  ifelse(test = is.na(crop_object_id),
                         yes = real_name,
                         no = crop_name_estimate)) %>%
  dplyr::select(seed_object_id, seed_name, crop_name = crop_name_estimate) %>%
  dplyr::left_join(objects %>% dplyr::select(crop_object_id = object_id,
                                             name),
                   by = c("crop_name" = "name"))

crops <-
  crops %>%
  dplyr::left_join(seed_names, by = c("seed_name"))

## Little checks
## Expect true
nrow(crops) == sum(crops$object_id == crops$seed_object_id)
## Expect 0
sum(is.na(crops$crop_object_id))

crops <-
  crops %>%
  dplyr::select(-object_id) %>%
  dplyr::select(seed_object_id, seed_name, dplyr::everything()) %>%
  dplyr::mutate(is_probabalistic =
                  ifelse(test = crop_name %in% multi_seeds$real_name,
                         yes = TRUE,
                         no = FALSE))

usethis::use_data(crops, overwrite = TRUE)
