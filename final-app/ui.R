# The ui.R file processes regulates the display of the application.
# According to the dataset and user input,
# it can produce different visualization and layout 
# most of ui.R was writen in tags$ to nest html in the ui page
# that's because we find keep a seperate html file to source from makes 
# the code hard to trace. 
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
    tabPanel("Correlation",
             tags$div(class = "jumbotron", 
                      tags$h2("Summary about correlation.", class="text-primary"),
                      tags$div(
                        tags$ul(
                          tags$li("In the study about the connection between Mental illness and number of employees"),
                          tags$li("Multiple R-squared:  0.008306,	  Adjusted R-squared:  0.003956 "), 
                          tags$li("There is a weak positive relationship", class="text-primary"),
                          tags$li(tags$code("lm(formula = if_mental_disorder ~ number_of_employees, data = study_set)"))
                        ), 
                        tags$div(
                          tags$ul(
                            tags$li("In the study about the connection between Mental illness and number of age"),
                            tags$li("Multiple R-squared:  5.504e-05,	  Adjusted R-squared:  -0.000819 "), 
                            tags$li("There not likely any linear relationship between number of employee and mental disorder", class="text-primary")
                          )
                        ),
                          tags$div(
                            tags$ul(
                              tags$li("In the study about the connection between Mental illness and number of job position"),
                              tags$li("Multiple R-squared:  5.504e-05,	  Adjusted R-squared:  -0.000819 "), 
                              tags$li("There is a not likely any linear relationship between job position and mental disorder", class="text-primary")
                            )
                          )
                        )
                      ), 
             mainPanel(tags$div(class="panel panel-primary",
                                tags$div(class="panel-heading",
                                         tags$h3("Conclusion",class="panel-title")
                                ),
                                tags$div(
                                  tags$p("Supprisingly, none of the variables (number of employees in the company, the 
                                         position of the job or the age has convincing correlation/R-square value."),
                                  tags$p("However, comparing with other variables, the number of employee in the company
                                         has higher R-square and adjusted R-square value."),
                                  tags$p("After careful search, we think there reminds a possibility there is a non-linear
                                         relationship between number of employees and possibility of getting mental disorder")
                                  , class="panel-body")
             ))
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
                                   Attribution-ShareAlike 4.0 International) data. The survey dataset is autonomous and anonymous."), 
                           tags$ul(
                              tags$li(tags$a(href="https://osmihelp.org/", "Open Source Mental Illness.")),
                              tags$li("We found Back End Developer are most 
                                           likely to have mental health problem. (16.4%) Fron End Developer is the type of work 
                                           position with second highest risk of mental health problem."),
                               tags$li("By regression analysis, we found 
                                        there is no obvious relationship between age/job position/number of employees and mental
                                        diorder"),
                               tags$li("Limit exist in the statistical analysis. If more advanced model was applied to dataset
                                       we may find more convincing result.")
                               ),
                           tags$li("Until the survey in 2016, the most common mental disorder (self-diagonsed) are Mood Disorder and Anxiety Disorder. Besides, we found ADHD (Attention 
                                    Deficit Hyperctivity Disorder) and PTSD (Post-traumatic Stress Disorder) are 3rd and 4th most
                                   common disorder. However, there are some concerns for bias."),
                           tags$ul(
                             tags$li("First, the number of response is limited:
                                      only 1570 people reply the survey, only 997 of them answering yes or maybe when asked if they have mental
                                      disorder."),
                             tags$li("Second, Response bias exists and affects the accuracy. Since responsers may feel pressure to give answers
                                      that are socially acceptable. Thus, further study will need more dataset to combine. More questions
                                      could be explored deeply."),
                             tags$li("Since the survey is voluntary. The participants of the survey were most likely have personal experience 
                                      about mental disoder. That's to say, the porportion of participants who suffer mental disorder is higher
                                      then the real proportion. ")
                           ))
                         )
              ),
    
    # There are suggestions to the target audience. 
    tabPanel("Looking forward",
               tags$div(class = "jumbotron",
                 tags$h2("What we can do?", class="text-primary"),
                 tags$span("Mental disorder is normal and curable"),
                 tags$span("The data summary reveals that 92% of the participants find a enbracing/health workplace
                           is desirable and helps them to focus on work.That explains why well-konwn Tech companys
                           are dedicated  to create a creation-provoking, healthy workplace."),
                 tags$span(),
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