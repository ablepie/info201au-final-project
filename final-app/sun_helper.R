library(data.table)
library(dplyr)

setwd("/Users/april/Desktop/git_pratice/info201au-final-project")

write_sunburst_data <- function(){
  data <- data.table::fread("data/survey_2016.csv") 
  
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
  
  write.csv(final_sun, file= "final-app/data/final_sun.csv", row.names = FALSE)
}

write_sunburst_data()
