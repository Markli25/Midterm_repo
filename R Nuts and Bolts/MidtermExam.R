library (argparse)
library (imager)
library (stringr)

parser <- ArgumentParser()
parser$add_argument("-path", help = "Local File Directory of image to augment")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-gray" ,default=FALSE,type="logical",help = "To grayscale an image")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image")

parser$print_help()     
args <- parser$parse_args()  

path<-as.character(args$path)
W<-as.numeric(args$W)
H<-as.numeric(args$H)
num <- args$HxW
HxW <- str_split(num, "x", simplify = TRUE)
H1 <- as.numeric(HxW[1])
W1 <- as.numeric(HxW[2])
H1[is.na(H1)] <- 0
W1[is.na(W1)] <- 0

dir.create(file.path("MidtermExam"), showWarnings = FALSE)

# path to folder that holds multiple .jpg files
Allimage<-function(path){
file_list <- list.files(path=path, pattern=".jpg$",recursive = TRUE,ignore.case=TRUE,full.names  =TRUE )
lapply(file_list, load.image)
}

augmented <- function(image,H,W,gray,angle){
  
  if(gray==TRUE){
    im<-Allimage(image)
    num <- 1:length(im)
    gray1 <- lapply(im,grayscale)
    for (i in num){
      save.image(im = gray1[[i]],file=paste0("MidtermExam/GrayImage",i,".jpg"))
    }
  }
  
  if(H&&W > 1){
   im <- Allimage(image)
  num <- 1:length(im)
    imresize <- lapply(im,resize,size_x = H, size_y = W)
    for (i in num){
      save.image(im = imresize[[i]],file=paste0("MidtermExam/ResizeImage",i,".jpg"))
    }
  }
  
  im <- Allimage(image)
    num <- 1:length(im)
    inverted <- lapply(im,imrotate,angle)
  for (i in num){
    save.image(im = inverted[[i]],file=paste0("MidtermExam/InvertedImage",i,".jpg"))
  }
}
#output
print(augmented(args$path,H1,W1,args$gray,args$angle))
