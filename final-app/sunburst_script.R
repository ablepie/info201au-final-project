data <- data.table::fread("data/survey_2016.csv") 

#took the data from colomn 49 to 63
test_data1 <- data[,-1:-48]
test_data2 <- test_data1[, -2:-7]
test_data3 <- test_data2[, -4:-5]
View(test_data3)
#exclude 'value'
final_data1 <- test_data3

sundata1 <- final_data1[, c(2,6,1,3,4,5,7)]
#rename the header of the data for sunburst graph
colnames(sundata1) <- c("Age", "Position", "Mental Illness", "Gender", "Country of Resident", "Resident State", "Remotely")
#creating the path column, to be connected
final_sun <- sundata1 %>% 
  mutate(path = paste(`Position`, `Mental Illness`, Gender, `Country of Resident`,
                      `Resident State`, `Remotely`, sep="-")) %>% 
  dplyr::select(path, Age)