#' Read Interested Countries from CSV
#'
#' This function reads a CSV file containing a list of countries of interest.
#' @param file_path The path to the CSV file with the list of countries.
#' @return A character vector of country names.
#' @export
read_interested_countries <- function(file_path) {
  # Read the CSV file
  country_data <- read.csv(file_path)
  
  # Return country list as a character vector
  country_list <- unique(country_data$country)
  return(country_list)
}