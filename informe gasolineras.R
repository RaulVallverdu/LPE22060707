
library(dplyr)
library(stringr)
library(readxl)
library(sparklyr)
#install.packages("leaflet")
library(pacman)
library(leaflet)
library(tidyverse)
library(httr)


url <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
df <- httr::GET(url)
glimpse(df)
view(df)

# gasoleo A, los 10 ms caros
df %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localida, direccion) %>% 
  top_n(10, precio_gasoleo_a) %>% 
  leaflet() %>% addTiles() %>% 
  addCircleMarkers(lng= ~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a )

#Gasoleo A. Top 10 mas caras

df %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(10, precio_gasoleo_a) %>% 
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng=~longitud_wgs84,lat=~latitud,popup=~rotulo,label= ~precio_gasoleo_a)











