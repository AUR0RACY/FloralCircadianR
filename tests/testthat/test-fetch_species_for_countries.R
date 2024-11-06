library(testthat)
library(FloralCircadianR)

test_that("fetch_species_for_countries returns a data frame", {
  country_list <- c("Canada", "Brazil")
  result <- fetch_species_for_countries(country_list)
  
  expect_s3_class(result, "data.frame")
  expect_named(result, c("country", "scrubbed_species_binomial"))
})
