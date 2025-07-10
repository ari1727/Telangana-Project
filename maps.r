library(tidyverse)
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, colour=class))


library(tidyverse)
library(viridis)
ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, colour=class))+
  scale_colour_viridis_d()

library(tidyverse)
d=data.frame(x=c(1,2,2), y=c(1,1,2))
ggplot() + geom_polygon(data=d, mapping=aes(x=x, y=y))
#default is filled (coloured) polygon
#viridis is for colour blindness- less contrast between other colours

library(tidyverse)
d=data.frame(x=c(1,2,2), y=c(1,1,2))
ggplot() +
  geom_polygon(data=d, mapping=aes(x=x, y=y), fill="#440154")



library(tidyverse) 
library(viridis)
d=data.frame(x=c(1,2,3, 3,4,4), y=c(1,1,2, 2,2,3), 
             t=c('a', 'a', 'a',  'b', 'b', 'b'), r=c(1,3,4, 2,6,5)) #r tells the order of mapping the coordinates
ggplot() + geom_polygon(data=d, mapping=aes(x=x, y=y, group=t, fill=as.character(t)))+ scale_fill_viridis(discrete=TRUE)



library(tidyverse)
library(viridis)
#download data from website https://www.isibang.ac.in/~athreya/Rtalk/
#set working directory with the files in them
coords<-read.csv("Karnataka_District_Coordinates.csv")
karnataka_map<-ggplot(data=coords) +
  geom_polygon(mapping=aes(x=long,y=lat, group=group),color="navy", fill=NA)
karnataka_map


library(tidyverse)
library(viridis)
library(ggplot2)
library(viridis)
#download data from website https://www.isibang.ac.in/~athreya/Rtalk/
#set working directory with the files in them
coords<-read.csv("Karnataka_District_Coordinates.csv")
coords$Name<- as.character(coords$District)
karnataka_map<-ggplot(data=coords) + 
  geom_polygon(mapping=aes(x=long,y=lat, group=group,fill=Name),color="black")+
  scale_fill_viridis(discrete=TRUE)
karnataka_map


library(tidyverse)
library(viridis)
library(ggplot2)
library(viridis)
#download data from website https://www.isibang.ac.in/~athreya/Rtalk/
#set working directory with the files in them
coords<-read.csv("Karnataka_District_Coordinates.csv")
coords$Name<- as.character(coords$District)
centroids<-read.csv("Karnataka_District_Centroids.csv",check.names=FALSE)
centroid1=inner_join(coords,centroids,by="District")
centroid1$District[which(centroid1$District=="Bengaluru Rural")] = "B.Rural"
Karnataka_map_names<-ggplot(data=coords) + 
  geom_polygon(mapping=aes(x=long,y=lat, group=group,fill=Name),color="black")+
  scale_fill_viridis(discrete=TRUE)+
  geom_text(data=centroid1,mapping=aes(x=centroid_long,y=centroid_lat, label=District),size=1.5)+
  coord_fixed(0.8)+theme(legend.position="none")+labs(x="",y="")+
  ggtitle("Karnataka Map")+
  theme(
    plot.margin=grid::unit(c(0,0,0,0), "mm"),
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank()
  )
Karnataka_map_names


