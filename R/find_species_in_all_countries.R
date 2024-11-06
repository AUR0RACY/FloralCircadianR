#' Fetch plant species data for each country in the provided list
#'
#' This function retrieves all plant species for each country in the specified list
#' using the BIEN database.
#' @param country_list A character vector of country names.
#' @return A data frame with columns `country` and `species`, containing all plant species
#'         found in each country.
#' @import BIEN
#' @export
fetch_species_for_countries <- function(country_list) {
# Initialize an empty list to hold data for each country
all_data <- lapply(country_list, function(country) {
  # Retrieve species data for the current country
  species_data <- BIEN::BIEN_list_country(country)
  
  # Add a 'country' column to keep track of each country's species
  species_data$country <- country
  
  return(species_data)
})

# Combine all country data into one data frame
combined_data <- do.call(rbind, all_data)
return(combined_data)
}
