test_that("make_cols_snake_case() removes spaces and lowercases", {
  expect_equal(object =
                 make_cols_snake_case(x_data =
                                        data.frame("Space  Col" = c(1,2,3),
                                                   check.names = FALSE)),
               expected = data.frame(space_col = c(1,2,3)))
})

## TODO left off here with tests
