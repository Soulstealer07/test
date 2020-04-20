library(shiny)
library(ggplot2)
library(tidyverse)
library(scales)
library(plotly)
library(DT)


data("GasolinePrice")


if (interactive()) {
  library(shiny)
  library(DT)
  shinyApp(
    ui = fluidPage(fluidRow(column(12, DTOutput('tbl')))),
    server = function(input, output) {
      output$tbl = renderDT(
        GasolinePrice, options = list(lengthChange = FALSE)
      )
    }
  )
}

