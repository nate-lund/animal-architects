# Numerical Model Building



The purpose of this section is to create a quantitative framework, a model, to explore the relationship between bioturbation, erosion, and particle size distribution and their collective impact on soil profile and landscape development.

To this end, the goal primary goal is to create a simple model, with a limited number of input parameters that can...

1.  Describe how bioturbation creates texture contrast in soils over time.
    1.  E.g. stoneline development or clay movement.
2.  Describe how erosion rate and particle-size sensitive erosion rate impact texture contrast development.
    1.  E.g. quantitatively model the dynamic denudation framework of Johnson et al. (2005a and 2005b).
3.  Describe how bioturbation drives soil texture variability across a landscape, including sediment supplied to streams.
4.  Accommodate changes in erosion and mixing rates at discrete time steps.
    1.  E.g. to simulate the impact of an invasive species or introduction of bioturbators.
5.  Represent a suite of bioturbators with unique particle size preferences and mixing rates and behaviors.

## Soil Transport via Diffusion-Advection

The model is based on a layer system to approximate biodiffusion at depth. The number of layers (currently only 5), layer thickness, and profile depth are user-input. At each time step, the soil properties for each layer are calculated based on input parameters and the properties of the layer directly above and below. The model currently assumes steady state conditions: that erosion and soil formation are equivalent, regardless of soil depth, and thus that soil thickness remains constant over time. [citation about steady state] says this is okay... The model is currently integrates local and non-local mixing to simulate two soil properties: one that is included in diffused material (e.g. clay) and one that is excluded from diffused material (e.g. coarse fragments).

![Figure 1. Visualization of a single layer, i, and the upper and lower layers.](images/clipboard-62785000.png){width="414"}

The first component is the change in diffusion with depth as a result of decreased in organisms activity as noted by many authors [citation]. Two similar functions are used for this purpose: one for local and one for non-local mixing. Following Johnson et al. (2014), this relationship can be described by:

$$
D(z)=s e^{-z/b}
$$

Where D is bulk-soil diffusion (m2/yr), s is the surface diffusion rate (m2/yr), z is depth (m), and b is the e-folding length scale related to organism-dependent bioturbation depth (m) [assumed to be 0.28].

<img src="06_model_building_files/figure-html/Dz-1.png" width="672" />

When considering the impact of diffusion on a single soil property, a biodiffusion function can be applied with a concentration value to describe the flux (g/yr) through the profile. Diffusion-advection is a relatively substantial simplification of the bioturbation process where periods of sediment inactivity are interuppted by trans location events. However, prior studies show that the application of a diffusion-advection equation is appropraite if simulation time and the number of translocation events are sufficiently large (Mitchel et al. 2022). Flux between two layers can then be described by:

$$
V_{y, down}=D(z_i)(y_{i-1}-y_i)
$$

Where V~y~ is downward flux across layers (g/yr), i is the current layer, and y is the content of some soil property in the ith layer (g/m2). However, net flux into a layer requires consideration of both upward [i - 1] and downward [i + 1] movement, described by:

$$
V_{y}=D(z_i)(y_{i-1}-y_i) + D(z_i+h_i)(y_{i+1}-y_i)
$$

[note: bulk density is implicitly included in the y term, but might not always be]

Where h~i~ is the thickness of layer i (m). This is functionally similar to the diffusion-advection equation, $\frac{dy}{dt} = \frac{d}{dz}(D(z)\frac{dy}{dz})$, but in a more easily R-model-able format. However, because diffusion will be zero at the top and bottom of the soil profile, it requires a peicewise definition of D(z):

\begin{equation}
D(z) =
  \left\{\begin{array}{lr}
     s e^{-z/b}, & 0 < z < f \\
     0, & z = 0 \\
     0, & z = f 
  \end{array}\right.
\end{equation}

This model only considers only local mixing, and does not account for material that is excavated from one layer and deposited on the soil surface. Non-local mixing represnets a considerable displacement of material and has considerable impacts on surface material contents (Jarvis et al. 2010; Mastisoff et al. 2011). An additional piecewise diffusion function, $D_l(z)$, is defined for non-local mixing to allow a different diffusion-depth relationship than that of local mixing.

\begin{equation}
D_l(z) =
  \left\{\begin{array}{lr}
     s e^{-z/b}, & z > 0 \\
     \int_{0}^{f}D(z_l)dz*\frac{1}{n}\sum_{i=1}^{n}y_i & z = 0 \\
  \end{array}\right.
\end{equation}

Local plus non-local mixing is described by:

$$
V_{y}=D(z_i)(y_{i-1}-y_i) + D(z_i+h)(y_{i+1}-y_i) \\+ D_l(z_i)(y_{i-1})-D_l(z_i+h_i)(y_i)
$$

Including non-local mixing complicates the model and requires more data on the behavior of bioturbators. In comparing models including and excluding non-local mixing, Jarvis et al. 2010 found models without non-local mixing underestimated surface translocation of particles (using 137Cs as tracer). Notably, the authors did not include erosion estimates in their model, which studies show is an important factor in the redistribution of material by bioturbation [citation]. Further study on the importance of modeling non-local mixing is required. If the soil property, y, is included in the bulk soil being diffused, over time, diffusion will homogenize layers, as y ‘flows’ from layers of high to low concentration.

[note to self: burial versus erosion rate is a well-studied topic and is worth looking into here]

However, a primary interest of our model is the movement of material too large to be mixed by bioturbators, coarse fragments. Coarse fragments are included only in downward local soil movement. They move downwards to infill where material is excavated but are too large to be excavated themselves. Ignoring non-local and upward local mixing, flux of coarse fragments can be simplified to:

$$
V_{S, net}=D(z_i)(S_i) + D(z_i+h)(S_{i+1}-S_i)
$$

Where S is the concentration of material of a greater size class than movable by present bioturbators. At the top and bottom of the profile, the above diffusion equations are adjusted to be zero.

[input parameter table here]

### Model 1: Diffusion of clay and stones. Local mixing only. 


``` r
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
df2[["clay"]][c(2, 3, 4, 5, 6)] = data.frame(40, 1, 1, 1, 1)
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
      0.005334 * exp(-z/0.28) #exponential (Johnson et al., 2014) for eq. (Darwin 1881) for intercept
      #6.9 * 10^-5 + -1.06 * 10^-4 * z #exponential (Johnson et al., 2014)
      #0.0426 #earthworms (Yeates et a.l, 1995)
      #0.005334 #earthworms (Darwin 1881)
    }
  }
}

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

<img src="06_model_building_files/figure-html/diffusion-1.png" width="672" />

``` r
#plot clay
ggplot(data = df2_long, mapping = aes(y = value.z,
                                      x = value.clay, 
                                      group = time_step)) + 
  geom_line(orientation = "y") +
  scale_y_reverse(name = "depth (m)") +
  scale_x_continuous(name = "clay content (g/m2)") +
  facet_wrap(~time_step) +
  ggtitle("Clay movement over time",
          subtitle = "1 timestep = 10 years")
```

<img src="06_model_building_files/figure-html/diffusion-2.png" width="672" />

``` r
#' [basic plot, stone content over time for each layer]
ggplot(data = df2[["stones"]]) +
  geom_line(mapping = aes(y = A, x = time_step, color = "green")) +
  geom_line(mapping = aes(y = B, x = time_step, color = "red")) +
  geom_line(mapping = aes(y = C, x = time_step, color = "blue")) +
  geom_line(mapping = aes(y = D, x = time_step, color = "orange")) +
  geom_line(mapping = aes(y = E, x = time_step, color = "purple"))
```

<img src="06_model_building_files/figure-html/diffusion-3.png" width="672" />

### Erosion and Soil Formation

WIP

At the top, an erosion factor is included. Bulk density is assumed to be consistent throughout the profile.

## References

Darwin, Charles. The Formation of Vegetable Mould through the Action of Worms: With Observations on Their Habits. 1st ed. Cambridge University Press, 1881. <https://doi.org/10.1017/CBO9780511703850>.

Johnson, Michelle O., Simon M. Mudd, Brad Pillans, Nigel A. Spooner, L. Keith Fifield, Mike J. Kirkby, and Manuel Gloor. “Quantifying the Rate and Depth Dependence of Bioturbation Based on Optically‐stimulated Luminescence (OSL) Dates and Meteoric 10 Be.” Earth Surface Processes and Landforms 39, no. 9 (July 2014): 1188–96. <https://doi.org/10.1002/esp.3520>.

Yeates, G. W., and H. Van Der Meulen. “Burial of Soil-Surface Artifacts in the Presence of Lumbricid Earthworms.” Biology and Fertility of Soils 19, no. 1 (January 1995): 73–74. <https://doi.org/10.1007/BF00336350>.

Jarvis, N. J., A. Taylor, M. Larsbo, A. Etana, and K. Rosén. “Modelling the Effects of Bioturbation on the Re-Distribution of 137Cs in an Undisturbed Grassland Soil.” European Journal of Soil Science 61, no. 1 (2010): 24–34. <https://doi.org/10.1111/j.1365-2389.2009.01209.x>.

Matisoff, Gerald, Michael E. Ketterer, Klas Rosén, Jerzy W. Mietelski, Lauren F. Vitko, Henning Persson, and Edyta Lokas. “Downward Migration of Chernobyl-Derived Radionuclides in Soils in Poland and Sweden.” Applied Geochemistry 26, no. 1 (January 2011): 105–15. <https://doi.org/10.1016/j.apgeochem.2010.11.007>.

Meysman, Filip J.R., Volodymyr S. Malyuga, Bernard P. Boudreau, and Jack J. Middelburg. “A Generalized Stochastic Approach to Particle Dispersal in Soils and Sediments.” Geochimica et Cosmochimica Acta 72, no. 14 (July 2008): 3460–78. <https://doi.org/10.1016/j.gca.2008.04.023>.
