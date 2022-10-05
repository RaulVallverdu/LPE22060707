
# Dataset de POD2 --------------------------------------------------------




install.packages (c("tidyverse","httr","janitor"))
library(janitor)
library(httr)
library(tidyverse)
Employee <- httr::GET("https://www.kaggle.com/code/barbaramoreno/proyecto-con-db-employee-future-prediction/data?select=Employee.csv")
glimpse(Employee)
view(Employee)

