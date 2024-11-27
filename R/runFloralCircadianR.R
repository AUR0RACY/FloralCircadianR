#' Launch Shiny App for FloralCircadianR
#'
#' A function that launches the Shiny app for the FloralCircadianR package.
#' The app provides a user-friendly interactive interface for alignment and visulization
#' using functions from the FloralCircadianR package.
#'
#' @return No return value; launches a Shiny app in the browser.
#'
#' @examples
#' \dontrun{
#' FloralCircadianR::FloralCircadianR()
#' }
#'
#' @references
#' shiny: Web Application Framework for R. R package version 1.9.1, https://CRAN.R-project.org/package=shiny
#'
#' Silva, Anjali. TestingPackage. GitHub, https://github.com/anjalisilva/TestingPackage. Accessed 5 Nov. 2024. \href{https://shiny.rstudio.com/}{Link}
#'
#' @export
#' @importFrom shiny runApp

runFloralCircadianR <- function() {
  # Locate the Shiny app directory in the package
  appDir <- system.file("shiny-scripts", package = "FloralCircadianR")
  
  # Check if the directory exists
  if (appDir == "") {
    stop("Could not find Shiny app directory. Please ensure the 'shiny-scripts' folder exists in the LegitXMut package.")
  }
  
  # Run the Shiny app
  actionShiny <- shiny::runApp(appDir, display.mode = "normal")
  return(actionShiny)
}
# [END] written by Yue Chen