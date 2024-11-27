#' Read Interested Countries from CSV
#'
#' This function reads a CSV file containing a list of countries of interest.
#' @param file_path The path to the CSV file with the list of countries.
#' @return A character vector of country names.
#' @examples
#' \dontrun{
#' country_list <- read_interested_countries("data/test_country_list.csv")
#' print(country_list)
#' }
#' @export
read_interested_countries <- function(file_path) {
  
  # Check if file exists
  if (!file.exists(file_path)) {
    stop("Error: The specified file does not exist.")
  }
  
  # Read the CSV file
  country_data <- read.csv(file_path)
  
  # Check if 'country' column exists
  if (!"country" %in% colnames(country_data)) {
    stop("Error: The file must contain a column named 'country'.")
  }
  
  # Return country list as a character vector
  country_list <- unique(country_data$country)
  return(country_list)
}