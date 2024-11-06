#' Read plant circadian data from CSV
#'
#' This function reads a CSV file containing plant species and their circadian clock properties.
#' @param file_path The path to the CSV file with plant circadian data.
#' @return A data frame with columns `species` and `circadian_clock`(nocturnal/diurnal).
#' @export
read_plant_circadian_data <- function(file_path) {
  # Read the CSV file
  circadian_data <- read.csv(file_path)

  # Ensure the circadian_clock column contains only "Diurnal" or "Nocturnal"
  valid_clocks <- c("Diurnal", "Nocturnal")
  if (!all(circadian_data$circadian_clock %in% valid_clocks)) {
    stop("The 'circadian_clock' column must contain only 'Diurnal' or 'Nocturnal' values.")
  }
  
  return(circadian_data)
}