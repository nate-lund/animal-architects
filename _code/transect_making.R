# Technical support
  # sf manual https://cran.r-project.org/web/packages/sf/sf.pdf
  # lidR manual https://r-lidar.github.io/lidRbook/
  # shapefiles manual https://cran.r-project.org/web/packages/shapefiles/shapefiles.pdf
  # MNtopo https://files.dnr.state.mn.us/aboutdnr/gis/mntopo/mntopo_help_document.pdf

#install.packages("here"); install.packages("raster"); install.packages("terra"); install.packages("sf"); install.packages("lidR"); install.packages("tidyr"); install.packages("dplyr"); install.packages("ggplot2"); install.packages("easypackages")

library(lidR)
library(shapefiles)
library(sf)
library(terra)
library(raster)
library(tidyr)
library(dplyr)
library(ggplot2)
library(easypackages)

######################################################
# lidar and dems

# load laz fliles from arb (in NAD83). filter for only ground-classified points (-keep_class 2)
arb_las1 <- readLAS("G:/My Drive/_data/_mapping/_arb_topo/_lidar/4342-05-13.laz", filter = "-keep_class 2")
arb_las2 <- readLAS("G:/My Drive/_data/_mapping/_arb_topo/_lidar/4342-05-12.laz", filter = "-keep_class 2")

# load laz files from lr
lr_las1 <- readLAS("G:/My Drive/_data/_mapping/_lake_rebecca_topo/_lidar/3542-30-08.laz")
lr_las2 <- readLAS("G:/My Drive/_data/_mapping/_lake_rebecca_topo/_lidar/3542-30-09.laz")
lr_las3 <- readLAS("G:/My Drive/_data/_mapping/_lake_rebecca_topo/_lidar/3542-31-08.laz")
lr_las4 <- readLAS("G:/My Drive/_data/_mapping/_lake_rebecca_topo/_lidar/3542-31-09.laz")

lazs <- list(arb_las, arb_las2, lr_las1, lr_las2, lr_las3, lr_las4)

# transform to NAD83 zone 15N (ESPG 26915)
epsg(arb_las1) # report the current coordinate system
st_crs(arb_las) <- 26915 # set to  NAD83 zone 15N
st_crs(arb_las2) <- 26915
st_crs(lr_las1) <- 26915
st_crs(lr_las2) <- 26915
st_crs(lr_las3) <- 26915
st_crs(lr_las4) <- 26915

# fit DEM using triangular irregular network, this is similar to LAStools stuff too
arb_dem1 <- rasterize_terrain(arb_las, res = 1, algorithm = tin())
arb_dem2 <- rasterize_terrain(arb_las2, res = 1, algorithm = tin())

lr_dem1 <- rasterize_terrain(lr_las1, res = 1, algorithm = tin())
lr_dem2 <- rasterize_terrain(lr_las2, res = 1, algorithm = tin())
lr_dem3 <- rasterize_terrain(lr_las3, res = 1, algorithm = tin())
lr_dem4 <- rasterize_terrain(lr_las4, res = 1, algorithm = tin())


# merge DEMS
arb_dem <- mosaic(arb_dem1, arb_dem2)

lr_dem <- mosaic(lr_dem1, lr_dem2, lr_dem3, lr_dem4)

# calculate slope raster (in degrees)
arb_slope <- terrain(arb_dem, "slope", unit = "degrees")

lr_slope <- terrain(lr_dem, "slope", unit = "degrees")

  #plot_dtm3d(lr_dem, bg = "white") 

######################################################
# transect points

# load erosion pin points
arb_gps_raw <- read.csv("G:/My Drive/_data/_erosion_pins/_transect_gps/Erosion_Pin_Transects_1.csv") %>% 
  select(Latitude, Longitude) %>% 
  filter(Latitude < 45)
  
lr_gps_raw <- read.csv("G:/My Drive/_data/_erosion_pins/_transect_gps/Erosion_Pin_Transects_1.csv") %>% 
  select(Latitude, Longitude) %>% 
  filter(Latitude > 45)

# above points are theoretically in WGS84. this tells r they are (which in R the crs is EPSG: 4326)
  # https://www.nceas.ucsb.edu/sites/default/files/2020-04/OverviewCoordinateReferenceSystems.pdf
arb_gps <- st_as_sf(arb_gps_raw, coords = c("Longitude", "Latitude"), crs = 4326)
lr_gps <- st_as_sf(lr_gps_raw, coords = c("Longitude", "Latitude"), crs = 4326)

# transform from WGS84 to NAD83 zone 15N to match lidar (EPSG: 4269)
arb_NAD <- st_transform(arb_gps, crs = 26915)
lr_NAD <- st_transform(lr_gps, crs = 26915)

lr_NAD <- lr_NAD[-31,] # remove junk point

######################################################
# combo

# extract elevation and slope data
arb_NAD$elevation <- terra::extract(arb_dem, arb_NAD)[,2]
arb_NAD$slope <- terra::extract(arb_slope, arb_NAD)[,2]

lr_NAD$elevation <- terra::extract(lr_dem, lr_NAD)[,2]
lr_NAD$slope <- terra::extract(lr_slope, lr_NAD)[,2]

plot(lr_NAD)

plot(lr_NAD[1:15,])

plot(lr_NAD[16:30,])

plot(lr_NAD[31:45,])

