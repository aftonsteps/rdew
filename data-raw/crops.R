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
                dplyr::everything())

usethis::use_data(crops, overwrite = TRUE)
