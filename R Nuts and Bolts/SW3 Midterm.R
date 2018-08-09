dataset<- read.csv("midetrmseatwork_data.csv")
#1
subset<-function(dataset,nrow,ncol){
  dataset[nrow,ncol]
  }
subset(dataset,82,3)
#2
sub<-function(dataset,ncol){
  sum(is.na(dataset[,ncol]))
}
sub(dataset,2)

MeanFunction <- function(dataset,row,col){
  mean(dataset[row,col],na.rm=TRUE)
}
MeanFunction(dataset,20:70,3)

dataset
