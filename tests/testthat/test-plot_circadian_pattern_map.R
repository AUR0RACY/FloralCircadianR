library(testthat)
library(FloralCircadianR)

test_that("plot_circadian_pattern_map returns a ggplot object", {
  country_circadian_pattern <- data.frame(country = c("Canada", "Brazil"), predominant_clock = c("Diurnal", "Nocturnal"))
  plot <- plot_species_circadian_map(country_circadian_pattern)
  
  expect_s3_class(plot, "ggplot")
})

