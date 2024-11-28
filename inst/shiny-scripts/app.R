
library(shiny)
library(dplyr)
library(ggplot2)

# Load FloralCircadianR functions
source("R/read_plant_data.R")
source("R/read_interested_country.R")
source("R/plot_species_count_map.R")
source("R/plot_species_circadian_map.R")
source("R/find_species_in_all_countries.R")
source("R/find_country_circadian.R")

# Define UI page
ui <- fluidPage(
  titlePanel("Floral Circadian Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      textAreaInput("countries", "Enter Countries (comma-separated):", 
                    placeholder = "Canada, France, Brazil"),
      fileInput("circadian_file", "Upload Circadian Pattern CSV File:",
                accept = c(".csv")),
      actionButton("submit", "Run Analysis"),
      
      # Informative message
      p(strong("Note:"), 
        "Please enter a list of countries and upload a valid circadian pattern CSV file. This analysis may take a few minutes. Do not close the window.")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Species Count Map", plotOutput("speciesCountPlot")),
        tabPanel("Circadian Pattern Map", plotOutput("circadianPatternPlot"))
      )
    )
  )
)

server <- function(input, output, session) {
  
  # Reactive container for results
  results <- reactiveValues(species_count_plot = NULL, circadian_pattern_plot = NULL)
  
  observeEvent(input$submit, {
    # Check if a circadian file is uploaded
    if (is.null(input$circadian_file)) {
      showNotification("Please upload a circadian pattern CSV file.", type = "error")
      return()
    }
    
    # Check if countries input is provided
    if (is.null(input$countries) || trimws(input$countries) == "") {
      showNotification("Please enter a list of countries.", type = "error")
      return()
    }
    
    # Process the country input
    country_list <- unlist(strsplit(input$countries, ","))
    
    # Trim whitespace around each country and remove empty entries
    country_list <- trimws(country_list)
    country_list <- country_list[country_list != ""]
    
    # Validate the resulting country list
    if (length(country_list) == 0) {
      showNotification("No valid countries provided. Please enter a list of countries.", type = "error")
      return()
    }
    
    # Fetch species data for the countries with error handling
    species_data <- tryCatch({
      fetch_species_for_countries(country_list)
    }, error = function(e) {
      # Catch the error from fetch_species_for_countries and show it as a notification
      showNotification(paste("Error in fetching species data:", e$message), type = "error")
      return(NULL)  # Return NULL if there's an error
    })
    
    # If species_data is NULL, stop processing
    if (is.null(species_data)) return()
    
    # Load the circadian pattern CSV
    circadian_data <- read.csv(input$circadian_file$datapath)
    if (nrow(circadian_data) == 0 || !all(c("scrubbed_species_binomial", "circadian_clock") %in% colnames(circadian_data))) {
      showNotification("Invalid circadian pattern file. Ensure it has 'scrubbed_species_binomial' and 'circadian_clock' columns.", type = "error")
      return()
    }
    
    # Generate the species count map
    species_count_plot <- plot_species_count_map(species_data)
    
    # Determine circadian pattern for each country
    circadian_pattern_data <- find_country_circadian_pattern(species_data, circadian_data)
    circadian_pattern_plot <- plot_species_circadian_map(circadian_pattern_data)
    
    # Save results
    results$species_count_plot <- species_count_plot
    results$circadian_pattern_plot <- circadian_pattern_plot
  })
  
  # Create Species Count Plot
  output$speciesCountPlot <- renderPlot({
    req(results$species_count_plot)
    results$species_count_plot
  })
  
  # Create Circadian Pattern Plot
  output$circadianPatternPlot <- renderPlot({
    req(results$circadian_pattern_plot)
    results$circadian_pattern_plot
  })
}

# Run the App
shinyApp(ui = ui, server = server)
