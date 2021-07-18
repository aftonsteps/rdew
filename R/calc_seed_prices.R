#' Calc Seed Prices
#'
#' Calculates the seed prices for purchased seeds based upon if you have a
#' Jojamart membership or not.
#'
#' @param crop_data data.frame containing crop data, defaults to the data
#' contained in the croptimizer package
#' @param both_joja_cols logical specifying if you want both JojaMart price
#' columns, one for the price with the membership and one for the price without
#' @param joja_member logical specifying if you have the JojaMart membership,
#' or can be NA if both_joja_cols = FALSE
#'
#' @return data.frame containing crop_data with seed_price and source columns
#' appended
#' @export
#'
#' @examples
#' fall_crops <-
#' filter_to_season(season = "fall", crop_data = croptimizer::crops)
#' calc_seed_prices(crop_data = fall_crops,
#' joja_member = FALSE,
#' drop_cols = TRUE)
calc_seed_prices <- function(all_joja_cols = TRUE, joja_member = FALSE) {
  if (! is.logical(all_joja_cols)) {
    stop("all_joja_cols must be of class logical")
  }
  if (! all_joja_cols && ! "logical" %in% class(joja_member)) {
    stop("joja_member must be of class logical if all_joja_cols == FALSE")
  }
  if (all_joja_cols && ! "logical" %in% class(joja_member)) {
    warning("Warning: joja_member must be of class logical but will be ignored if all_joja_cols == TRUE")
  }

  prices <-
    rdew::seeds_object_information %>%
    dplyr::mutate(purchased_price_pierre = 2 * sell_price) %>%
    dplyr::mutate(purchased_price_joja_with_membership =
                    purchased_price_pierre,
                  purchased_price_joja_no_membership = 2.5 * sell_price) %>%
    dplyr::mutate(purchased_price_pierre =
                    ifelse(test = object_id == 431, ## Sunflower
                           yes = 200,
                           no = purchased_price_pierre),
                  purchased_price_joja_no_membership =
                  ifelse(test = object_id == 431,
                         yes = 125,
                         no = purchased_price_joja_no_membership),
                purchased_price_joja_with_membership =
                  ifelse(test = object_id == 431,
                         yes = 100,
                         no = purchased_price_joja_with_membership)) %>%
    dplyr::mutate(purchased_price_pierre =
                    ifelse(test = purchased_price_pierre == 0,
                           yes = NA,
                           no = purchased_price_pierre),
                  purchased_price_joja_no_membership =
                    ifelse(test = purchased_price_joja_no_membership == 0,
                           yes = NA,
                           no = purchased_price_joja_no_membership),
                  purchased_price_joja_with_membership =
                    ifelse(test = purchased_price_joja_with_membership == 0,
                           yes = NA,
                           no = purchased_price_joja_with_membership))


  if (! all_joja_cols && joja_member) {
    prices <-
      prices %>%
      dplyr::select(-purchased_price_joja_no_membership,
                    purchased_price_joja = purchased_price_joja_with_membership)
  } else if (! all_joja_cols && ! joja_member) {
    prices <-
      prices %>%
      dplyr::select(-purchased_price_joja_with_membership,
                    purchased_price_joja = purchased_price_joja_no_membership)
  }

  # crop_data <-
  #   crop_data %>%
  #   cbind(joja_col) %>%
  #   dplyr::rowwise() %>%
  #   dplyr::mutate(seed_price =
  #                   ifelse(test =
  #                            !is.na(purchased_price_pierre) & !is.na(joja_col),
  #                          yes = min(purchased_price_pierre,
  #                                    joja_col,
  #                                    na.rm = TRUE),
  #                          no = NA)) %>%
  #   dplyr::mutate(source = ifelse(test = !is.na(seed_price),
  #                                 yes = ifelse(test =
  #                                                purchased_price_pierre ==
  #                                                seed_price &
  #                                                joja_col == seed_price,
  #                                              yes = "pierre, jojamart",
  #                                              no = ifelse(test =
  #                                                            purchased_price_pierre ==
  #                                                            seed_price,
  #                                                          yes = "pierre",
  #                                                          no = "jojamart")),
  #                                 no = NA)) %>%
  #   dplyr::select(-joja_col)
  #
  # ## Drop cols
  # if (drop_cols) {
  #   crop_data <-
  #     crop_data %>%
  #     dplyr::select(-purchased_price_pierre,
  #                   -purchased_price_joja_no_membership,
  #                   -purchased_price_joja_with_membership)
  # }

  ##prices <- as.data.frame(prices)

  return(prices)
}
