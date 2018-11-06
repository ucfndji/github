install.packages("tidyverse")
library(tidyverse)
ScotlandData<-read.csv("N:\\jiangdu\\rproject1\\health\\ScotlandData.csv", header = TRUE, sep = ",")
class(ScotlandData)
datatypelist<-data.frame(cbind(lapply(ScotlandData,class)))
ScotlandData<-read.csv("N:\\jiangdu\\rproject1\\health\\ScotlandData.csv")
ScotlandData <- edit(ScotlandData)
rm(LondonData)
summary(df)
names(ScotlandData)
install.packages("maptools")
install.packages(c("classint", "OpenStreetMap", "tmap"))
install.package("RColorBrewer", "Sp", "rgeos", "tmap", "tmaptools", "sf", "downloader", "rgdal", "geojsonio")
library(maptools)
library(RColorBrewer)
library(classInt)
library(OpenStreetMap)
library(sp)
library(rgeos)
library(tmap)
library(tmaptools)
library(sf)
library(rgdal)
library(geojsonio)
ScotlandMapSF <- read_shape("BoundaryData2/scotland_ca_2010.shp", as.sf = TRUE)
qtm(ScotlandMapSF)
library(methods)
class(ScotlandMapSF)
ScotlandDataMap<- append_data(ScotlandMapSF,ScotlandData, key.shp = "code", key.data = "GEO_CODE", ignore.duplicates = TRUE)
tmap_mode("plot")
qtm(ScotlandDataMap, fill = "F1777")
install.packages("shinyjs")
library(shinyjs)
tmaptools::palette_explorer()
Scotland_osm <- read_osm(ScotlandDataMap, type = "esri", zoom = NULL)
qtm(Scotland_osm) + 
  tm_shape(ScotlandDataMap) + 
  tm_polygons("F1777", 
              style="jenks",
              palette="YlOrRd",
              midpoint=NA,
              title="numberof people ",
              alpha = 0.5) + 
  tm_compass(position = c("right", "bottom"),type = "arrow") + 
  tm_scale_bar(position = c("right", "bottom")) +
  tm_layout(title = "people who have very bad health", legend.position = c("left", "bottom"))

tm_shape(ScotlandDataMap) +
    tm_polygons(c("F1777", "F1779"),
        style=c("jenks", "pretty"),
        palette=list("YlOrRd", "PuRd"),
        auto.palette.mapping=FALSE,
        title=c( "people who have very bad health","people who have very good health"))