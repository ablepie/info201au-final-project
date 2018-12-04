
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
               h4("This shows the percentage of each observations in the survey,
                  from each job position, to what kind of disorder, to gender,
                  to which country, to state, to disorder frequency.")
             )
             ),
    tabPanel("Corr"),
    tabPanel("Ranking",
             sidebarPanel(
               radioButtons(
                 "current_past", "Choose to see most common mental illness in OSMI, 2016",
                 choices = list("Current" = "current_num", "Past" = "past_num"))
               )
             ),
             mainPanel(
               tabsetPanel(type = "tabs",
                           tabPanel("Plot",
                                    plotOutput("disorder")),
                           tabPanel("Summary"),
                           tabPanel("Table")
               )
             )
  )
)

