test_that("elements equal to value arg are NA", {
  expect_equal(convert_to_na(x = c(1,2,3,4),
                             value = 4),
               c(1,2,3,NA))
})
