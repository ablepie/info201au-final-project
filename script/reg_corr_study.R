# This file contains operation and function that help me to process
# the dataset and draw visualization about linear regression and correltion 
# between variables (number of employees in the company, age, gender etc.)
# and likelihood of mental disorder. 
setwd("/Users/benjaminshi/Desktop/FALL 2018/INFO 201/WEEK 10/info201au-final-project/data/")
sep_2016 <- data <- data.table::fread("../data/survey_2016.csv") 

# The function takes no parameter and process the mental health survey in 2016
to_study_subset() <- function(){
  # read in sepecfic lines of data
  study_set <- sep_2016[, c(2, 62, 49, 50, 57, 60, 61, 63)]
  
  # remove the big dataset to save space. 
  remove(sep_2016)
  
  
}

