% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_species_in_all_countries.R
\name{fetch_species_for_countries}
\alias{fetch_species_for_countries}
\title{Fetch plant species data for each country in the provided list}
\usage{
fetch_species_for_countries(country_list)
}
\arguments{
\item{country_list}{A character vector of country names.}
}
\value{
A data frame with columns \code{country} and \code{species}, containing all plant species
found in each country.
}
\description{
This function retrieves all plant species for each country in the specified list
using the BIEN database.
}
