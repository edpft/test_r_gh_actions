testthat::test_that(
  desc = "Script runs without error",
  code = 
    testthat::expect_error(
      source("test_r_gh_actions.R"),
      regexp = NA
    )
)
