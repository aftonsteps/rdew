test_that("make_snake_case() removes capital letters", {
  expect_equal(object = make_snake_case(x_char = c("camelCase")),
               expected = c("camelcase"))
})

test_that("make_snake_case() replaces spaces with underscore", {
  expect_equal(object = make_snake_case(x_char = c("char with  spaces")),
               expected = c("char_with_spaces"))
})
