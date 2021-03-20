## Loads furniture dataset

furniture_types <-
  t(data.frame("chair" = 0,
               "bench" = 1,
               "couch" = 2,
               "armchair" = 3,
               "dresser" = 4,
               "longTable" = 5,
               "painting" = 6,
               "lamp" = 7,
               "decor" = 8,
               "other" = 9,
               "bookcase" = 10,
               "table" = 11,
               "rug" = 12,
               "window" = 13,
               "fireplace" = 14,
               "bed" = 15,
               "torch" = 16,
               "sconce" = 17)) %>%
  as.data.frame() %>%
  tibble::rownames_to_column()

colnames(furniture_types) <- c("type", "type_id")

furniture_dims <-
  data.frame(type_id = seq(0, 17),
             default_rectangle_width =
               c(1, 2, 3, 2, 2, 5, 2, 1, 1, 1, 2, 2, 3, 1, 2, 1, 1, 1),
             default_rectangle_height =
               c(2, 2, 2, 2, 2, 3, 2, 3, 2, 2, 3, 3, 2, 2, 5, 1, 2, 2)) %>%
  dplyr::left_join(furniture_types, by = "type_id")

furniture <-
  readr::read_csv(file = "data-raw/files/Furniture.csv") %>%
  make_cols_snake_case() %>%
  dplyr::left_join(furniture_dims, by = "type") %>%
  dplyr::mutate(source_rectangle_width =
                  ifelse(test = is.na(source_rectangle_width) ||
                           source_rectangle_width == -1,
                         yes = default_rectangle_width,
                         no = source_rectangle_width),
                source_rectangle_height =
                  ifelse(test = is.na(source_rectangle_height) ||
                           source_rectangle_height == -1,
                         yes = default_rectangle_height,
                         no = source_rectangle_height))

usethis::use_data(furniture, overwrite = TRUE)
