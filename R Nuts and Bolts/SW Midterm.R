dataset<- read.csv("midetrmseatwork_data.csv")
  
  subset_data <- function(dataset,min=25,max=70){
    sub <- ifelse(dataset$Ozone>min & dataset$Temp>max,dataset$Wind,NA)
    mean(sub,na.rm = TRUE)
  }
  subset_data(dataset)
  
  MeanFunction <- function(dataset,Month=9,Day=8){
    col_num<-ncol(dataset)
    for (element in 1:nrow(dataset)) {
      col_num[element]<- ifelse(dataset[element,5]==Month & dataset[element,6]==Day,dataset[element,4],NA)
    }
    mean(col_num,na.rm = TRUE)
  }
  
  MeanFunction(dataset)
  
  MinFunction <- function(dataset,Month){
    col_num<-ncol(dataset)
    for (element in 1:nrow(dataset)) {
      col_num[element]<- ifelse(dataset[element,5]==Month,dataset[element,1],NA)
    }
    min(col_num,na.rm = TRUE)
  }
  MinFunction(dataset,5)
  MinFunction(dataset,6)
  MinFunction(dataset,7)
  MinFunction(dataset,8)
  MinFunction(dataset,9)