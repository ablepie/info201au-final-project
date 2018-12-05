library(shiny)
library(shinythemes)
library(sunburstR)
library(shinydashboard)
library(wordcloud2)
library(sunburstR)
shinyUI(
  navbarPage(
    theme = shinytheme("superhero"),
    title = "Mental Health in Tech industry",
    tabPanel("Ring", 
              sunburstOutput("sun", width = "100%", height = "500px"),
              sidebarPanel(
                h4("This shows the percentage of each observations in the survey,
                  from each job position, to what kind of disorder, to gender,
                  to which country, to state, to disorder frequency.")
                )
              ),
    tabPanel("Regression"),
    tabPanel("Rankings",
             sidebarPanel(
               radioButtons(
                 "current_past", "Choose to see most common mental illness in OSMI, 2016. (exclude Anxiety
                 and Mood disorder here)", choices = list("Current" = "current_num", "Past" = "past_num")
               )
             ),
             mainPanel(wordcloud2Output("disorder", width = "100%", height = "500px")
             )
             ),
    tabPanel("Conclusion", 
              mainPanel(
                tags$div(
                         tags$p("There are what we find from the dataset"),
                         tags$br(),
                         tags$img(src = "https://www.njartscouncil.org/wp-content/uploads/2018/04/getgwtgw.jpg", height = 400, align = "top"),
                         tags$br(),
                         tags$ol(
                           tags$li("We examined the mental health survey from OSMI (licensed under a Creative Commons 
                                   Attribution-ShareAlike 4.0 International) data. The survey dataset is autonomous and anonymous, 
                                   which follows Principles of research ethics."),
                           tags$ul(
                              tags$li("We found Back End Developer are most 
                                           likely to have mental health problem. (16.4%) Fron End Developer is the type of work 
                                           position with second highest risk of mental health problem."),
                               tags$li("By regression analysis, we found 
                                           there is no obvious relationship between working location and risk of self-diagonsed mental 
                                           health problem.")
                                ),
                           tags$li("Until the survey in 2016, the most common mental disorder (self-diagonsed) are Mood Disorder and Anxiety Disorder. Besides, we found ADHD(Attention 
                                    Deficit Hyperctivity Disorder) and PTSD(Post-traumatic Stress Disorder) are 3rd and 4th most
                                   common disorder. However, there are some concerns for bias."),
                           tags$ul(
                             tags$li("First, the number of response is limited:
                                      only 1570 people reply the survey, only 997 of them answering yes or maybe when asked if they have mental
                                      disorder. The limited response and unanswer rate makes the data not very representative."),
                             tags$li("Second, Response bias exists and affects the accuracy. Since responsers may feel pressure to give answers
                                      that are socially acceptable. Thus, further study will need more dataset to combine. More questions
                                      could be explored deeply.")
                           )
                         )
                         )
                )
              ),
    tabPanel("Look forward",
             mainPanel(
               tags$div(
                 tags$h2("What we can do?"),
                 tags$span("Mental disorder is normal and curable"),
                 tags$ol(
                   tags$li("You can use following resource for information and help."),
                   tags$ul(
                     tags$li(tags$a(href="https://www.nami.org/stigmafreeco/resources", "National Alliance on Mental Illness")),
                     tags$li(tags$a(href="https://www.nimh.nih.gov/health/find-help/index.shtml", "National Institution of Mental Health")),
                     tags$li(tags$a(href="https://suicidepreventionlifeline.org/", "The suicide pervention Lifeline")),
                     tags$li(tags$a(href="https://adaa.org/", "Anxiety and Depression Association of America (ADAA)")),
                     tags$li(tags$a(href="https://www.kingcounty.gov/depts/community-human-services/mental-health-substance-abuse/services/mental-health.aspx",
                                    "[King county mental health support"))
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
             )# making conslusion about the study. 
          )
)