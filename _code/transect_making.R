# Technical support
  # sf manual https://cran.r-project.org/web/packages/sf/sf.pdf
  # lidR manual https://r-lidar.github.io/lidRbook/
  # shapefiles manual https://cran.r-project.org/web/packages/shapefiles/shapefiles.pdf

install.packages("here")
install.packages("raster")
install.packages("terra")
install.packages("sf")
install.packages("lidR")
install.packages("tidyr")
install.packages("dplyr")
install.packages("ggplot2")

library(lidR)
library(shapefiles)
library(sf)
library(terra)
library(raster)
library(here)
library(tidyr)
library(dplyr)
library(ggplot2)

# load laz fliles from arb
las <- readLAS(here("./_data/_mapping/_arb_topo/4342-05-13.laz"))
las2 <- readLAS(here("./_data/_mapping/_arb_topo/4342-05-12.laz"))

# load laz files from lr
#las <- readLAS(here("./_data/_mapping/_lake_rebecca_topo/4342-05-13.laz"))

# validate data
las_check(las)
las_check(las2)

plot(las)
plot(las2)

# load erosion pin points
arb_gps <- read.csv(here("./_data/_mapping/_erosion_pins/Erosion_Pin_Transects_1.csv")) %>% 
  select(Latitude, Longitude) %>% 
  filter(Latitude < 45)
  
lr_gps <- read.csv(here("./_data/_mapping/_erosion_pins/Erosion_Pin_Transects_1.csv")) %>% 
  select(Latitude, Longitude) %>% 
  filter(Latitude > 45)


plot(arb_gps)

gps_sf <- st_as_sf(gps_df, coords = c("Longitude", "Latitude"), crs = 4326)

gps_sf <- st_transform(gps_sf, crs = crs(dtm))  # Match CRS


# generating transect plots
p1 <- c(273457, 5274357)
p2 <- c(273542, 5274542)
las_tr <- clip_transect(las, p1, p2, width = 5, xz = TRUE)



ggplot(payload(las_tr), aes(X,Z, color = Z)) + 
  geom_point(size = 0.5) + 
  coord_equal() + 
  theme_minimal() +
  scale_color_gradientn(colours = height.colors(50))




# create DEM
dtm <- rasterize_terrain(las, res = 1, algorithm = knnidw())

dtm

?rasterize_terrain
