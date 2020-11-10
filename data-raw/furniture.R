## Loads furniture dataset

furniture <-
  readr::read_csv(file = "data-raw/files/Furniture.csv") %>%
  rstardew::make_cols_snake_case() %>%
  tidyr::separate(col = source_rectangle,
                  into = c("source_rectangle_width", "source_rectangle_height"),
                  sep = " ",
                  fill = "right") %>%
  tidyr::separate(col = bounding_box,
                  into = c("bounding_box_width", "bounding_box_height"),
                  sep = " ",
                  fill = "right")

usethis::use_data(furniture, overwrite = TRUE)
