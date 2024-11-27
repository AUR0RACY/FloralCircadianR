#' Plot Dominant Circadian Pattern by Country on a World Map
#'
#' This function takes a data frame with country and circadian information,
#' and plots it on a world map.
#' Each country is colored based on nocturnal/diurnal, with blue
#' indicating nocturnal and yellow indicating diurnal.
#'
#' @param country_circadian_data A data frame with at least two columns: 
#'        \itemize{
#'          \item `country`: The name of the country.
#'          \item `predominant_clock`: The predominant circadian pattern ("Diurnal" or "Nocturnal").
#'        }
#' @return A ggplot object displaying a world map with countries colored 
#'         by species count.
#' @details This function overlays circadian pattern information onto a 
#'          world map using ggplot2. Countries without circadian pattern data 
#'          are displayed in white.
#' @import dplyr
#' @import ggplot2
#' @examples
#' \dontrun{
#' circadian_data <- data.frame(
#'   country = c("China", "Canada", "Brazil"),
#'   predominant_clock = c("Diurnal", "Nocturnal", "Diurnal")
#' )
#' plot_species_circadian_map(circadian_data)
#' }
#' @export
plot_species_circadian_map <- function(country_circadian_data) {
  
  # Ensure that all input data is valid
  if (!all(c("country", "predominant_clock") %in% colnames(country_circadian_data))) {
    stop("Error: 'country_circadian_data' must contain columns 'country' and 'predominant_clock'.")
  }
  
  world_map <- map_data("world")
  
  # Plot the world map with circadian patterns
  ggplot() +

    geom_polygon(data = world_map, aes(x = long, y = lat, group = group),
                 fill = "white", color = "gray70") +
    
    # Fill countries based on circadian pattern
    geom_map(data = country_circadian_data, map = world_map,
             aes(map_id = country, fill = predominant_clock),
             color = "gray50") +
    

    scale_fill_manual(values = c("Diurnal" = "yellow", "Nocturnal" = "blue"),
                      name = "Circadian Pattern") +
    
    # Labels and theme
    labs(title = "Global Distribution of Predominant Circadian Pattern by Country",
         x = "Longitude", y = "Latitude") +
    theme_minimal()
}
