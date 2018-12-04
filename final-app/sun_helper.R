library(data.table)
library(dplyr)

data <- data.table::fread("../data/survey_2016.csv") 

write_sunburst_data <- function(){
  data <- data.table::fread("../data/survey_2016.csv") 
  
  #took the data from colomn 49 to 63
  half_data <- data[,-1:-48]
  test_data2 <- half_data[, -2:-7]
  test_data3 <- test_data2[, -4:-5]
  final_data <- test_data3[, c(2,6,1,3,4,5,7)]
  
  #rename the header of the data for sunburst graph
  colnames(final_data) <- c("Age", "Position", "Mental Illness", "Gender", "Country of Resident", "Resident State", "Remotely")
  
  test <- gsub("-", " ", final_data$Position)
  final_data$Position <- gsub("-", " ", final_data$Position)
  

  final_sun <- final_data%>% 
    mutate(path = paste(`Position`, `Mental Illness`, Gender, `Country of Resident`,
                        `Resident State`, `Remotely`, sep="-")) %>% 
    dplyr::select(path, Age)
  
  write.csv(final_sun, file= "app-data/final_sun.csv", row.names = FALSE)
}

write_sunburst_data()

write_disorder_data <- function(){
  disorder <- c("Anxiety Disorder", "Mood Disorder", "Stress Response Syndromes", "Substance Use Disorder",
                                                "Attention Deficit Hyperactivity Disorder", "Pervasive Developmenta", "Personality Disorder",
                                                "Seasonal Affective Disorder", "Post-traumatic Stress Disorder", "Autism",
                                                "Traumatic Brain Injury", "Psychotic Disorder", "Eating Disorder")

  data_49 <- data[,49]
  colnames(data_49) <- "disorder"
  data_52 <- data[,52]
  colnames(data_52) <- "disorder"
  
  current_num <- c(sum(str_detect(data_49$disorder, "Anxiety Disorder")), sum(str_detect(data_49$disorder,"Mood Disorder")),
                 sum(str_detect(data_49$disorder, "Stress Response Syndromes")),sum(str_detect(data_49$disorder, "Substance Use Disorder")),
                 sum(str_detect(data_49$disorder, "Attention Deficit Hyperactivity Disorder")),sum(str_detect(data_49$disorder, "Pervasive Developmenta")),
                 sum(str_detect(data_49$disorder, "Personality Disorder")), sum(str_detect(data_49$disorder, "Seasonal Affective Disorder")),
                 sum(str_detect(data_49$disorder, "Post-traumatic Stress Disorder")), sum(str_detect(data_49$disorder, "Autism")),
                 sum(str_detect(data_49$disorder, "Traumatic Brain Injury")), sum(str_detect(data_49$disorder, "Psychotic Disorder")),
                 sum(str_detect(data_49$disorder, "Eating Disorder"))
)

  past_num <- c(sum(str_detect(data_52$disorder, "Anxiety Disorder")), sum(str_detect(data_52$disorder,"Mood Disorder")),
              sum(str_detect(data_52$disorder, "Stress Response Syndromes")),sum(str_detect(data_52$disorder, "Substance Use Disorder")),
              sum(str_detect(data_52$disorder, "Attention Deficit Hyperactivity Disorder")),sum(str_detect(data_52$disorder, "Pervasive Developmenta")),
              sum(str_detect(data_52$disorder, "Personality Disorder")), sum(str_detect(data_52$disorder, "Seasonal Affective Disorder")),
              sum(str_detect(data_52$disorder, "Post-traumatic Stress Disorder")), sum(str_detect(data_52$disorder, "Autism")),
              sum(str_detect(data_52$disorder, "Traumatic Brain Injury")), sum(str_detect(data_52$disorder, "Psychotic Disorder")),
              sum(str_detect(data_52$disorder, "Eating Disorder"))
)

  result <- data.frame(disorder, current_num, past_num)
  write.csv(result, file= "app-data/result_disorder.csv")
}

write_disorder_data()

