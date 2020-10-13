testthat::test_that(
  desc = "Script runs without error",
  code = 
    testthat::expect_error(
      source("/home/rstudio/repos/test_r_gh_actions/test_r_gh_actions.R"),
      regexp = NA
    )
)
