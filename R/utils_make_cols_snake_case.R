#' Make Cols Snake Case
#'
#' Lowercases the column names of a matrix or data.frame, and replaces spaces
#' with underscores.
#'
#' @param x_data a data.frame or matrix with column names
#'
#' @return a data.frame or matrix with snake case column names
#' @noRd
#'
#' @examples
#' make_cols_snake_case(x_data =
#' data.frame("Space  Col" = c(1,2,3),
#' check.names = FALSE))
make_cols_snake_case <- function(x_data) {
  colnames(x_data) <- rstardew::make_snake_case(x_char = colnames(x_data))

  return(x_data)
}
