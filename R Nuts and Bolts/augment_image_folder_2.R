#!/usr/bin/Rscript
args=commandArgs(trailingOnly = TRUE);

if("--help" %in% args) {
  #cat("Rscript.exe D:\R_project\augment_image_folder.R --loc=... --wid=... --hei=... --gray=... --deg=...")
  cat("huehue")
  q(save="no")
}

parseArgs <- function(x) strsplit(sub("^--", "", x), "=")
argsDF <- as.data.frame(do.call("rbind", parseArgs(args)))
argsL <- as.list(as.character(argsDF$V2))
names(argsL) <- argsDF$V1

par1<-as.character(argsL$loc)
par2<-as.numeric(argsL$wid)
par3<-as.numeric(argsL$hei)
par4<-as.logical(argsL$gray)
par5<-as.numeric(argsL$deg)

temp<-''
addr<-''
addr<-''
temp<-c(list.files (path = par1,recursive = TRUE,pattern=".jpg"))
cnt<-0
for(i in temp){
  cnt<-cnt+1
  addr[cnt]<-paste(par1,i)
  addr[cnt]<-sub(" ","",addr[cnt])
  print(addr[cnt])#FOR CHECKING PURPOSES. REMOVE LATER
}
library(imager)
print(addr)
aug_pic<-function(addr, res_wid=200, res_hei=100, gray=TRUE, deg=0, filename="aug_img.jpg"){
  
  image<-load.image(addr)
  image<-resize(image,res_wid, res_hei)
  if(gray==TRUE){
    image<- grayscale(image)
  }
  image<-imrotate(image,deg)
  x<-"D:/augmented_images/"
  savef<-paste(x,filename)
  save.image(image,savef)
  cat("DONE! :)")
}
cnt<-0
for(i in addr){
  temp1<-paste(as.character(cnt),".jpg")
  temp1<-sub(" ","",temp1)
  aug_pic(i,par2,par3,par4,par5,temp1)
  print(i)
  print(cnt)
  cnt<-cnt+1
}
