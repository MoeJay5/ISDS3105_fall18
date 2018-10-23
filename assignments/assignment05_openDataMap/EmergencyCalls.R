library(RSocrata)
library(here)
library(tidyverse)

source(here('assignments/assignment05_openDataMap/tokenSocrata.R'))

if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup")
library(ggmap)

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
  mutate_at(vars(long, lat), as.double) # same as mutate(long = as.double(long), lat = as.double(lat))


ggmap::register_google(key = googleAPIkey)

brMap <- ggmap::get_map(location = c( lon = -91.1500, lat = 30.5000),  zoom = 10, maptype = 'toner') 

ggmap::ggmap(brMap) +
  geom_point(data = filter(dt_311, parenttype == "DRAINAGE, EROSION, FLOODING OR HOLES"),
             aes(x = long, y = lat), color = 'darkred', alpha = .33) +
  ggtitle('Position of calls to 311 Baton Rouge area')

