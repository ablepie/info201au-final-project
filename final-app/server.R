library(shiny)
library(data.table)
library(dplyr)
library(tidyverse)
library(stringr)
library(sunburstR)
library(wordcloud2)
shinyServer(function(input, output) {
   
  output$sun <- renderSunburst({
    sun_data <- read.csv(file = "app-data/final_sun.csv")
    sunburst(sun_data, legend = FALSE)
})

  output$disorder <- renderWordcloud2({
    disorder_data <- read.csv(file = "app-data/result_disorder.csv")
    text_data <- disorder_data %>% 
      select(disorder, input$current_past)
      wordcloud2(text_data, color = "random-light", size = 1, gridSize = 1, fontWeight = 600,
               backgroundColor = "transparent")
  })
})

