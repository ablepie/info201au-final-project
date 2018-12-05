# The ui.R file processes regulates the display of the application.
# According to the dataset and user input,
# it can produce different visualization and layout 
library(shiny)
library(shinythemes)
library(sunburstR)
library(shinydashboard)
library(wordcloud2)
library(sunburstR)

shinyUI(
  navbarPage(
    theme = shinytheme("superhero"), # Apply the shiny them 
    title = "Mental Health in Tech industry",
    
    # The first tab is dedicated to a visualization of dataset. 
    # it shows every participants of the survey in proportion to 
    # the quesitons. 
    tabPanel("Ring", 
             # Nest a penal box in the sidebar
             sidebarPanel(
               tags$div(class="panel panel-primary",
                      tags$div(class="panel-heading",
                               tags$h3("Rankings",class="panel-title")
                      ),
                      tags$div("Click on the interactive ring to explore the dataset.", class="panel-body")
              )),
              mainPanel(sunburstOutput("sun", width = "100%", height = "600px")) # visz
              ),
    
    # The second tab is dedicated to a linear regression and correlation study. 
    # Some variations of the dataset were exame to test if it contribute the likelihood 
    # of mental disorder. 
    tabPanel("Regression",
             tags$div(class = "jumbotron", 
                      tags$h1("Jumbotron"),
                      tags$p(tags$a("Learn more", class='btn btn-primary btn-lg'))
             )
             # render the chart or graph here.
             ),
    
    # The third tab is a ranking a most common disorders. 
    tabPanel("Rankings",
             sidebarPanel(
               tags$div(class="panel panel-primary",
                 tags$div(class="panel-heading",
                   tags$h3("Rankings",class="panel-title")
                 ),
                 tags$div("Choose to see most common mental illness in OSMI, 2016. (exclude Anxiety and Mood disorder here)", class="panel-body")
               ),
               radioButtons(
                 "current_past", " ", choices = list("Current shift to the most common disorder in 2016" = "current_num", "Past shift to the most the participants used to have" = "past_num")
               )
             ),
             mainPanel(wordcloud2Output("disorder", width = "100%", height = "500px")
             )
             ),
    
    # The fourth tab is some observaton and conclusion about the dataset. 
    tabPanel("Conclusion", 
                tags$div(class = "jumbotron", 
                         tags$h2("There are what we find from the dataset", class="text-primary"),
                         tags$ol(
                           tags$li("We examined the mental health survey from OSMI (licensed under a Creative Commons 
                                   Attribution-ShareAlike 4.0 International) data. The survey dataset is autonomous and anonymous, 
                                   which follows Principles of research ethics."), 
                           tags$ul(
                              tags$li(tags$a(href="https://osmihelp.org/", "Open Source Mental Illness.")),
                              tags$li("We found Back End Developer are most 
                                           likely to have mental health problem. (16.4%) Fron End Developer is the type of work 
                                           position with second highest risk of mental health problem."),
                               tags$li("By regression analysis, we found 
                                           there is no obvious relationship between working location and risk of self-diagonsed mental 
                                           health problem.")
                                ),
                           tags$li("Until the survey in 2016, the most common mental disorder (self-diagonsed) are Mood Disorder and Anxiety Disorder. Besides, we found ADHD (Attention 
                                    Deficit Hyperctivity Disorder) and PTSD (Post-traumatic Stress Disorder) are 3rd and 4th most
                                   common disorder. However, there are some concerns for bias.", class="text-warning"),
                           tags$ul(
                             tags$li("First, the number of response is limited:
                                      only 1570 people reply the survey, only 997 of them answering yes or maybe when asked if they have mental
                                      disorder. The limited response and unanswer rate makes the data not very representative."),
                             tags$li("Second, Response bias exists and affects the accuracy. Since responsers may feel pressure to give answers
                                      that are socially acceptable. Thus, further study will need more dataset to combine. More questions
                                      could be explored deeply.")
                           ))
                         )
              ),
    
    # There are suggestions to the target audience. 
    tabPanel("Look forward",
               tags$div(class = "jumbotron",
                 tags$h2("What we can do?", class="text-primary"),
                 tags$span("Mental disorder is normal and curable"),
                 tags$ol(
                   tags$li("You can use following resource for information and help."),
                   tags$ul(
                     tags$li(tags$a(href="https://www.nami.org/stigmafreeco/resources", "National Alliance on Mental Illness")),
                     tags$li(tags$a(href="https://www.nimh.nih.gov/health/find-help/index.shtml", "National Institution of Mental Health")),
                     tags$li(tags$a(href="https://suicidepreventionlifeline.org/", "The suicide pervention Lifeline")),
                     tags$li(tags$a(href="https://adaa.org/", "Anxiety and Depression Association of America (ADAA)")),
                     tags$li(tags$a(href="https://www.kingcounty.gov/depts/community-human-services/mental-health-substance-abuse/services/mental-health.aspx",
                                    "King county mental health support"))
                   ),
                   tags$li("Use social media to help spread awareness and advocate for social change."),
                   tags$li("Know your rights."),
                   tags$ul(
                     tags$li(tags$a(href = "https://employment.findlaw.com/employment-discrimination/employees-rights-101.html",
                                    "Brief Introduction to rights as an employee"))
                   ),
                   tags$li("Live in a health and active lifestyle.")
                 )
               )
             )
          )
)