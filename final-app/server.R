# The server.R file processes the dataset and gives informative
# visualization to the user. According to the dataset and user input,
# it can produce different visualization and description. 
library(shiny)
library(data.table)
library(dplyr)
library(tidyverse)
library(stringr)
library(sunburstR)
library(wordcloud2)

shinyServer(function(input, output) {
  # This render the sunburst
  output$sun <- renderSunburst({
    sun_data <- read.csv(file = "app-data/final_sun.csv")
    sunburst(sun_data, legend = FALSE)
})
  # This render word cloud to display frequency of each type of disorder in past and current
  output$disorder <- renderWordcloud2({
    disorder_data <- read.csv(file = "app-data/result_disorder.csv")
    text_data <- 
      disorder_data %>% 
      select(disorder, input$current_past) %>% # exclude disorder(Anxiety, Mood) to display better
      filter(disorder != "Mood Disorder" & disorder != "Anxiety Disorder") 
    wordcloud2(text_data, color = "random-light", size = 0.3, gridSize = 4, fontWeight = 600, rotateRatio = 0,
               backgroundColor = "transparent")
  })
  
  
})

