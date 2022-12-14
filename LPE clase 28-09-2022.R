
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
nano   
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
df %>% mutate(expensive = rotulo %in% c('CEPSA','REPSOL','BP','SHELL')) %>% view() # hace una variable nueva con las gasolineras caras
df %>% view()


# Reading and Writing files -----------------------------------------------------

  

  
  

