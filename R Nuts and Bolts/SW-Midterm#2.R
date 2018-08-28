#1 readimagethrulocal
install.packages("imager")
library(imager)
file <- system.file('extdata/coins.png',package='imager')
im <- load.image(file)
plot(im)
save.image(im,"C:/Users/RM A-225/Mark/Midterm_repo/augmented-images/coins.jpg")

#1 readimagethruweb
install.packages("magick")
library(magick)
tiger <- image_read('https://lh3.googleusercontent.com/-7C7aA4HEtoM/VT7Xh7f0RWI/AAAAAAAAARI/HVLyAAUerwA/w530-h298-n/522622.jpg')
image_flop(tiger)

#2.1 Resize image
library(imager)
file <- system.file('extdata/Leonardo_Birds.jpg',package='imager')
im <- load.image(file)
sub <-function(data,w,h){
  resize(data,w,h)
}
x<-sub(im, 500, 500)
plot(x,main="RESIZED")
save.image(x,"C:/Users/RM A-225/Mark/Midterm_repo/augmented-images/resized.jpg")

#2.2 Grayscale image
library(imager)
file <- system.file('extdata/parrots.png',package='imager')
im <- load.image(file)
subset<-function(data,x){
grayscale(data, method = "Luma", drop = x)
}
y<-subset(im,TRUE)
plot(y)
save.image(y,"C:/Users/RM A-225/Mark/Midterm_repo/augmented-images/parrots.jpg")

#2.3 Invert Image
library(imager)
file <- system.file('extdata/HubbleDeepField.jpg',package='imager')
im <- load.image(file)
subset<-function(data,x){
imrotate(data,x) %>% plot(main="Rotating")
}
y<-subset(im,90)
plot(y)
save.image(y,"C:/Users/RM A-225/Mark/Midterm_repo/augmented-images/inverted.jpg")