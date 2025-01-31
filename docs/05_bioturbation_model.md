# Model Building



## Purpose and Goals

The purpose of this section is to create a quantitative framework, a model, to explore the relationship between bioturbation, erosion, and particle size distribution and their collective impact on soil profile and landscape development, across organisms.

To this end, the goal primary goal is to construct a model that integrates bioturbation, erosion, and particle size distribution on soil-profile and landscape scales. More specifically, to create a simple model, with a limited number of input parameters that can...

1.  Describe how bioturbation creates texture contrast in soils over time.
    1.  E.g. stoneline development or clay homogenization.
2.  Describe how erosion rate and particle-size sensitive erosion rate impact texture contrast development.
    1.  E.g. quantitatively model the dynamic denudation framework of Johnson et al. (2005a and 2005b).
3.  Describe how bioturbation drives soil texture variability across a landscape, including sediment supplied to streams.
4.  Accommodate changes in erosion and mixing rates at discrete time steps.
    1.  E.g. to simulate the impact of an invasive species or introduction of bioturbators.
5.  Represent a suite of bioturbators with unique particle size preferences and mixing rates and behaviors (see Chapter \@ref(review-animals-as-agents-of-heterogeneity-and-homogeneity-in-soil-and-landscape-development)).

## Soil Mixing via Diffusion

The model is based on a layer system to approximate diffusion at depth. At each time step, the soil properties for each layer are calculated based on input parameters and the properties of the layer directly above and below. The model [currently] assumes steady state conditions: that erosion and soil formation are equivalent, regardless of soil depth. [Citation] says this is okay...

![Figure 1. Visualization of a single layer, i, and the upper and lower layers [this figure is a png now, build in r later if I want to keep]](images/clipboard-62785000.png){width="414"}

The first component is the change in diffusion with depth, a result of the decrease in bioturbation rate with depth noted by… (citations). Following Johnson et al. (2014), diffusion of bulk soil can be described by:

$$
D(z)=s e^{-z/b}
$$

Where D is bulk-soil diffusion (m2/yr), *s* is the surface diffusion rate (m2/yr) [think burial rate], *z* is depth (m), and *b* is a scaling factor related to organism-dependent bioturbation depth (m), assumed to be 0.28.

When considering the impact of diffusion on a single soil property [e.g. clay or coarse fragment content], a diffusion function can be applied with a concentration value to describe the flux (g/yr) through the profile. A diffusion function using these assumptions is approximately accurate for sufficiently long timescales (Mitchel et al. 2022) (see Chapter \@ref(model-types) for more details). This is based on the assumptions that spatially, mixing/burrow locations are randomly distributed, and all burrows are infilled with material from the layer directly above, thus upward and downward diffusion are equal. Flux between two layers can then be described by:

$$
V_{y, down}=D(z_i)(y_{i-1}-y_i)
$$

Where *V~y~* is downward flux across layers (g/yr), *i* is the current layer, and *y* is the content of some soil property in the *i*th layer (g/m2). However, net flux into a layer requires consideration of both upward [i - 1] and downward [i + 1] movement, described by:

$$
V_{y, net}=D(z_i)(y_{i-a}-y_i) + D(z_i+h)(y_{i+1}-y_i)
$$

which is functionally similar to the diffusion equation:

$$
\frac{dy}{dt} = \frac{d}{dz}(D(z)\frac{dy}{dz})
$$

[note: bulk density should be included here as well, as a factor multiplied by the y term. it is left out for now for the sake of simplicity, and for the fact that the \# of layers in the model is undecided, and having data on both bulk density and bioturbation rate is somewhat rare]

Where h~i~ is layer thickness (m). If the soil property, *y*, is included in the bulk soil being diffused, over time, diffusion will homogenize layers, as *y* ‘flows’ from layers of high to low concentration. This model only considers local mixing, and does not account for material that is excavated from one layer and deposited on the surface. Jarvis et al. (2010) and Mastisoff et al. (2011) suggest an additional factor in the diffusion-advection equation to account for non-local mixing. Local plus non-local mixing is described by:

$$
placeholder.equation
$$

Where... Including non-local mixing complicates the model and requires more data on the behavior of bioturbators. In comparing models including and excluding non-local mixing, Jarvis et al. 2010 found models without non-local mixing underestimated surface translocation of particles (using 137Cs as tracer). Notably, the authors did not include erosion estimates in their model, which studies show is an important factor in the redistribution of material by bioturbation (Mudd and Yoo, 2010) [review this citation again]. Further study on the importance of modeling non-local mixing is required.

[note to self: burial versus erosion rate is a well-studied topic and is worth looking into here]

However, a primary interest of our model is the movement of material too large to be mixed by bioturbators, coarse fragments. Coarse fragments are included only in downward local soil movement. They move downwards to infill where material is excavated but are too large to be excavated themselves. Ignoring non-local and upward local mixing, flux of coarse fragments can be described by:

$$
V_{S, net}=D(z_i)(S_i) + D(z_i+h)(S_{i+1}-S_i)
$$

Where S is the concentration of material of a greater size class than movable by present bioturbators.

### Code follows


``` r
#'[run below]

#'###################### [creating a data frame below] #######################

# number of time steps
rep_times = 1000

# number of years per time step
rep_years = 10

# build a data frame
df = data.frame(time_step = rep(c(0:(rep_times - 1)), each = 4),
                index = rep(c("z", "h", "clay", "stones"), times = rep_times),
                "A" = 0, 
                "B" = 0, 
                "C" = 0, 
                "D" = 0, 
                "E" = 0,
                "F" = 0)

#split data frame into multiple based on index column. names accordingly
df2 = df %>% group_by(index) %>% group_split(.keep = FALSE) %>% set_names(nm = c("z", "h", "clay", "stones"))

#assign the top depths of each layer
za = c(rep(0, times = rep_times))
zb = c(rep(0.25, times = rep_times))
zc = c(rep(0.5, times = rep_times))
zd = c(rep(1, times = rep_times))
ze = c(rep(1.5, times = rep_times))
# zf_fun bottom depth, not a layer (this is needed, as zf is is what the D functions use to assess if zi + hi = 0)
zf_fun = 1.75
zf = c(rep(zf_fun, times = rep_times))

#calculate h's, layer thickness
ha = zb - za
hb = zc - zb
hc = zd - zc
hd = ze - zd
he = zf - ze

#input parameters into data frames
df2[["z"]][c(2, 3, 4, 5, 6)] = data.frame(za, zb, zc, zd, ze)
df2[["h"]][c(2, 3, 4, 5, 6)] = data.frame(ha, hb, hc, hd, he)
#below is the starting clay and stone content of each layer, A:E
df2[["clay"]][c(2, 3, 4, 5, 6)] = data.frame(20, 20, 40, 20, 20)
df2[["stones"]][c(2, 3, 4, 5, 6)] = data.frame(5, 5, 5, 5, 5)

#'###################### [model calculations below] #######################

# define diffusion (bioturbation) function (if statements needed for top and bottom layers) (m/yr)
Dz <- function(z) {
  if(z == 0) {
    0 # could an erosion factor be included here ??????
  } else {
    if(z == zf_fun) {
      0 # could a soil production factor be included here ??????
    } else {
      #' [diffusion function defined here]
      #9.81 * 10^-5 * exp(-z/0.28) #linear (Johnson et al., 2014)
      0.005334 * exp(-z/0.28) #exponential (Johnson et al., 2014) for eq. (Yeates et a.l, 1995) for intercept
      #6.9 * 10^-5 + -1.06 * 10^-4 * z #exponential (Johnson et al., 2014)
      #0.0426 #earthworms (Yeates et a.l, 1995)
      #0.005334 #earthworms (Darwin 1881)
    }
  }
}

# #diffusion w/ depth function plotting, not needed
# eq = function(z){0.005334 * exp(-z)}
# ggplot(data.frame(z = c(0, 5)), aes(x = z)) +
#   stat_function(fun = eq) +
#   scale_y_reverse()


#' define function that calculates net [clay-diffusion] (g/m/yr) into/out of ith layer
clay_diff_fun <- function(Ch, Ci, Cj, zi, hi) {
  (Dz(z = zi) * (Ch - Ci) +
     (Dz(z = zi + hi) * (Cj - Ci)) )
}

#' define function that calculates net [stones-diffusion] (g/m/yr) into/out of ith layer
stones_diff_fun <- function(Sh, Si, Sj, zi, hi) {
  (Dz(z = zi) * Sh -
     (Dz(z = zi + hi) * Si) )
}


# for loop that fills data frame with diffusion-calculated clay contents
for(crow in 2:(rep_times)) {
  for(ccol in 2:6) {
    # apply clay-diffusion function
    df2[["clay"]][crow, ccol] = 
      df2[["clay"]][crow - 1, ccol] +
      rep_years * 
      clay_diff_fun(df2[["clay"]][crow - 1, ccol - 1],
                   df2[["clay"]][crow - 1, ccol],
                   df2[["clay"]][crow - 1, ccol + 1],
                   df2[["z"]][crow, ccol],
                   df2[["h"]][crow, ccol])
    # apply stones-diffusion function
    df2[["stones"]][crow, ccol] = 
      df2[["stones"]][crow - 1, ccol] +
      rep_years * 
      stones_diff_fun(df2[["stones"]][crow - 1, ccol - 1],
                    df2[["stones"]][crow - 1, ccol],
                    df2[["stones"]][crow - 1, ccol + 1],
                    df2[["z"]][crow, ccol],
                    df2[["h"]][crow, ccol])
  } 
}

#'###################### [plotting below] #######################

#' [creating a dataframe to plot from]
# convert df2 dataframes to long format, one data frame for each clay, stones, and z
df2_clay_long <- df2[["clay"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E"), names_to = "layer") %>% 
  mutate(F = c(1:(5*rep_times)), .keep = "unused")
df2_stones_long <- df2[["stones"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E"), names_to = "layer") %>% 
  mutate(F = c(1:(5*rep_times)), .keep = "unused")
# combine long df2 dataframes into one for plotting 
df2_z_long <- df2[["z"]] %>% 
  pivot_longer(cols = c("A", "B", "C", "D", "E"), names_to = "layer") %>% 
  mutate(F = c(1:(5*rep_times)), .keep = "unused")

# combine and filter the long df2's and select for only key time steps
df2_long_join1 <- left_join(df2_clay_long, df2_z_long, suffix = c(".clay", ".z"), by = "F")
df2_long_join2 <- left_join(df2_long_join1, df2_stones_long, by = "F")

df2_long <- df2_long_join2 %>% 
  select(time_step.clay, layer.clay, value.clay, value.z, value) %>% 
  rename(time_step = time_step.clay, layer = layer.clay, value.stones = value) %>% 
  filter(time_step == 0 | 
           time_step == (rep_times / 100) | 
           time_step == (rep_times / 50) | 
           time_step == (rep_times / 10) | 
           time_step == (rep_times / 4) |
           time_step == (rep_times - 1))

#plot stones
ggplot(data = df2_long, mapping = aes(y = value.z,
                                      x = value.stones, 
                                      group = time_step)) + 
  geom_line(orientation = "y") +
  scale_y_reverse(name = "depth (m)") +
  scale_x_continuous(name = "stones content (g/m2)") +
  facet_wrap(~time_step) +
  ggtitle("Stone movement over time"
          , subtitle = "1 timestep = 10 years")
```

<img src="05_bioturbation_model_files/figure-html/diffusion-1.png" width="672" />

``` r
#plot clay
ggplot(data = df2_long, mapping = aes(y = value.z,
                                      x = value.clay, 
                                      group = time_step)) + 
  geom_line(orientation = "y") +
  scale_y_reverse(name = "depth (m)") +
  scale_x_continuous(name = "clay content (g/m2)") +
  facet_wrap(~time_step) +
  ggtitle("Clay movement over time"
          , subtitle = "1 timestep = 10 years")
```

<img src="05_bioturbation_model_files/figure-html/diffusion-2.png" width="672" />

``` r
#' [basic plot, clay content over time for each layer]
ggplot(data = df2[["stones"]]) +
  geom_line(mapping = aes(y = A, x = time_step, color = "green")) +
  geom_line(mapping = aes(y = B, x = time_step, color = "red")) +
  geom_line(mapping = aes(y = C, x = time_step, color = "blue")) +
  geom_line(mapping = aes(y = D, x = time_step, color = "orange")) +
  geom_line(mapping = aes(y = E, x = time_step, color = "purple"))
```

<img src="05_bioturbation_model_files/figure-html/diffusion-3.png" width="672" />

``` r
#'[run above]
```

### Erosion and Soil Formation

WIP

At the top and bottom of the profile, the above diffusion equations are adjusted to be zero. At the top, and erosion factor. Bulk density is assumed to be consistent throughout the profile.

## References
