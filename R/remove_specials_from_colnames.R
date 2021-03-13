#' Remove Specials From Colnames
#'
#' Removes special characters from column names.
#'
#' @param x dataset of a type that has colnames (e.g. data.frame)
#'
#' @return the same dataset with specials removed from column names
#'
#' @examples
#' badly_name_data <-
#'                data.frame(goodcol = c(1,2,3),
#'                "bad_col(has_parens)" = c(4,5,6),
#'                check.names = FALSE)
#' remove_parens_from_colnames(badly_name_data)
remove_parens_from_colnames <- function(x) {
  new_colnames <-
    gsub(pattern = "\\(|\\)", replacement = "", x = colnames(x))

  colnames(x) <- new_colnames

  return(x)
}
