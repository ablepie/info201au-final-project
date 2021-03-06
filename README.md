# INFO201AU-FINAL-PROJECT

## Group members: April Zhao, Benjamin Shi, Chenxi Di, Satvik Vats.

### Please check the following links to see more information about our project.

* [The first draft of final project proposal](project-proposal.rmd)
* [The dataset we used in the study](https://www.kaggle.com/osmi/mental-health-in-tech-2016/version/1)
* [The shiny web application on server](https://benjamins.shinyapps.io/final-app/)
* [The shiny UI page](final-app/ui.R)
* [The shiny server page](final-app/server.R)

### The background of the study.
![](demo/mental_disorder.jpg)

* “Love and work are the cornerstones of our humanness.” Sigmund Freud was one of the first to recognize the connection between work and mental health. However, the ubiquitous globlization triggers the world-wide "race to the bottom". Providing a health workplace loses it's significance.
* The study guides us to take a close look in the IT industry. Exploring potential correlation between different factors in the workplace and mental disorder.

***

### The dataset and about.
![](demo/survey.png)

* The dataset used for this study is the work of [OSMI](https://osmihelp.org/). OSMI is a dedicated data source on mental illlness and disorder. Three survery were conducted on 2014, 2016 and 2017, focusing on the mental health in IT industry.
* The survey in 2016 is the most complete, diverse and reasonable dataset in all three surveys. It involves 1434 participants. Those participants were asked to answer up to 63 questions ranging from number of employees in the company to the age group.
  + [check out the full dataset](data/2016_survey.csv)
* After productive discussion, we decide to use the dataset in 2016 and drop off other surveys. We do this for two reasons.
  + Frist, the 2014 contains too less questions to generate a meaningful conclusion with rest of datasets.
  + Second, the 2017 survey contains a "biased" dataset. Most of the participants identify themselves as white male. After researching on the real-life demographic in 2017, we reach out the conclusion that the different is statistical significance and not to include this survey in this study.

***
### Conclusion and Discussion.
![](demo/brain.jpg)
* Mental disorder is normal and curable The data summary reveals that 92% of the participants find a enbracing/health workplace is desirable and helps them to focus on work.That explains why well-konwn Tech companys are dedicated to create a creation-provoking, healthy workplace.
* After thougtful analysis on the survey. We reach out following conclusions:
  + Back End Developer are most likely to have mental health problem. (16.4%) Front End Developer is the type of work position with second highest risk of mental health problem.
  + We study on the correlation between job position(back-end developer, front-end developer,etc), age and number of employees in the company. The result is included in [shiny web app](https://benjamins.shinyapps.io/final-app/).  
  + In the correlation/regression study no strong relationship was find between number of employee in the company/ participant's age/ job position. No regression can be further make. 
  + The statistical analysis has limits. If more advance regression model can be used to approximate the relationship between mental disorder and other variables, there might be non-linear, advanced relationship exists. 
  + Until the survey in 2016, the most common mental disorder are Mood Disorder and Anxiety Disorder. Besides, we found ADHD(Attention Deficit Hyperctivity Disorder) and PTSD(Post-traumatic Stress Disorder) are 3rd and 4th most common disorder.
* Ethical issues: We examined the mental health survey from OSMI(licensed under a Creative Commons Attribution-ShareAlike 4.0 International) data. The survey dataset is autonomous and anonymous, which follows Principles of research ethics.
* Concerns for bias:
  + First, the number of response is limited: only 1435 people reply the survey, only 997 of them answering yes or maybe when  asked if they have mental disorder. 
  + Second, Response bias exists and affects the accuracy. Since responsers may feel pressure to give answers that are not socially acceptable. Thus, further study will need more dataset to combine. More questions could be explored deeply.
  + Since the survey is voluntary. The participants of the survey were most likely have personal experience about mental disoder. That's to say, the porportion of participants who suffer mental disorder is higher then the real proportion. 

***
### Looking forward.
![](demo/help.png)
* Things you can do:
  - You can use following resource for information and help.
    - [National Alliance on Mental Illness](https://www.nami.org/stigmafreeco/resources)
    - [National Institution of Mental Health](https://www.nimh.nih.gov/health/find-help/index.shtml)
    - [The suicide pervention Lifeline](https://suicidepreventionlifeline.org/)
    - [Anxiety and Depression Association of America (ADAA)](https://adaa.org/)
    - [King county mental health support](https://www.kingcounty.gov/depts/community-human-services/mental-health-substance-abuse/services/mental-health.aspx)
* Use social media to help spread awareness and advocate for social change.
  - Know your rights.
    - [Brief Introduction to rights as an employee](https://employment.findlaw.com/employment-discrimination/employees-rights-101.html)
* Live in a health and active lifestyle.
