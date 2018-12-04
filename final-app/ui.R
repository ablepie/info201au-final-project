

library(shiny)
library(shinythemes)
library(sunburstR)
library(shinydashboard)

shinyUI(
  navbarPage(
    theme = shinytheme("superhero"),
    title = "Analysis of OSMI Mental Health in Tech Survey",
    tabPanel("Cool", 
             sunburstOutput("sun", width = "100%", height = "500px"),
             sidebarPanel(
               h4("hi")
             )
             ),
    tabPanel("Corr"),
    tabPanel("Ranking")
  )
  )
