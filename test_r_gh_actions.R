## Don't save/load user workspace between sessions
# usethis::use_blank_slate(
#   scope = "project"
# )

## Tell Git to ignore files
# usethis::use_git_ignore(
#   ignores = c("*.rds", "*.RData", "*.csv", "*.xls*")
# )

## 
# usethis::edit_r_profile(
#   scope = "user"
# )

## Create and retrieve a GitHub personal access token
# usethis::browse_github_pat()
# 
# usethis::edit_r_environ(
#   scope = "user"
# )

# usethis::edit_git_config(
#   scope = "user"
# )

# usethis::use_git_config(
#   scope = "user"
# )

# credentials <-
#   git2r::cred_user_pass(
#     username = "edpft",
#     password = usethis::github_token()
#   )

# usethis::use_git_credentials(
#   credentials = credentials
# )

# usethis::use_test(
#   name = "test_r_gh_actions"
# )

# load libraries ---------------------------------------------------------------

library(magrittr)

# read file ---------------------------------------------------------------

raw <-
  readr::read_csv(
    file = "http://data.defra.gov.uk/env/scptb01-carbon-footprint-1990to2009.csv",
    skip = 13,
    n_max = 2
  )

# transform ---------------------------------------------------------------

processed <-
  raw %>%
  tidyr::pivot_longer(
    cols = -X1,
    names_to = "year",
  ) %>%
  tidyr::drop_na(value) %>%
  dplyr::rename(
    measure = X1
  )

# save data ---------------------------------------------------------------

saveRDS(
  processed,
  file = glue::glue("{ getwd() }/test.csv")
)
