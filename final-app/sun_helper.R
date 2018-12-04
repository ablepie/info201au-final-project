library(data.table)
library(dplyr)


write_sunburst_data <- function(){
  data <- data.table::fread("../data/survey_2016.csv") 
  
  # Select the data columns for age, gender, work position, country/state they work in and whether remote work
  # if self-diagnosed with mental health
  final_data <- data[, c(56, 62, 49, 50, 57, 60, 61, 63)]
  
  # Rename the header of the data for sunburst graph
  colnames(final_data) <- c("Age", "Position", "Mental Illness", "Maybe Illness", "Gender", 
                            "Country of Resident", "Resident State", "Remotely")
  
  # Merge doubtless mentall illness and doubtful mental illness, both are self diagnosed 
  final_data <-
    final_data %>%
    mutate(`Mental Illness` = paste0(`Mental Illness`, `Maybe Illness`)) %>%
    filter(`Mental Illness` != "") %>%
    select(Age, Position, `Mental Illness`, Gender, `Country of Resident`, `Resident State`, Remotely)
  
  final_data$Position <- gsub("-", " ", final_data$Position)
  
  # Create path for sunburst
  final_sun <- 
    final_data %>% 
    mutate(path = paste(`Position`, `Mental Illness`, Gender, `Country of Resident`,
                        `Resident State`, `Remotely`, sep="-")) %>% 
    select(path, Age)
  
  write.csv(final_sun, file= "app-data/final_sun.csv", row.names = FALSE)
}

write_sunburst_data()

# Get sum for the passed disorder type in current self diagonise
get_current_sum <- function(illness) {
  has_illness <- str_detect(final_data$`Mental Illness`, illness)
  return(sum(has_illness))
}

# Get sum for the passed certain disorder type in past diagonise
get_past_sum <- function(illness) {
  has_illness <- str_detect(data$`If so, what condition(s) were you diagnosed with?`, illness)
  return(sum(has_illness))
}

write_disorder_data <- function(){
  # Based on the survey content, summarize all types of disorder
  disorder <- c("Anxiety Disorder", "Mood Disorder", "Stress Response Syndromes", "Substance Use Disorder",
                "Attention Deficit Hyperactivity Disorder", "Pervasive Developmenta", "Personality Disorder",
                "Seasonal Affective Disorder", "Post-traumatic Stress Disorder", "Autism",
                "Traumatic Brain Injury", "Psychotic Disorder", "Eating Disorder", "Obsessive-Compulsive Disorder",
                "Addictive Disorder", "Other", "Dissociative Disorder", "Psychotic Disorder")
  current_num <- vector("integer")
  for (i in 1:length(disorder)) {
    current_num[i] <- get_current_sum(disorder[i])
  }
  past_num <- vector("integer")
  for (i in 1:length(disorder)) {
    past_num[i] <- get_past_sum(disorder[i])
  }
  result <- data.frame(disorder, current_num, past_num)
  write.csv(result, file = "app-data/result_disorder.csv")
}

write_disorder_data()

