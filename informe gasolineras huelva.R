
# id script ---------------------------------------------------------------

#Lenguajes de programacion estadistica
#Profesor: Christian Sucuzhana Arevalo
#Alumno: Raul Vallverdu Esteban ; exp: 22060707
#Hands on 01


# Ingest function ---------------------------------------------------------

#crtl +  l = clean console
#crtl + shift + r = new section



# Git commands -------------------------------------------------------------

git status
git init
git add
git commit -m "mensaje"
git push -u origin main
git branch Emilia
git merge
git remote add origin https://github.com/sukuzhanay/LPE21535220.git
git clone https://github.com/sukuzhanay/LPE21535220.git
git pull
git fetch


# Terminal commands -------------------------------------------------------

ls
cd
pwd
cd ..
mkdir   crear directorio
touch   
nano   crear archivo
less   pequeña informacion del archivo
cat   parecido al less pero puedes moverte por el archivo
where   saber donde esta el archivo
which   lo mismo que where



# loading libs ------------------------------------------------------------

install.packages("tidyverse")
install.packages (c("tidyverse","httr","janitor"))
install.packages("jsonlite")
library(tidyverse)
library(httr)
library(jsonlite)
library(janitor)
#readr::
#dplyr::
#selectr::


install.packages("pacman") 
library(pacman)
# Basic Operators ---------------------------------------------------------


#cristina <- 20    #asignacion de valores
#clase_lep <- c("Marta","Emilia","Pablo")   #guarda estos datos en forma de caracter
#clase_lep2 <- list("Marta","Emilia","Pablo",32)   #guarda los datos en forma de lista
#httr::  #sirve para traer datos desde internet

#control + shift + m      %>% 


url <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
glimpse(preciosEESS_es)
res_<-GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
xml2::read_xml(res_$content)




url_<-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
f_row<-jsonlite::fromJSON(url_)
df_source<-f_row$ListaEESSPrecio %>% glimpse()


#df_source %>% janitor::clean_names() %>% glimpse()   #sirve para limpiar los nombres del dataset (espacios, mayusculas, tildes...)
locale()   # te enseña como esta configurado el idioma (como se ponen los numeros...)


df<-df_source %>% janitor::clean_names() %>% type_convert(local = locale(decimal_mark = ","))  #este sirve cpara limpiar y cambiar las , por los . en los numeros



# Crear nuevas variables --------------------------------------------------

#nos piden clasificar gasolineras entre baratas y no baratas
df %>% view()  # ver el dataset
df %>% mutate(expensive = !rotulo %in% c('CEPSA','REPSOL','BP','SHELL')) %>% view() # hace una variable nueva con las gasolineras baratas. El ! hace q busque el complementario a las puestas ene l vetor
df_low<-df %>% mutate(expensive = !rotulo %in% c('CEPSA','REPSOL','BP','SHELL'))  # guarda el dataset con la nueva variable creada

#precio medio del gasoleo de las ccaa
df_low %>% select(precio_gasoleo_a,idccaa, rotulo, expensive) %>% drop_na() %>% group_by(idccaa, expensive) %>% summarise(mean(precio_gasoleo_a)) %>% view()
df_low %>% glimpse()



#crear nueva columna q identifique el 04 del id de la ccaa
df_low$ccaa<-ifelse(df$idccaa=='01', 'ANDALUCIA',
                    ifelse(df$idccaa=='02', 'ARAGON',
                    ifelse(df$idccaa=='03', 'ASTURIAS',
                    ifelse(df$idccaa=='04', 'ISLAS_BALEARES',
                    ifelse(df$idccaa=='05', 'ISLAS_CANARIAS',
                    ifelse(df$idccaa=='06', 'CANTABRIA',
                    ifelse(df$idccaa=='07', 'CASTILLA_Y_LEON',      
                    ifelse(df$idccaa=='08', 'CASTILLA_LA_MANCHA',       
                    ifelse(df$idccaa=='09', 'CATALUÑA',    
                    ifelse(df$idccaa=='10', 'COMUNITAT_VALENCIANA',       
                    ifelse(df$idccaa=='11', 'EXTREMADURA',       
                    ifelse(df$idccaa=='12', 'GALICIA',
                    ifelse(df$idccaa=='13', 'MADRID',
                    ifelse(df$idccaa=='14', 'MURCIA',
                    ifelse(df$idccaa=='15', 'NAVARRA',
                    ifelse(df$idccaa=='16', 'PAIS_VASCO',
                    ifelse(df$idccaa=='17', 'RIOJA',
                    ifelse(df$idccaa=='18', 'CEUTA',
                    ifelse(df$idccaa=='19', 'MELILLA',
                                                                     
                           
                    ifelse(df$idccaa=='',NA,'no existe'))))))))))))))))))))

df_low %>% view()
DS22060707 <- df_low
DS22060707 %>% view()


#IMPORTAR DATASET DE KAGGLE DESDE TERMINAL
#Kaggle-d download id
# Reading and Writing files -----------------------------------------------------

  

  
tools
terminal
copy terminal to editor

#---------------------------------------------------


#CLASE 19/10/2022


url <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
httr::GET(url)
install.packages(sparklyr)
library("sparklyr") 
install.packages(dplyr)
install.packages(stringr)
library(dplyr)
library(stringr)
library(readxl)
library(sparklyr)
install.packages("leaflet")
library(pacman)
library(leaflet)





#gasoleo A, los 10 mas baratos
DS22060707 %>% filter(provincia == 'HUELVA') %>% 
  select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>% 
  top_n(-20, precio_gasoleo_a) %>%
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng= ~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a )



























