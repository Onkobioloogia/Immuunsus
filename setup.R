library("slidify")
library("slidifyLibraries")

# setwd("/home/taavi/Dropbox/Onkobioloogia")
# author("Immuunsus")

setwd("/home/taavi/Dropbox/Onkobioloogia/Immuunsus/")
slidify('index.Rmd')
# browseURL("index.html")
publish("Immuunsus", "tpall")
