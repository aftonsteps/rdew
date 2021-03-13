test_that("parens are removed from column names", {
  test_data <-
    data.frame(goodcol = c(1,2,3),
               "bad_col(has_parens)" = c(4,5,6),
               check.names = FALSE)
  test_data <- remove_parens_from_colnames(test_data)
  expect_equal(colnames(test_data), c("goodcol", "bad_colhas_parens"))
})
