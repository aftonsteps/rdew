#' Split Ingredients
#'
#' Splits the column `required_ingredients` into required object and quantity of
#' required object, for all required objects, and converts the dataset to long format
#' with columns for required object and quantity of required object.
#'
#' @param .data a data.frame or data.frame-like object
#'
#' @return a long-form dataset with columns for required object and/or quantity of required object
#' @export
split_column <- function(.data, cols, ...) {
  column_names <- unlist(list(...))
  clean_ingredient <-
    .data %>%
    dplyr::mutate(
      {{ col }} := purrr::map(
        .x = {{ col }},
        .f = column_splitter,
        column_names = column_names
      )
    ) %>%
    tidyr::unnest({{ col }})

  return(clean_ingredient)
}

#' Ingredient Splitter
#'
#' Splits ingredients by " " and makes a two-col tibble.
#'
#' @param x a vector to split with space-delimited pairs of ingredients and
#' ingredient quantities
#' @noRd
#'
#' @return a two-col tibble of ingredient and number of ingredients
#'
#' @examples ingredient_splitter(c(1, 2, 3, 4, 5, 6))
column_splitter <- function(x, column_names) {
  clean_x <-
    x %>%
    stringr::str_split(" ") %>%
    purrr::map(~ {
      if (all(is.na(unlist(.x)))) {
        rep(NA, length(column_names))
      } else {
        .x
      }
    }) %>%
    unlist() %>%
    matrix(
      ncol = length(column_names),
      byrow = TRUE
    ) %>%
    tibble::as_tibble(.name_repair = ~ column_names)

  return(clean_x)
}
