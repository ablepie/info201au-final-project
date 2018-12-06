# This file contains operation and function that help me to process
# the dataset and draw visualization about linear regression and correltion 
# between variables (number of employees in the company, age, gender etc.)
# and likelihood of mental disorder. 
library(ggplot2)
library(data.table)
library(dplyr)
library(devtools)

# The function takes no parameter and process the mental health survey in 2016
to_study_subset <- function() {
  # read in sepecfic lines of data.
  survey_2016 <- data.table::fread("../data/survey_2016.csv") 
  study_set <- survey_2016[, c(2, 56, 62, 48, 49, 57)]
  colnames(study_set) <- c("number","age", "position","ill", "condition", "gender")
  study_set <- invisible(study_set %>% filter(`ill` != "", `age` != "", `position` != "", `number` != ""))
  
  # remove the big dataset to conserve memor
  remove(survey_2016)
  
  # data wrapping convert categorical data to numerical data on
  # specified scale in order to study correlation. 
  # it loop through the dataset and process each column
  for (row in 1:nrow(study_set)){
    convert_position  <- study_set[row, "position"]
    convert_number <- study_set[row, "number"]
    if_dis <- study_set[row, "ill"]
    
    
    # convert the work position into numerical data
    if(convert_position == "Back-end Developer" | convert_position == "DevOps"){
      study_set[row, "position"] <- 1
    } else if (convert_position == "Front-end Developer" | convert_position == "Designer") {
      study_set[row, "position"] <- 2
    } else if (convert_position == "Team Lead" |
               convert_position == "Supervisor" |
               convert_position == "Executive Leadership"){
      study_set[row, "position"] <- 3
    } else {
      study_set[row, "position"] <- 4
    }
    
    # convert variable to show if the participant has mental disorder
    # if the participant has mental disorder, convert it to numerical value
    # otherwise convert it to zero. 
    if(if_dis == "Yes"){
      study_set[row, "ill"] <- 100
    } else {
      study_set[row, "ill"] <- 0
    }

    if(convert_number == "6-25"){
      study_set[row, "number"] <- 1
    }else if(convert_number == "26-100"){
      study_set[row, "number"] <- 2
    } else if(convert_number == "100-500"){
      study_set[row, "number"] <- 3
    } else if(convert_number == "500-1000"){
      study_set[row, "number"] <- 4
    } else if(convert_number == "More than 1000"){
        study_set[row, "number"] <- 5
    } else {
      study_set[row, "number"] <- "invalid"
    }
  }
  
  # output the subset to data directroy
  write.csv(study_set, file= "../final-app/app-data/study_set.csv", row.names = FALSE)
  return(study_set)
}

# function call.
study_subset <- to_study_subset()

# test on correltaion between age and likelihood of mental illness. 
linearMod_1 <- lm(ill ~ age, data=study_set)
summary(linearMod)

# test on correltaion between position and likelihood of mental illness. 
linearMod_2 <- lm(ill ~ position, data=study_set)
summary(linearMod_2)

# test on correltaion between number of employees and likelihood of mental illness. 
linearMod_3 <- lm(ill ~ number, data=study_set)
summary(linearMod_3)

