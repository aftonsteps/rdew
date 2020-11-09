#' Make Snake Case
#'
#' Takes as input a character type and returns a character type with lower case
#' and underscores instead of whitespace
#'
#' @param x_char a character type
#'
#' @return a character type in lower case with whitespace removed
#' @noRd
#'
#' @examples
#' make_snake_case(x_char = c("camelCase", "char with  spaces"))
make_snake_case <- function(x_char) {
  x_char <-
    tolower(x = x_char) %>%
    gsub(pattern = " +|\\.+", replacement = "_")

  return(x_char)
}
