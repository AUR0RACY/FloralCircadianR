#' Plot Species Count by Country on a World Map
#'
#' This function takes a data frame with country and species information,
#' aggregates the species count per country, and plots it on a world map.
#' Each country is colored based on the number of species found, with blue
#' indicating fewer species and red indicating more species.
#'
#' @param country_species_data A data frame with at least two columns: 
#'        \itemize{
#'          \item `country`: The name of the country.
#'          \item `scrubbed_species_binomial`: The scientific name of each species.
#'        }
#' @return A ggplot object displaying a world map with countries colored 
#'         by species count.
#' @details This function computes the number of unique species (`scrubbed_species_binomial`) 
#'          for each country and plots the data on a world map using a color gradient.
#'          Countries without any data are displayed in white.
#' @examples
#' \dontrun{
#' country_species_data <- data.frame(
#'   country = c("China", "Canada", "Brazil"),
#'   scrubbed_species_binomial = c("Species1", "Species2", "Species3")
#' )
#' plot_species_count_map(country_species_data)
#' }
#' @import dplyr
#' @import ggplot2
#' @export
plot_species_count_map <- function(country_species_data) {
  
  # Check if the input data is valid
  if (!all(c("country", "scrubbed_species_binomial") %in% colnames(country_species_data))) {
    stop("Error: 'country_species_data' must contain columns 'country' and 'scrubbed_species_binomial'.")
  }
  
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
