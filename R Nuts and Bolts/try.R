add5numbers<-function(num1,num2,num3,num4,num5){
  num1 + num2 + num3 + num4 + num5
}
add5numbers(1,2,3,4,5)

x<-c(1:100)

subset_data<- function(dataset,min_dataset,max_dataset){
  subset_param<-(dataset>min_dataset)&(dataset<max_dataset)
  dataset[subset_param]
}
subset_data(x,40,50)

MeanFunction<-function(dataset_csv){
  col_num<-ncol(dataset_csv)
  mean_per_col<- numeric(col_num)
  for (element in 1:col_num) {
    mean_per_col[element]<-mean(dataset_csv[,element],na.rm = TRUE)
  }
  mean_per_col
}
  dataset<-read.csv("midetrmseatwork_data.csv")
  
  MeanFunction(dataset,FALSE)