#' Split Ingredients
#'
#' Splits the column `required_ingredients` into required object and quantity of
#' required object, for all required objects, and converts the dataset to long format
#' with columns for required object and quantity of required object.
#'
#' @param x a data.frame or data.frame-like object containing a column
#' `required_ingredients` which is itself a space-delimited set of pairs
#'
#' @return a long-form dataset with columns for required object and quantity of
#' required object
#' @export
#'
#' @examples
#' split_ingredients(x = crafting_recipes)
split_ingredients <- function(x) {
  clean_ingredient <-
    x %>%
    dplyr::mutate(
      ingredients = purrr::map(ingredients, ingredient_splitter)
    ) %>%
    tidyr::unnest(ingredients)

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
ingredient_splitter <- function(x) {
  clean_x <-
    x %>%
    stringr::str_split(" ") %>%
    unlist() %>%
    matrix(
      ncol = 2,
      byrow = TRUE
    ) %>%
    tibble::as_tibble(.name_repair = ~ c("ingredient_id", "ingredient_quantity"))

  return(clean_x)
}
