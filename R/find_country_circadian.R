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
#' @return A data frame with columns:
#'         \item{country}{The name of the country.}
#'         \item{predominant_clock}{The predominant circadian pattern ("Diurnal" or "Nocturnal").}
#' @examples
#' \dontrun{
#' country_species_data <- data.frame(country = c("USA", "Canada", "USA"),
#'                                    scrubbed_species_binomial = c("Species1", "Species2", "Species3"))
#' circadian_data <- data.frame(scrubbed_species_binomial = c("Species1", "Species2", "Species3"),
#'                              circadian_clock = c("Diurnal", "Nocturnal", "Diurnal"))
#' find_country_circadian_pattern(country_species_data, circadian_data)
#' }
#' @import dplyr
#' @export
find_country_circadian_pattern <- function(country_species_data, circadian_data) {
  
  # Ensure that all inputs are valid
  if (!all(c("country", "scrubbed_species_binomial") %in% colnames(country_species_data))) {
    stop("Error: 'country_species_data' must contain columns 'country' and 'scrubbed_species_binomial'.")
  }
  if (!all(c("scrubbed_species_binomial", "circadian_clock") %in% colnames(circadian_data))) {
    stop("Error: 'circadian_data' must contain columns 'scrubbed_species_binomial' and 'circadian_clock'.")
  }
  
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