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
    wordcloud2(text_data, color = "random-light", size = 0.2, gridSize = 4, fontWeight = 400,
               backgroundColor = "transparent")
  })
  
  # This render text output for discussion of our current analysis
  output$discussion <- renderText({
    paste0("We examined the mental health survey from OSMI(licensed under a Creative Commons 
           Attribution-ShareAlike 4.0 International) data. The survey dataset is autonomous and anonymous, 
           which follows Principles of research ethics. We found Back End Developer are most 
           likely to have mental health problem. (16.4%) Fron End Developer is the type of work 
           position with second highest risk of mental health problem. By regression analysis, we found 
           there is no obvious relationship between working location and risk of self-diagonsed mental 
           health problem. Until the survey in 2016, the most common mental disorder(self-diagonsed) are Mood Disorder and Anxiety Disorder. Besides, we found ADHD(Attention 
           Deficit Hyperctivity Disorder) and PTSD(Post-traumatic Stress Disorder) are 3rd and 4th most
           common disorder. However, there are some concerns for bias. First, the number of response is limited:
           only 1570 people reply the survey, only 997 of them answering yes or maybe when asked if they have mental
           disorder. The limited response and unanswer rate makes the data not very representative. Second.
           Response bias exists and affects the accuracy. Since responsers may feel pressure to give answers
           that are socially acceptable. Thus, further study will need more dataset to combine. More questions
           could be explored deeply.")
  })
})

