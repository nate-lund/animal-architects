# install packages
install.packages("ggplot2", "dplyr", "tidyr", "rlang")

#'[run below]

# set wd
setwd("C:/Users/natha/OneDrive/Onedrive Documents/Graduate School/01_Projects/P4 Bioturbation and Soil Development Lit Review/My models")

# data processing
library(ggplot2)
library(dplyr)
library(tidyr)
library(rlang)

#'###################### [creating a data frame] #######################

#' [set] number of time steps
time_steps = 1000

#' [set] number of years per time step
step_years = 10

# build a data frame
df = data.frame(time_step = rep(c(0:(time_steps - 1)), each = 4),
                index = rep(c("z", "bd", "inc", "exc"), times = time_steps),
                "A" = 0, 
                "B" = 0, 
                "C" = 0, 
                "D" = 0, 
                "E" = 0,
                "F" = 0,
                "bot" = 0)
#' [set] layer thickness (m)
h <- 0.25

#split data frame into multiple based on index column. names accordingly
df2 = df %>% group_by(index) %>% group_split(.keep = FALSE) %>% set_names(nm = c("z", "bd", "inc", "exc"))

# input the top depths of each layer into data frame
df2[["z"]][c(2, 3, 4, 5, 6, 7, 8)] = data.frame(0, h, h*2, h*3, h*4, h*5, h*6)

#' [set] layer bd into data frame, A:F
df2[["bd"]][c(2, 3, 4, 5, 6, 7)] = data.frame(1, 1, 1, 1, 1, 1)

#' [set] starting included and excluded components of each layer, A:F
df2[["inc"]][c(2, 3, 4, 5, 6, 7)] = data.frame(40, 20, 20, 20, 20, 20)
df2[["exc"]][c(2, 3, 4, 5, 6, 7)] = data.frame(5, 5, 5, 5, 5, 5)

print("df done :)")

#'###################### [defining functions] #######################

# define diffusion (bioturbation) function (if statements needed for top and bottom layers) (m/yr)
Dz <- function(z) {
  if(z == 0) {
    0 # forces D(z) to zero at surface
  } else {
    if(z == h*6) {
      0 # forces D(z) to zero at bottom
    } else {
      #' [set] diffusion function
      0.005334 * exp(-z/0.28) # exponential (Johnson et al., 2014) for eq. (Yeates et a.l, 1995) for intercept
      # 6.9 * 10^-5 + -1.06 * 10^-4 * z # linear
    }
  }
}

# diffusion w/ depth function plotting
eq = function(z){0.005334 * exp(-z/0.28)}
ggplot(data.frame(z = c(0, 3)), aes(x = z)) +
  stat_function(fun = eq) +
  scale_y_reverse(name = "diffusion (m2/yr)") +
  scale_x_reverse(name = "depth (m)") +
  coord_flip()

# define function that calculates local inc-diffusion (g/m/yr) into/out of ith layer
clay_diff_fun <- function(Ch, Ci, Cj, zi, bdi) {
  (Dz(z = zi) * (Ch - Ci) +
     (Dz(z = zi + h) * (Cj - Ci)) )
}

# define function that calculates local exc-diffusion (g/m/yr) into/out of ith layer
stones_diff_fun <- function(Sh, Si, Sj, zi, bdi) {
  (Dz(z = zi) * Sh -
     (Dz(z = zi + h) * Si) )
}

#'###################### [model calculations] #######################

# for loop that fills data frame with diffusion-calculated contents
for(crow in 2:(time_steps)) {
  for(ccol in 2:7) {
    # apply inc-diffusion function
    df2[["inc"]][crow, ccol] = 
      df2[["inc"]][crow - 1, ccol] +
      step_years * 
      clay_diff_fun(df2[["inc"]][crow - 1, ccol - 1],
                   df2[["inc"]][crow - 1, ccol],
                   df2[["inc"]][crow - 1, ccol + 1],
                   df2[["z"]][crow, ccol],
                   df2[["bd"]][crow, ccol])
    # apply exc-diffusion function
    df2[["exc"]][crow, ccol] = 
      df2[["exc"]][crow - 1, ccol] +
      step_years * 
      stones_diff_fun(df2[["exc"]][crow - 1, ccol - 1],
                    df2[["exc"]][crow - 1, ccol],
                    df2[["exc"]][crow - 1, ccol + 1],
                    df2[["z"]][crow, ccol],
                    df2[["bd"]][crow, ccol])
  } 
}

print("model done")

#'###################### [creating a plotting dataframe] #######################

# convert df2 dataframes to long format, one data frame for each inc, exc, and z
df2_inc_long <- df2[["inc"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E", "F"), names_to = "layer") %>% 
  mutate(bot = c(1:(6*time_steps)), .keep = "unused")
df2_exc_long <- df2[["exc"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E", "F"), names_to = "layer") %>% 
  mutate(bot = c(1:(6*time_steps)), .keep = "unused")
df2_z_long <- df2[["z"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E", "F"), names_to = "layer") %>% 
  mutate(bot = c(1:(6*time_steps)), .keep = "unused")

# combine the long df2's
df2_long_join1 <- left_join(df2_inc_long, df2_z_long, suffix = c(".inc", ".z"), by = "bot")
df2_long <- left_join(df2_long_join1, df2_exc_long, by = "bot")

# select for only key time steps
df2_long_plot <- df2_long_join2 %>% 
  select(time_step.inc, layer.inc, value.inc, value.z, value) %>% 
  rename(time_step = time_step.inc, layer = layer.inc, value.exc = value) %>% 
  filter(time_step == 0 | 
           time_step == (time_steps / 100) | 
           time_step == (time_steps / 50) | 
           time_step == (time_steps / 10) | 
           time_step == (time_steps / 4) |
           time_step == (time_steps - 1))

#'###################### [plotting] #######################

#plot exc
ggplot(data = df2_long_plot, mapping = aes(y = value.z,
                                      x = value.inc, 
                                      group = time_step)) + 
  geom_line(orientation = "y") +
  scale_y_reverse(name = "depth (m)") +
  scale_x_continuous(name = "Included component content (g/m2)") +
  facet_wrap(~time_step)

#plot inc
ggplot(data = df2_long_plot, mapping = aes(y = value.z,
                                           x = value.exc, 
                                           group = time_step)) + 
  geom_line(orientation = "y") +
  scale_y_reverse(name = "depth (m)") +
  scale_x_continuous(name = "Excluded component content (g/m2)") +
  facet_wrap(~time_step)


#'[run above]


# sum check to ensure conservation of mass (might be a problem w/ v.large diffusion rates)
df2_cmass <- df2[["inc"]] %>%
  rowwise() %>%
  mutate(
    sum = sum(c_across(2:7))
  )
df2_cmass[[9]]
