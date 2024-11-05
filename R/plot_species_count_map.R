#' Plot Species Count by Country on a World Map
#'
#' This function takes a data frame with country and species information,
#' aggregates the species count per country, and plots it on a world map.
#' Each country is colored based on the number of species found, with blue
#' indicating fewer species and red indicating more species.
#'
#' @param country_species_data A data frame with at least two columns: 
#'        'country' and 'species'. 'country' should be the name of the 
#'        country, and 'species' should be the name of the plant species.
#' @return A ggplot object displaying a world map with countries colored 
#'         by species count.
#' @import dplyr
#' @import ggplot2
#' @export
plot_species_count_map <- function(country_species_data) {
  
  species_count_by_country <- country_species_data %>%
    dplyr::group_by(country) %>%
    dplyr::summarize(species_count = n_distinct(scrubbed_species_binomial))
  
  world_map <- map_data("world")
  
  #Plot the map with a color gradient from blue (least) to red (most)
  ggplot() +
    # Draw the base map
    geom_map(data = world_map, map = world_map,
             aes(x = long, y = lat, map_id = region),
             color = "gray70", fill = "white") +
    
    geom_map(data = species_count_by_country, map = world_map,
             aes(map_id = country, fill = species_count),
             color = "gray50") +
    
    #Color scale from blue (least) to red (most)
    scale_fill_gradient(low = "blue", high = "red", name = "Species Count") +
    
    labs(title = "Number of Plant Species Can be found in each Country",
         x = "Longitude", y = "Latitude") +
    theme_minimal()
}
