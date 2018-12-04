library(shiny)
library(data.table)
library(dplyr)
library(tidyverse)
library(stringr)
library(sunburstR)

shinyServer(function(input, output) {
   
  output$sun <- renderSunburst({
    sun_data <- read.csv(file = "app-data/final_sun.csv")
    sunburst(sun_data, legend = FALSE)
})
  output$disorder <- renderPlot({
    disorder_data <- read.csv(file = "app-data/result_disorder.csv")
    ggplot(result, aes(label = disorder, size = current_num, 
                       color = factor(sample.int(10, nrow(result), replace = TRUE)))) +
      geom_text_wordcloud() +
      theme_minimal()
  })

})
