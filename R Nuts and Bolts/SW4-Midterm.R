

#readimagethrulocal
install.packages("imager")
library(imager)
file <- system.file('extdata/parrots.png',package='imager')
im <- load.image(file)
plot(im)

#readimagethrulocalresized
library(imager)
file <- system.file('extdata/index.jpg',package='imager')
im <- load.image(file)
im <- resize(im, 250, 250)
plot(im,main="RESIZED")

#readimagethruweb
install.packages("magick")
library(magick)
tiger <- image_read('https://lh3.googleusercontent.com/-7C7aA4HEtoM/VT7Xh7f0RWI/AAAAAAAAARI/HVLyAAUerwA/w530-h298-n/522622.jpg')
image_flop(tiger)