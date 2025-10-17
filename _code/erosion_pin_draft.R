# libraries needed
libs <- c("lidR", "shapefiles", "sf", "terra", "raster", "tidyr", "dplyr", "ggplot2", "easypackages", "spatialEco","here", "performance", "RColorBrewer", "lme4", "nlme")

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

# display.brewer.all()
# display.brewer.pal(n = 8, name = 'PRGn')
# brewer.pal(n = 8, name = "PRGn")



#'###################### [start / preping df] #######################

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

# arrange pins unique pin, in order of date
clean_sorted <- clean %>% 
  arrange(index_num) %>% # sort
  mutate(dt = 0) %>% # add a dt column for later
  mutate(dmm = 0) # add a dmm column for later

# number of unique pins, should be 216
nindex <- length(unique(clean_sorted$index))

# create a list, where each item is a data frame with all the measurements of each pin 
df_list <- vector(mode = "list", length = nindex) # empty list
for(i in 1:nindex) {
  df_list[[i]] <- clean_sorted %>% filter(index_num == i)
} 

#'###################### [calcuating differnces] #######################

for(i in 1:nindex){ # out for loop selects each data frame (individual pin) in the list
  for(j in 2:6) { # inner for loop goes throughe each column of list 
    df_list[[i]][j,12] <- df_list[[i]][j, 2] - df_list[[i]][j - 1, 2] # subtracts today's day of from last measurement's
    df_list[[i]][j,13] <- df_list[[i]][j - 1, 11] - df_list[[i]][j, 10] # subtracts today's mm from last baseline
  }
}
  

#  rebuild the data frame
  master_df <- df_list[[1]] # jank start to the for loop, needs a base
for(i in 2:nindex) { # for loop to stack dataframes one list at a time
  master_df <- merge(master_df, df_list[[i]], all = TRUE)
} 

write.csv(master_df, hert("master_df.csv"))
  
#'###################### [analysis] #######################

# clean up data frame to remove outliers (greater than 3sd from the mean)
master <- master_df %>%
  mutate(abs_dmm = abs(dmm)) %>% # create abs_dmm column
  filter(abs_dmm < sd(master_df$dmm)*3 & dt > 0) # filter to remove inital sites and outliers


  
#'###################### [for individual pin data]

masteri <- master %>% 
  group_by(forest, transect, slope_pos, pin) %>%
  mutate(dhdt = abs_dmm / dt) %>% 
  summarize(dhdt_ = sum(dhdt), abs_dh = sum(abs_dmm), worms = first(worms)) %>% 
  mutate(dhdt = dhdt_ * 365 / 10 ) # dhdt in cm/yr


# arrange the data for later plotting
  masteri$forest <- factor(masteri$forest, 
                           levels=c("ASH", "LRE", "LRW", "MAG", "WD", "LRJ"))

  
  
# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masteri, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")

# WORM boxplot for abs_dmm/dt
ggplot(data = masteri, mapping = aes(x = worms, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)+ 
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Worms") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none")

# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masteri, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")

###############################non -abs
masteri <- master %>% 
  group_by(forest, transect, slope_pos, pin) %>%
  mutate(dhdt = abs_dmm / dt) %>% 
  summarize(dhdt_ = sum(dhdt), abs_dh = sum(abs_dmm), worms = first(worms)) %>% 
  mutate(dhdt = dhdt_ * 365 / 10 ) # dhdt in cm/yr


# arrange the data for later plotting
  masteri$forest <- factor(masteri$forest, 
                           levels=c("ASH", "LRE", "LRW", "MAG", "WD", "LRJ"))

  
  
# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masteri, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")

# WORM boxplot for abs_dmm/dt
ggplot(data = masteri, mapping = aes(x = worms, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)+ 
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Worms") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none")

# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masteri, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")

lmer1 <- lmer(data = masteri, dhdt ~ worms + (1 | forest))

lm1 <- lm(data = masteri, dhdt ~ worms + forest)

summary(lm1)

#'###################### [non-abs] 

# master
masterj <- master %>% 
  group_by(forest, transect, slope_pos, pin) %>%
  mutate(dhdt = dmm / dt) %>% 
  summarize(dhdt_ = sum(dhdt), dh = sum(dmm), worms = first(worms)) %>% 
  mutate(dhdt = dhdt_ * 365 / 10 ) # dhdt in cm/yr


# arrange the data for later plotting
masterj$forest <- factor(masteri$forest, 
                         levels=c("ASH", "LRE", "LRW", "MAG", "WD", "LRJ"))



# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masterj, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Erosion Rate (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")

# WORM boxplot for abs_dmm/dt
ggplot(data = masteri, mapping = aes(x = worms, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)+ 
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Worms") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none")

# FOREST SPECEFIC boxplot for dhdt
ggplot(data = masteri, mapping = aes(x = forest, y = dhdt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3")) +
  scale_y_continuous(name = "Change in Pins (cm / yr)") +
  scale_x_discrete(name = "Forest") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(fill = "Worms")


#'###################### [for aggregate data] 

# group and get averages for each array for each time step
master_grouped <- master %>% 
  group_by(date_date, forest, transect, slope_pos) %>% 
  summarize(mean_dmm = mean(dmm), mean_abs_dmm = mean(abs_dmm), dt = mean(dt), worms = first(worms), site = first(site))

# group and get averages for forest, BS and FS, for whole summer
master_net <- master_grouped %>% 
  group_by(forest, transect, slope_pos) %>% # group
  summarize(net_dmm = sum(mean_dmm), net_abs_dmm = sum(mean_abs_dmm), dt = sum(dt), worms = first(worms), site = first(site)) %>% # averages
  mutate(ID = paste(forest, transect, slope_pos, sep = "_")) %>%  # make an index column
  mutate(dmm_dt = net_dmm / dt, admm_dt = net_abs_dmm / dt) %>% # calculate dmm/dt
  filter(slope_pos == "BS")


print(master_net, n = 36)

lm1 <- lm(data = master_net, admm_dt ~ worms + forest)

summary(lm1)

# arrange the data for later plotting
  master_net$forest <- factor(master_net$forest, levels=c("ASH", "LRE", "LRW", "MAG", "WD", "LRJ"))


# FOREST SPECEFIC boxplot for abs_dmm/dt
ggplot(data = master_net, mapping = aes(x = forest, y = admm_dt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos) +
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3"))


# WORM boxplot for abs_dmm/dt
ggplot(data = master_net, mapping = aes(x = worms, y = admm_dt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)+ 
  scale_fill_manual(values = c("JW" = "#D6604D", "EW"= "#4393C3"))




# create a boxplot for dmm/dt
ggplot(data = master_net, mapping = aes(x = forest, y = dmm_dt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)

# WORM boxplot for dmm/dt
ggplot(data = master_net, mapping = aes(x = worms, y = dmm_dt, fill = worms)) +
  geom_boxplot() +
  facet_wrap(~slope_pos)




######################################

# plot dmm/dt
ggplot(data = master_net, mapping = aes(x = ID, y = dmm_dt, fill = worms)) +
  geom_bar(stat = "identity") +
  facet_wrap(~slope_pos) +
  theme_light()

?geom_bar

hist(master_summary$mean_dmm, breaks = 20)
hist(master$dmm, breaks = 20)




head(master_time)