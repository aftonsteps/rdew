test_that("input checking on all_joja_cols works", {
  expect_error(calc_seed_prices(all_joja_cols = "boba"))
  expect_error(calc_seed_prices(all_joja_cols = 42))
})

test_that("input checking on joja_member works", {
  expect_error(calc_seed_prices(all_joja_cols = FALSE,
                                joja_member = "boba"))
  expect_error(calc_seed_prices(all_joja_cols = FALSE,
                                joja_member = 42))
})

## rdew::seeds_object_information is missing
# test_that("warning on non-standard joja_member when all_joja_cols == TRUE works", {
#   expect_warning(calc_seed_prices(all_joja_cols = TRUE,
#                                   joja_member = "boba"))
#   expect_warning(calc_seed_prices(all_joja_cols = TRUE,
#                                   joja_member = 42))
# })

# test_that("both joja cols are returned when all_joja_cols == TRUE", {
#   expect_true("purchased_price_joja_with_membership" %in%
#                 colnames(calc_seed_prices(all_joja_cols = TRUE)))
#   expect_true("purchased_price_joja_no_membership" %in%
#                 colnames(calc_seed_prices(all_joja_cols = TRUE)))
#   expect_false("purchased_price_joja" %in%
#                 colnames(calc_seed_prices(all_joja_cols = TRUE)))
# })

# test_that("one joja col is returned when all_joja_cols == FALSE", {
#   expect_false("purchased_price_joja_with_membership" %in%
#                  colnames(calc_seed_prices(all_joja_cols = FALSE)))
#   expect_false("purchased_price_joja_no_membership" %in%
#                  colnames(calc_seed_prices(all_joja_cols = FALSE)))
#   expect_true("purchased_price_joja" %in%
#                  colnames(calc_seed_prices(all_joja_cols = FALSE)))
# })

# test_that("correct col returned when all_joja_cols == FALSE & joja_member = FALSE", {
#   comp <- calc_seed_prices(all_joja_cols = TRUE)
#   expect_equal(comp$purchased_price_joja_no_membership,
#                calc_seed_prices(all_joja_cols = FALSE,
#                                 joja_member = FALSE)$purchased_price_joja)
# })

# test_that("correct col returned when all_joja_cols == FALSE & joja_member = TRUE", {
#   comp <- calc_seed_prices(all_joja_cols = TRUE)
#   expect_equal(comp$purchased_price_joja_with_membership,
#                calc_seed_prices(all_joja_cols = FALSE,
#                                 joja_member = TRUE)$purchased_price_joja)
# })
