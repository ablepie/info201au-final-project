library(shiny)
library(data.table)
library(dplyr)
library(tidyverse)
library(stringr)
library(sunburstR)

setwd("/Users/april/Desktop/git_pratice/info201au-final-project")

shinyServer(function(input, output) {
   
  output$sun <- renderSunburst({
    sun_data <- read.csv(file = "final-app/app-data/final_sun.csv")
    sunburst(sun_data, legend = FALSE)
})

})
