install.packages(c("raster","rasterVis", "dplyr", "tidyr"))

######################### run all below #########################

# data processing
library(ggplot2)
library(dplyr)
library(tidyr)
# spatial
library(raster)
library(rasterVis)

#'[EDIT ME] set the name of the file you want output, needs to match the name of the folder with pictures 
output_name = "09202024"

#set wd
setwd("C:/Users/natha/OneDrive/Onedrive Documents/UMN Graduate School/01_Projects/P1 Erosion Pins at Wood Duck/Vegetation Analysis/Data")


#establishes a peicewise path to folder based output_name name
file_path = paste("C:/Users/natha/OneDrive/Onedrive Documents/UMN Graduate School/01_Projects/P1 Erosion Pins at Wood Duck/Vegetation Analysis/", output_name,"/", sep = "")

#grabs all file names
files = list.files(path = file_path, 
                   pattern = ".HEIC")

#make a data frame for the output
files_df = unlist(files, use.names = FALSE)
final_df = data.frame(row.names = files_df, 
                      x = files_df, 
                      y = NA)
test_df = data.frame(A = c(1,2,3),
                     B = c("e","f","g"),
                     C = c(0.2223, 0.3333, 0.12))
test_df

test_select = dplyr::select(test_df, A)

#beginning for loop
for(current_file in files) {
  #creates a complete file path for use in
    working_image = paste(file_path, current_file, sep = "")
  #create a three-layer raster for working image
    image <- brick(x = working_image)
  # Extract red, blue and green bands to unique raster files
    red <- image[[1]]
    green <- image[[2]]
    blue <- image[[3]]
  # Calculate index raster
    index <- 2 * (green) - red - blue
  #force index raster to be read as a data frame (needed for ggplot)
    index_spdf <- as(index, "SpatialPixelsDataFrame")
    index_df <- as.data.frame(index_spdf)
      #give index_df proper column names
         colnames(index_df) <- c("value", "x", "y")
  #filter index for just for veg
    index_veg = index_df %>% 
      filter(value > 75)
  #write the filtered count to a row in final_df
    final_df[current_file,] = nrow(index_veg) / 12000000
    print(nrow(index_veg)/ 12000000)
  }

head(final_df)

#trim columns, change x to numeric, and add a summary group based on 3
export_df_2 = transform(final_df, x = as.numeric(x))
export_df = dplyr::select(export_df_2, "x")
export_df$t = rep(c(1, 2, 3, 5, 6, 7, 8, 9, 11, 12, 13, 14), each = 3)

#create summary table for each 3-picture set 
export_csv = export_df %>% 
  group_by(t) %>% 
  summarize(mean_veg = mean(x))
export_csv

#export csv to folder
write.csv(x = export_csv, file = output_name)



######################### run all above #########################




# ######################### plotting and verification #########################
# #histogram of index value distributions
# ggplot(data = index_df, aes(x = value)) +
#   geom_histogram(binwidth = 1)
#   #scale_x_continuous(limits = c(-5,100))
# 
# # Plot the full index
# ggplot(data = index_df, aes(x = x, y = y, fill = value)) +
#   geom_tile()
# 
# # Plot the filtered index_veg
# ggplot(data = index_veg, aes(x = x, y = y, fill = value)) +
#   geom_tile()
# 
# 
# ######################### code for a single image #########################
# # Rasterfy the image
# image <- brick(x = "C:/Users/natha/OneDrive/Onedrive Documents/UMN Graduate School/01_Projects/P1 Erosion Pins at Wood Duck/Vegetation Analysis/R_Code/Test_Image3.HEIC")
# 
# # Extract red, blue and green bands to unique raster files
# red <- image[[1]]
# green <- image[[2]]
# blue <- image[[3]]
# 
# # Calculate index raster
# index <- 2 * (green) - red - blue
# 
# #force index raster to be read as a data frame (needed for ggplot)
# index_spdf <- as(index, "SpatialPixelsDataFrame")
# index_df <- as.data.frame(index_spdf)
# #give index_df proper column names
# colnames(index_df) <- c("value", "x", "y")
# 
# #filter index for just for veg
# index_veg = index_df %>%
#   filter(value > 75)
# print(nrow(index_veg) / 12000000)
