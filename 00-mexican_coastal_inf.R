#You'll need to install libraries first
library(tidyverse)
library(sf)


#Load file and filter to Mexico
ci <- readRDS("data/coastal_infraestructure_v1.RDS") %>% 
  filter(country=="Mexico")


#Keep only coastal infraestructure: Hotel, Aeropuerto, Marina, Puerto
#db is the database you'll use

db <- db %>% 
  #Keywords to filter, this selects the words you specify
  filter(str_detect(type, "Hotel|hotel|Airport|Dock|Harbor|Port|Seaport|Resort")) %>%
  #Remove possible unnecessary extra results
  filter(!str_detect(type, 
                     "mall|Shopping|restaurant|Agency|Store|Food|School|Rent|food|agency|store|school|parking|Parking")) %>%
  #Remove all duplicate points (same coordinates)
  distinct(latitude, longitude, .keep_all = T) 





#After the cleaning, transform into simple feature
#and export shp

ci_sf <- st_as_sf(ci,coords = c("longitude", "latitude")) %>% 
  st_write(., "CARPETA DE SALIDA/NOMBRE DEL ARCHIVO.shp")


#Filter for Baja California Sur only
#And export shp

     

