setwd("C:/Users/Dell PC/OneDrive/Desktop/arya/Books")
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="Intro to Stats/world_shape_file.zip")
library(rgdal)
system("unzip Intro to stats/world_shape_file.zip")
my_spdf <- readOGR( 
  dsn= paste0(getwd(),"C:/Users/Dell PC/OneDrive/Desktop/Tamo's world") , 
  layer="TM_WORLD_BORDERS-0.3",
  verbose=FALSE)
library(rgdal)
library(ggplot2)

shp = readOGR(dsn=".", layer="gadm41_AFG_shp")
plot(shp)
df = fortify(shp)
ggplot()+
  geom_polygon(data = df, aes(x = long, y =lat, group=group))

#download file
download.file("https://geodata.ucdavis.edu/gadm/gadm4.1/shp/gadm41_IND_shp.zip" , destfile="C:/Intro to stats/gadm41_IND_shp.zip")
# Unzip this file. You can do it with R (as below), or clicking on the object you downloaded
system("unzip C:/Intro to stats/gadm41_IND_shp.zip ")
# Read this shape file with the rgdal library. 
library(rgdal)
shp<-readOGR("C:/Intro to stats/Bihar")
plot(shp)
library(ggplot2)
df = fortify(shp)
ggplot()+
  geom_polygon(data = df, aes(x = long, y = lat, group = group),
               fill = "green", color = "black", lwd = 1)+
  theme_bw()
#trying out third level data
shp1<-readOGR("C:/Intro to stats/stanford-rj389fh4679-shapefile")
plot(shp1)
library(ggplot2)
df = fortify(shp1)
ggplot()+
  geom_polygon(data = df, aes(x = long, y = lat, group = group),
               fill = "green", color = "black", lwd = 1)+theme_bw()
setwd("C:/Intro to stats")
bihar<-read.csv("tehsilB.csv")
ggplot() +  
  geom_polygon(data=shp1, aes(x=long,y=lat,group=group)) +
  geom_polygon(data=bihar, aes(fill=population))

#US shapefile trial
setwd("C:/Intro to stats/Election")
library(RColorBrewer)
library(rgdal)
Election<-readOGR(dsn="Books", layer = "Election")# not work
US3<-readOGR("C:/Intro to stats/Election")
mycolours <- brewer.pal(8, "Blues")
mybreaks <- c(0, 20, 40, 50, 60, 80, 100)
cut(US3$Bush_pct, mybreaks)
mycolourscheme <- mycolours[findInterval(US3$Bush_pct, vec = mybreaks)]
plot(US3, col = mycolourscheme, main = "Percentage Vote Share for Bush - 2004", cex = 5)
legend(-119, 31.5, legend = levels(cut(US3$Bush_pct, mybreaks)), fill = mycolourscheme, cex = 0.8, title = "% vote for Bush")

#TRIAL 1
shp1<-readOGR("C:/Intro to stats/stanford-rj389fh4679-shapefile")
mycolours <- brewer.pal(8, "Blues")
mybreaks <- c(0, 20, 40, 50, 60, 80, 100)
cut(shp1$Bush_pct, mybreaks)
mycolourscheme <- mycolours[findInterval(shp1$Bush_pct, vec = mybreaks)]
plot(shp1, col = mycolourscheme, main = "Percentage Vote Share for Bush - 2004", cex = 5)
legend(-119, 31.5, legend = levels(cut(shp1$Bush_pct, mybreaks)), fill = mycolourscheme, cex = 0.8, title = "% vote for Bush")
