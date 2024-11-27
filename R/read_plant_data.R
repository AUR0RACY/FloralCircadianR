#' Read plant circadian data from CSV
#'
#' This function reads a CSV file containing plant species and their circadian clock properties.
#' @param file_path The path to the CSV file with plant circadian data.
#' @return A data frame with columns:
#'         \itemize{
#'           \item `scrubbed_species_binomial`: The scientific name of each species.
#'           \item `circadian_clock`: The circadian property of each species ("Diurnal" or "Nocturnal").
#'         }.
#' @export
read_plant_circadian_data <- function(file_path) {
  
  # Check if file exists
  if (!file.exists(file_path)) {
    stop("Error: The specified file does not exist.")
  }
  
  # Read the CSV file
  circadian_data <- read.csv(file_path)

  # Ensure the circadian_clock column contains only "Diurnal" or "Nocturnal"
  valid_clocks <- c("Diurnal", "Nocturnal")
  if (!all(circadian_data$circadian_clock %in% valid_clocks)) {
    stop("The 'circadian_clock' column must contain only 'Diurnal' or 'Nocturnal' values.")
  }
  
  return(circadian_data)
}