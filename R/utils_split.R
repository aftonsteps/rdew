.split_nested_items <- function(x, colname) {
  colname <- dplyr::enquo(colname)
  x <-
    x %>%
    dplyr::mutate(vals = stringr::str_split(.data[[colname]], " ")) %>%
    tidyr::unnest(vals) %>%
    dplyr::mutate(vals = as.numeric(vals))

  return(x)
}

split_item_quantity_quality <- function(x, colname, varname = "") {
  quality_name <- paste(varname, "minimum_quality", sep = "_")
  quantity_name <- paste(varname, "quantity", sep = "_")
  object_id_name <- paste(varname, "object_id", sep = "_")

  x <-
    x %>%
    .split_nested_items(colname = !!colname) %>%
    dplyr::mutate(row_number = (dplyr::row_number() + 2) %/% 3,
                  type =
                    dplyr::case_when(dplyr::row_number() %% 3 == 0 ~
                                       quality_name,
                                     dplyr::row_number() %% 3 == 1 ~
                                       object_id_name,
                                     TRUE ~ quantity_name)) %>%
    tidyr::pivot_wider(names_from = type,
                       values_from = vals) %>%
    dplyr::select(-row_number, -!!colname)
  return(x)
}
