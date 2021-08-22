## Sample data is from from dput(readr::read_csv("data-raw/files/Universal Gift Tastes.csv"))
sample_data <- structure(
  list(
    `Universal Type` = c("Universal_Love", "Universal_Like", "Universal_Neutral", "Universal_Dislike", "Universal_Hate"),
    Items = c("74 446 797 373 279", "-2 -7 -26 -75 -80 72 395 613 634 635 636 637 638 724 459 873", "194 216 262 304 815", "-4 -8 -12 -15 -16 -19 -22 -24 -25 -28 -74 78 169 246 247 305 309 310 311 403 419 423 535 536 537 725 726 749 271", "0 -20 -21 92 110 111 112 142 152 153 157 178 105 168 170 171 172 374 376 378 380 397 420 684 721 766 767 772 203 308 265 909 910")
  ),
  class = c("spec_tbl_df", "tbl_df", "tbl", "data.frame"),
  row.names = c(NA, -5L),
  spec = structure(
    list(cols = list(
      `Universal Type` = structure(
        list(),
        class = c("collector_character", "collector")),
      Items = structure(
        list(),
        class = c("collector_character",
                  "collector"))),
      default = structure(
        list(),
        class = c("collector_guess", "collector")),
      skip = 1L),
    class = "col_spec"
  )
) %>%
  make_cols_snake_case()

test_that("column_splitter", {
  ## This should be the total number of rows after cleaning the data
  target_rows <- sum(stringr::str_count(sample_data$items, " ") + 1)

  clean_data <-
    sample_data %>%
    dplyr::mutate(
      unnest_me =
        purrr::map(.x = items,
                   .f = column_splitter,
                   column_names = "object_id")
    ) %>%
    tidyr::unnest(unnest_me)  %>%
    dplyr::select(-items) %>%
    dplyr::mutate(object_id =
                    as.numeric(object_id))

  expect_equal(nrow(clean_data), target_rows)
})
