# libraries needed
libs <- c("lidR", "shapefiles", "sf", "terra", "raster", "tidyr", "dplyr", "ggplot2", "easypackages", "spatialEco","here")

# install missing libraries
installed_libs <- libs %in% rownames(installed.packages())
if (any(installed_libs == F)) {
  install.packages(libs[!installed_libs])
}

# load libraries
lapply(libs, library, character.only = T)

# enter the file path for the highest level folder you're working in 
data_folder <- "C:/Users/natha/Box/box_data/_data/_erosion_pins"

# when a file is needed, call the hert() function
hert <- function(file) {
  file_path = paste(data_folder, file, sep = "")
  return(file_path)
}

# for example:
# data_frame = read.csv(hert("more_data/measurements_data.csv"))

################################################################

#'[cleaning up the data]

# Pull in the data from box and some pre-processing.
  input <- read.csv(hert("/measurements_data.csv"))

# preview
  head(input)

# we need to first average the duplicate measurements for each pin.
  input$mm_ch <- (input$mm1_ch + input$mm2_ch) / 2 # for changes
  input$mm_bl <- (input$mm2_bl + input$mm2_bl.1) / 2 # for baseline
  
# convert date to days past
  input$date_date <- as.Date(input$date) # format date column
  input$dayof <- as.numeric(input$date_date) - 20283 + 195 # convert to days since 1970-01-01
  
# create and index column, a uniqe ID for each mm
  input$index <- (paste(input$site, input$forest, input$transect, input$slope_pos, input$pin.., sep = "_"))
  input$index_num <- as.numeric(factor(input$index))
  
# filter the dataset to remove unneeded columns
  clean <- input %>% select(date_date, dayof, index_num, worms, site, forest, transect, slope_pos, pin.., mm_ch, mm_bl) %>% 
    rename(pin = pin..)

head(clean)


#'[differencing pins]

# arrange pins unique pin, in order of date
clean_sorted <- clean %>% 
  arrange(index_num)

for(ccol in 2:7) {
  df2[["inc"]][crow, ccol]
  
} 

clean_sorted

group_modify()

