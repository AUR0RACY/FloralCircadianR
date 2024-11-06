#' Find Predominant Circadian Pattern for Each Country
#'
#' This function calculates the predominant circadian pattern (diurnal or nocturnal)
#' for each country based on the list of species found in each country and the circadian
#' clock data for each species.
#'
#' @param country_species_data A data frame with columns `country` and `species`.
#'        Each row represents a species found in a country.
#' @param circadian_data A data frame with columns `species` and `circadian_clock`,
#'        where `circadian_clock` indicates whether the species is "Diurnal" or "Nocturnal".
#' @return A data frame with columns `country` and `predominant_clock`, indicating
#'         the predominant circadian pattern for each country.
#' @import dplyr
#' @export
find_country_circadian_pattern <- function(country_species_data, circadian_data) {
  
  merged_data <- country_species_data %>%
    left_join(circadian_data, by = "scrubbed_species_binomial")
  # Git rid to NA
  merged_data <- na.omit(merged_data)
  
  #  Count diurnal and nocturnal species for each country
  country_summary <- merged_data %>%
    group_by(country, circadian_clock) %>%
    summarize(count = n()) %>%
    group_by(country) %>%
    summarize(predominant_clock = circadian_clock[which.max(count)])
  
  return(country_summary)
}