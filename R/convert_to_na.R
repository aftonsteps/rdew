#' Convert to NA
#'
#' Converts specified values in a vector to NA's.
#'
#' @param x a vector to recode
#' @param value the value of x to recode as NA
#'
#' @return a vector with values recoded to NA
#' @export
#'
#' @examples
#' convert_to_na(x = c(1,2,3,4), value = 4)
convert_to_na <- function(x, value) {
  x[x == value] <- NA

  return(x)
}
