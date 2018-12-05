# This file contains operation and function that help me to process
# the dataset and draw visualization about linear regression and correltion 
# between variables (number of employees in the company, age, gender etc.)
# and likelihood of mental disorder. 


# The function takes no parameter and process the mental health survey in 2016
to_study_subset <- function() {
  # read in sepecfic lines of data.
  sep_2016 <- data.table::fread("../data/survey_2016.csv") 
  study_set <- sep_2016[, c(2, 62, 49, 57, 63)]
  colnames(study_set) <- c("number", "position", "condition", "Gender", "Remotely")
  
  # remove the big dataset to save space. 
  remove(sep_2016)
  
  # data wrapping convert categorical data to numerical data on
  # specified scale in order to study correlation. 
  study_set$position <- gsub("-", " ", study_set$position)
  
  # output the subset to data directroy
  write.csv(study_set, file= "../final-app/app-data/study_set.csv", row.names = FALSE)
}

# function call 
to_study_subset()
