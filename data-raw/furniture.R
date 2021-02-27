## Loads furniture dataset
## TODO consider splitting the columns for width in Java?

furniture <-
  readr::read_csv(file = "data-raw/files/Furniture.csv") %>%
  make_cols_snake_case() %>%
  # tidyr::separate(col = source_rectangle,
  #                 into = c("source_rectangle_width", "source_rectangle_height"),
  #                 sep = " ",
  #                 fill = "right") %>%
  # tidyr::separate(col = bounding_box,
  #                 into = c("bounding_box_width", "bounding_box_height"),
  #                 sep = " ",
  #                 fill = "right") %>%
  dplyr::mutate(source_rectangle_width = convert_to_na(source_rectangle_width,
                                                       value = -1),
                bounding_box_width = convert_to_na(bounding_box_width,
                                                   value = -1))

usethis::use_data(furniture, overwrite = TRUE)
