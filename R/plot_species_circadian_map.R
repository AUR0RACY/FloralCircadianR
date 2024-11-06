#' Plot Dominant Circadian Pattern by Country on a World Map
#'
#' This function takes a data frame with country and circadian information,
#' and plots it on a world map.
#' Each country is colored based on nocturnal/diurnal, with blue
#' indicating nocturnal and yellow indicating diurnal.
#'
#' @param country_circadian_data A data frame with at least two columns: 
#'        'country' and 'predominant_clock'. 'country' should be the name of the 
#'        country, and 'predominant_clock' should be the circadian pattern.
#' @return A ggplot object displaying a world map with countries colored 
#'         by species count.
#' @import dplyr
#' @import ggplot2
#' @export
plot_species_circadian_map <- function(country_circadian_data) {
  
  world_map <- map_data("world")
  
  # Plot the world map with circadian patterns
  ggplot() +

    geom_map(data = world_map, map = world_map,
             aes(x = long, y = lat, map_id = region),
             color = "gray70", fill = "white") +
    
    # Fill countries based on circadian pattern
    geom_map(data = country_circadian_pattern, map = world_map,
             aes(map_id = country, fill = predominant_clock),
             color = "gray50") +
    

    scale_fill_manual(values = c("Diurnal" = "yellow", "Nocturnal" = "blue"),
                      name = "Circadian Pattern") +
    
    # Labels and theme
    labs(title = "Global Distribution of Predominant Circadian Pattern by Country",
         x = "Longitude", y = "Latitude") +
    theme_minimal()
}
