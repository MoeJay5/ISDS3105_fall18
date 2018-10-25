library(RSocrata)
library(here)
library(tidyverse)

source(here('assignments/assignment05_openDataMap/tokenSocrata.R'))

if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup")
library(ggmap)

######################################
####   Layer of fire dep. calls  #####
######################################

fireIncidens <- 'https://data.brla.gov/resource/4w4d-4es6.csv?'
query <- "$where=disp_date between '2016-08-12' and '2016-08-22'"

dt_fire <- read.socrata(paste0(fireIncidens, query), app_token = token[['app']])
dt_fire <- as_tibble(dt_fire)

dt_fire <- dt_fire %>% 
  filter(geolocation != "") %>%
  mutate(geolocation = str_extract_all(geolocation, '[-,.,0-9]+')) %>% 
  mutate(long = as.double(map_chr(geolocation, 1)), lat = as.double(map_chr(geolocation, 2))) %>%
  mutate(type = "Fire Calls") %>%
  filter(inci_descript == "Severe weather or natural disaster, Other")

######################################
####    LOOTING 911 calls        #####
######################################

crimeIncidents <- 'https://data.brla.gov/resource/5rji-ddnu.csv?'
query <- "$where=offense_date between '2016-08-12' and '2016-08-22'"

dt_911 <- read.socrata(paste0(crimeIncidents, query), app_token = token[['app']])
dt_911 <- as_tibble(dt_911)

dt_911 <- dt_911 %>% 
  filter(geolocation != "") %>%
  mutate(geolocation = str_extract_all(geolocation, '[-,.,0-9]+')) %>% 
  mutate(long = as.double(map_chr(geolocation, 1)), lat = as.double(map_chr(geolocation, 2))) %>%
  mutate(type = "911 Calls") %>%
  filter(offense_desc == "LOOTING")

######################################
####        calls to 311         #####
######################################

apiEndpoint <- 'https://data.brla.gov/resource/uqxt-dtpe.csv?'

query <- "$where=createdate between '2016-08-12' and '2016-08-22'"

dt_311 <- read.socrata(paste0(apiEndpoint, query), app_token = token[['app']])
dt_311 <- as_tibble(dt_311)

dt_311 <- dt_311 %>% 
  mutate(geolocation = str_extract_all(geolocation, '[-,.,0-9]+')) %>% 
  mutate(long = map_chr(geolocation, 1), lat = map_chr(geolocation, 2)) %>% 
  mutate_at(vars(long, lat), as.double) %>%
  mutate(type = "311 Calls") %>%
  filter(parenttype == "DRAINAGE, EROSION, FLOODING OR HOLES")

######################################
####          Mapping            #####
######################################

brMap <- readRDS(here::here('data/mapTerrainBR.RDS'))

dataComb <- bind_rows(dt_311, dt_911, dt_fire)

ggmap::ggmap(brMap) +
  geom_point(data = dataComb, aes(x = long, y = lat, color = type), alpha = .35) + 
  ggtitle('Emergency Calls')

