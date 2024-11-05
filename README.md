<!-- README.md is generated from README.Rmd. Please edit that file -->

# FloralCircadianR

Flowering Plants Circadian Rhythms Analysis and Visualization Toolkit

## Description

FloralCircadianR is an R package designed for analyzing and visualizing
the circadian rhythms of flowering plants, including distribution, bloom
times, closure times, and their interactions with pollinators.

It was built as an R package, and was developed as a part of a course
project for [BCB410H1: Applied
Bioinformatics](https://artsci.calendar.utoronto.ca/course/bcb410h1)
during the Fall 2024 semester at the University of Toronto.

The `FloralCircadianR` package was developed using
`R version 4.2.2 (2022-10-31)`,
`Platform: x86_64-w64-mingw32/x64 (64-bit)` and
`Running under: Microsoft Windows 11 23H2`.

## Installation

To install the latest development version of FloralCircadianR, run the
following code in R:

    install.packages("devtools")
    library("devtools")
    devtools::install_github("AUR0RACY/FloralCircadianR", build_vignettes = TRUE)
    library("FloralCircadianR")

To run the Shiny app:

    runFloralCircadianR()

## Overview

Provide the following commands, customized to your R package. Then
provide a list of user accessible functions within the package and a
brief description of each. Include one image illustrating the overview
of the package that shows the inputs and outputs. Ensure the image is
deposited in the correct location, as discussed in class. Point the user
to vignettes for a tutorial of your package. <br> <br> <br>

    ls("package:FloralCircadianR")
    data(package = "FloralCircadianR") 
    browseVignettes("FloralCircadianR")

## Contributions

Provide a paragraph clearly indicating the name of the author of the
package and contributions from the author. Outline contributions from
other packages/sources for each function. Outline contributions from
generative AI tool(s) for each function. Include how the tools were used
and how the results from AI tools were incorporated. Remember your
individual contributions to the package are important.

The author of the package is Yue Chen.

## References

Provide full references for all sources used, including for the packages
and tools mentioned under ‘Contributions’, in one format.

## Acknowledgements

This package was developed as part of an assessment for 2024 BCB410H:
Applied Bioinformatics course at the University of Toronto, Toronto,
CANADA. `FloralCircadianR` welcomes issues, enhancement requests, and
other contributions. To submit an issue, use the [GitHub
issues](https://github.com/AUR0RACY/FloralCircadianR/issues). Many
thanks to those who provided feedback to improve this package.
