
#Autor: Raul Vallverdu Esteban

browseURL("https://github.com/RaulVallverdu/LPE22060707")





# load packages -----------------------------------------------------------

if (!require("pacman")) install.packages("pacman")

pacman::p_load(pacman, magrittr, productplots, psych, RColorBrewer, tidyverse)
# pacman = load and unload
# magrittr = bidirectional piping
# productplots = graphics and cat var
# psych = statistics
# RColorBrewer = painting and colour palette


browseURL("http://j.mp/37Wxvv7")
?happy  #muestra datasets ya metidos en Rstudio
df<-happy %>% as_tibble()
levels(df$happy)   #veo los valores que toma la variable happy
df %<>% mutate(happy=fct_rev(happy))  #magrittr


# Outcome variable --------------------------------------------------------
df %>% ggplot()+geom_bar(aes(happy,fill=happy))+theme(axis.title.x = element_blank(),legend.position = "none")

# Happiness and gender ----------------------------------------------------
df %>% ggplot(aes(df$sex, fill=happy))+geom_bar(position = "fill")

# happiness and marital status --------------------------------------------
df %>% ggplot(aes(df$marital, fill=happy))+geom_bar(position = "fill")

# FRECUENCIA DE HAPPY
df %>% count(happy)
df %>% select(happy:health) %>% view()#selecciona un subconjunto de variables   desde x, hasta y
                                      # solo se muestra a columna
df %>% select(happy:health) %<>% view() # muestra el resultado y lo guarda

df %<>% filter(!is.na(happy))
df %>% count(happy)



# happiness and marital status --------------------------------------------
df %>% ggplot(aes(df$marital, fill=happy))+geom_bar(position = "fill")



df %>% mutate(married=if_else(marital=="married","yes","no")) %>% mutate(married=as.factor(married))
