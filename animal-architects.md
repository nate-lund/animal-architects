---
title: "Animal Architects"
author: "Nate Lund"
date: "Last compiled 04:03, 06 December, 2024"
site: bookdown::bookdown_site
documentclass: book
output:
  bookdown::gitbook: default
  #bookdown::pdf_book: default
---

# Introduction

This is my living "lab notebook" for work on bioturbation, invasive earthworms, soil erosion, etc. It includes work on the MITPPC Jumping worm erosion project among other things.


## Technical Resources

Markdown book: https://bookdown.org/yihui/rmarkdown-cookbook/cache.html

Bookdown book: https://bookdown.org/yihui/bookdown/

Setting up R and Git: https://happygitwithr.com/

Hava's book: https://pages.github.umn.edu/blair304/cig-mgmt-data/index.html

<!--chapter:end:index.Rmd-->

# Table of Contents





### MITPPC Soil Erosion

1.  Chapter \@ref(1)
2.  ?

### Animals as Agents of Heterogeneity and Homogeneity in Soil and Landscape Development

3.  Chapter

<!--chapter:end:01_about.Rmd-->

# Hillslope Transects: Erosion Pins, etc.



<!--chapter:end:02_hillslope_transects.Rmd-->

# Imapct of Vegetation Cover on Erosion



<!--chapter:end:03_vegetation_cover.Rmd-->

# Bioturbation, in Review



The purpose of this section is to organize disparate notes on bioturbation and to create a small data set of bioturbators for model verification.

To this end, there are two broad goals:

1.  Complete a review of bioturbation rates, frequency, depth-dependence, and particle size limitations across organisms for model verification and to answer the question:
    -   How do bioturbators create structure and variability across the landscape?

## New Paths

-   Based on (Mudd and Yoo, 2010), a study on mineral age and weathering. Mixing plays an important role in the application of reservoir theory and in determining turnover time. A better understanding of the rate of mixing, depth of mixing, and method of transport (i.e. local vs non-local) migth be valuable.

-   How does the successional invasion of JW over European worms, through the displacement of Lumbricus terrestris, impact the type of mixing, I.e. local versus non local, and what are the consequences for clay movement in the soil?

### References

Mudd, Simon Marius, and Kyungsoo Yoo. “Reservoir Theory for Studying the Geochemical Evolution of Soils.” Journal of Geophysical Research: Earth Surface 115, no. F3 (2010). <https://doi.org/10.1029/2009JF001591>.

## Bioturbation Across Organisms

WIP

### References

Cox, G. W., & Allen, D. W. (n.d.). Soil translocation by pocket gophers in a Mima moundfield.

Hansen, R. M. (n.d.). MOVEMENT OF ROCKS BY NORTHERN POCKET GOPI-IERS. 49.

Miller, M. A. (1957). Burrows of the Sacramento Valley pocket gopher in flood-irrigated alfalfa fields. Hilgardia, 26(8), 431–452. <https://doi.org/10.3733/hilg.v26n08p431>

Yeates, G. W., & Van Der Meulen, H. (1995). Burial of soil-surface artifacts in the presence of lumbricid earthworms. Biology and Fertility of Soils, 19(1), 73–74. <https://doi.org/10.1007/BF00336350>

<!--chapter:end:04_bioturbation_review.Rmd-->

# Bioturbation Models, in Revew



The purpose of this section is to review the current state of the study and modeling of bioturbation.

The goals are to:

1.  Complete a review of the current bioturbation modeling landscape to answer the questions:
    -   What are the different approaches to modeling bioturbation or how can the current models be classified?
    -   What are the limitations or what is the applicability of theses models? What is their purpose?
    -   What spatial and temporal scale do models operate on? Soil profile or landscape? Decade or millennium?
2.  Compile annotated equations and variablies used in modeling bioturbation.

### Model types

There are a number of bioturbation models present in the literature. (Michel et al., 2022) provides a review of...

### Models

1.  Johnson et al. (2014) provides a simple diffusion model for change in a soil property, y, with time.

$$
\frac{dy}{dt} = \frac{d}{dz}(D(z)\frac{dy}{dz})
$$

the authors include an erosion factor, T. However, its use depends on the use of meteoric 10Be for estimating long-term erosion rates.

$$ \frac{dy}{dt} = \frac{d}{dz}(D(z)\frac{dy}{dz}) - T\frac{dY}{dz} $$

where

$$
D(z) = D(0)e^{-z/z_{b}}
$$

zb is the e-folding length scale (in metres)

2.  Example

$$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$$

### References

Jarvis, N. J., Taylor, A., Larsbo, M., Etana, A., & Rosén, K. (2010). Modelling the effects of bioturbation on the re-distribution of 137Cs in an undisturbed grassland soil. European Journal of Soil Science, 61(1), 24–34. <https://doi.org/10.1111/j.1365-2389.2009.01209.x>

Johnson, D. L., Domier, J. E. J., & Johnson, D. N. (2005a). Animating the biodynamics of soil thickness using process vector analysis: A dynamic denudation approach to soil formation. Geomorphology, 67(1–2), 23–46. <https://doi.org/10.1016/j.geomorph.2004.08.014>

Johnson, D. L., Domier, J. E. J., & Johnson, D. N. (2005b). Reflections on the Nature of Soil and Its Biomantle. Annals of the Association of American Geographers, 95(1), 11–31. <https://doi.org/10.1111/j.1467-8306.2005.00448.x>

Johnson, M. O., Mudd, S. M., Pillans, B., Spooner, N. A., Keith Fifield, L., Kirkby, M. J., & Gloor, M. (2014). Quantifying the rate and depth dependence of bioturbation based on optically‐stimulated luminescence (OSL) dates and meteoric 10 Be. Earth Surface Processes and Landforms, 39(9), 1188–1196. <https://doi.org/10.1002/esp.3520>

Matisoff, G., Ketterer, M. E., Rosén, K., Mietelski, J. W., Vitko, L. F., Persson, H., & Lokas, E. (2011). Downward migration of Chernobyl-derived radionuclides in soils in Poland and Sweden. Applied Geochemistry, 26(1), 105–115. <https://doi.org/10.1016/j.apgeochem.2010.11.007>

Michel, E., Néel, M.-C., Capowiez, Y., Sammartino, S., Lafolie, F., Renault, P., & Pelosi, C. (2022). Making Waves: Modeling bioturbation in soils – are we burrowing in the right direction? Water Research, 216, 118342. <https://doi.org/10.1016/j.watres.2022.118342>

Román‐Sánchez, A., Laguna, A., Reimann, T., Giráldez, J. V., Peña, A., & Vanwalleghem, T. (2019). Bioturbation and erosion rates along the soil‐hillslope conveyor belt, part 2: Quantification using an analytical solution of the diffusion–advection equation. Earth Surface Processes and Landforms, 44(10), 2066–2080. <https://doi.org/10.1002/esp.4626>

Salvador-Blanes, S., Minasny, B., & McBratney, A. B. (2007). Modelling long-term in situ soil profile evolution: Application to the genesis of soil profiles containing stone layers. *European Journal of Soil Science*, *58*(6), 1535–1548. <https://doi.org/10.1111/j.1365-2389.2007.00961.x>

<!--chapter:end:05_model_review.Rmd-->

# Model Building



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

## Clay and Soil Transport via Diffusion

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

Where... Including non-local mixing complicates the model and requires more data on the behavior of bioturbators. In comparing models including and excluding non-local mixing, Jarvis et al. 2010 found models without non-local mixing underestimated surface translocation of particles (using 137Cs as tracer). Notably, the authors did not include erosion estimates in their model, which studies show is an important factor in the redistribution of material by bioturbation [citation]. Further study on the importance of modeling non-local mixing is required.

[note to self: burial versus erosion rate is a well-studied topic and is worth looking into here]

However, a primary interest of our model is the movement of material too large to be mixed by bioturbators, coarse fragments. Coarse fragments are included only in downward local soil movement. They move downwards to infill where material is excavated but are too large to be excavated themselves. Ignoring non-local and upward local mixing, flux of coarse fragments can be simplified to:

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
  ggtitle("Clay movement over time"
          , subtitle = "1 timestep = 10 years")
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

At the top and bottom of the profile, the above diffusion equations are adjusted to be zero. At the top, and erosion factor. Bulk density is assumed to be consistent throughout the profile.

## References

<!--chapter:end:06_model_building.Rmd-->

# Gamma Detectors



### Detector specs


|detector.name |detector.model |serial.number |
|:-------------|:--------------|:-------------|
|Alice         |BE3825         |13263         |
|Sweepea       |BE3825         |8970          |
|Popeye        |GC4018         |9944          |
|Oliveoyl      |GCW4023        |1570          |

<!--chapter:end:07_gamma_detectors.Rmd-->

# Radionuclide Sampling Protocol



## Background

Measurement of 137Cs and 210Pb inventories is a well-established method of measuring erosion, bioturbation, and sediment transport. They represent a relatively fieldwork-light, although technical, approach to measuring soil erosion across decade to century timescales. The core of the method is comparing 137Cs and/or 210Pb inventories between samples taken at erosional/depositional sites and an undisturbed reference site. Samples with a lesser inventory than the reference site reflect erosion, and cores with a greater inventory reflect deposition.

The International Atomic Energy Agency provides general guidelines for 137Cs and 210Pb use in “Guidelines for using fallout radionuclides to assess erosion and effectiveness of soil conservation strategies” 2014. In short, this method involves A) sampling an undisturbed reference site and an erosional/depositional site, B) preprocessing and analyzing samples for 137Cs and 210OPb activity in a lab on a germanium detector, and C) employing a model to convert radioisotope inventories to erosion rates. The application of this method depends on three assumptions on the behavior of these radioisotopes in the environment (IAEA, 2014):

1.  137Cs and 210Pb are spatially uniform across the study area.

2.  137Cs and 210Pb are rapidly and irreversibly absorbed to soil particles, limiting their movement to physical transport.

3.  137Cs and 210Pb depth distributions are equivalent, excluding physical movement of soil particles, between reference and sample sites.

However, as many authors explore, these assumptions are imperfect and demand the user consider multiple potential sources of error (Baccolo et al., 2023; Nolin et al., 1993; Parsons & Foster, 2011; Mabit et al., 2013). Following is a discussion of ‘areas of concern’ and how they are addressed in the literature and in review:

-   [Reference site selection]

-   [Reference site sampling]

-   [Erosion sample position]

-   [Erosion site sampling]

-   [Erosion sample positioning]

-   [Sample characteristics]

-   [Bioturbation and nuclide distribution]

-   [Reference site selection]

Reference site selection can be challenging, especially in study areas with unknown or highly variable land use. The IAEA guidelines provide the following criteria for reference site selection: the site should be 1) undisturbed and under consistent land-use since 1950, 2) within \~1 km of the sample area, and 3) not experiencing erosion or deposition. Hancock et al. 2008, additionally suggests selecting a reference site where precipitation, the driving factor of 137Cs/excess 210Pb deposition (IAEA, 2014), is expected to be similar to the erosional/depositional area. Additionally, if the reference site is in a forest, a larger number of cores should be taken to account for greater heterogeneity (IAEA, 2014). Cores should also be taken avoiding trees and areas of concentrated stemflow (Nolin et al., 1993).

### Reference site sampling

The assumption of an even distribution of fallout across the landscape is limited by several sources of small-scale variability. These include spatial differences in the soil properties that control 137Cs absorption, interception of depositional rainfall by vegetation, uptake of radioisotopes by plants, and animal or human disturbance (IAEA, 2014; Parsons & Foster, 2011; Mabit et al., 2013). To broadly account for this variability, taking replicate cores across the reference site is widely applied. The IAEA guidelines recommend a minimum of 10 - 15 samples per reference site. For a forested site, Nolin et al. 1993 provides equations to estimate the number of samples needed to achieve a specific allowable error and confidence level.

However, analyzing 10 – 15 samples can be expensive and time consuming, so many studies bulk reference cores after segmentation to reduce the number of samples to analyze (Arata et al., 2016; Baccolo et al., 2023; Hancock et al., 2008; Nolin et al., 1993). Bulking is also suggested by the IAEA. The downside to bulking samples, however, is the loss of data on the variability of radioisotope inventories across the reference site. Cost, time, and statistical rigor must all be considered when deciding to bulk or not bulk samples.

### Erosion sample positioning

Placement of cores along a hillslope is important to consider before sampling. The IAEA suggests, for a slope with minimal horizontal complexity, a minimum of 3 equally spaced samples along a transect. This is a common approach in the literature, followed by Elliott et al., 1989; Hancock et al., 2008; Nolin et al., 1993; and Wallbrink & Murray, 1996. For more complex slopes, additional cores from additional transects should be taken, but both strategies are compatible with most currently available inventory conversion models (IAEA, 2014). Additionally, there are newer models that allow for greater flexibility in sampling strategy and have demonstrated success under a variety of conditions (Baccolo et al., 2023; Arata et al., 2016). Given relatively equal core spacing along a transect, it also is worth considering what is being measured at each point: e.g. the magnitude of erosion and/or deposition. Elliott et al., 1989, provides a theoretical model for this, depicted below. However, this is dependent on the purpose of the study.

### Erosion site sampling

Accounting for small-scale variability is also important for erosion site sampling, but there is disagreement in the literature about sample numbers. It is relatively common to collect 1 - 5 soil cores at each erosion sampling point (Arata et al., 2016; Baccolo et al., 2023; Hancock et al., 2008; Nolin et al., 1993). This is also in agreement with the IAEA guidelines. However, Parsons & Foster 2011 raises the point that the small-scale variability in 137Cs distribution is not exclusive to the reference site, and that a similar number of replicates, 10 - 15, should be taken from each sampling point. Jarvis et al., 2010 employs this larger number of samples per site, although the focus of that study is not soil erosion. It is worth noting, the above studies with smaller core numbers do present compelling data, and some with comparable measurements by other methods.

### Sample characteristics

Finally, it is important to consider the characteristics of individual cores and samples (cores after bulking or segmenting, final products to be analyzed). For both reference and erosion sites, core depth and radius are important to consider. The IAEA provides guidelines for both. The standard recommendation is a corer diameter of 7 – 10 cm and a total depth of 30cm for reference and erosional sites and 40 – 60 cm for depositional sites. For the most part, this is consistent in the literature (Elliott et al., 1989; Hancock et al., 2008; Nolin et al., 1993; Baccolo et al., 2023; Arata et al., 2016; and Wallbrink & Murray, 1996). However, when many replicates are being taken and bulked, one may consider using a corer of a smaller diameter. Minimizing sample volume makes easier sample processing and more consistent homogenization (Nate Lund, personal observation).

In addition, for reference sites, the size of reference core segments is another consideration. Reference cores are segmented for three reasons: (1) to establish the reference inventory, (2) determine the depth profile of 137Cs and 210Pb (necessary for conversion models), and (3) determine the maximum depth of 137Cs and 210Pb activity to inform sampling depth (IAEA, 2014). The IAEA broadly recommends 2 – 5 cm. Smaller segments provide a more detailed activity-depth profile, but require more samples be analyzed.

### Bioturbation and nuclide distribution

Earthworm bioturbation is important factor to consider when converting from radioisotope inventories to erosion and deposition rates. Literature shows that earthworms have a significant impact on the 137Cs distribution in the profile—flattening the exponential decay expected under natural conditions (Jarvis et al., 2010; Tyler et al., 2001; VandenBygaart et al., 1998). VandenBygaart et al., 1998, also suggests a relationship between earthworm abundance and 137Cs redistribution. The consequences of this redistribution are twofold. One, bioturbation by deep-burrowing Lumbricus terrestris may extend the depth of 137Cs distribution beyond 30cm and require deeper sampling. Two, continuous mixing dilutes 137Cs concentration in eroding sediments, which without correction, may result in an underestimation of erosion rates.

### Radioisotope Sampling Protocol for Jumping Worm Erosion Project

## Protocol

(Adapted from IAEA guidelines with additions from the literature) 137Cs and 210Pb sampling has two components: establishing the reference inventory and sampling for erosion and deposition along a hillslope transect. In our study, the reference inventory will be established from two sites: one at the Minnesota Landscape Arboretum and another at Lake Rebecca. The reference inventory will be composed of 24 cores taken to a depth of 30 cm and segmented at 5 cm increments. 5 cm segments from all 12 cores will be bulked for a total of 6 reference inventory samples per site: 0-5cm, 5-10cm, 10-15cm, 15-20cm, 20-25cm, and 25-30cm. 7 erosion samples will be taken along a hillslope transect on the summit, shoulder, backslope, footslope and toeslope. Six 30 cm cores will be taken on each contour and bulked in entirety. 264 total cores will be taken for 54 samples to be analyzed on the gamma detector. Following is the sampling strategy model for a single reference and erosion site.

### Materials

-   Soil corer: ≥30 cm depth, 2.5 cm diameter

-   Sample bags

-   Towel and brush

-   Bucket (optional)

-   Sharpie

-   Ruler (cm)

-   Flags

-   GPS

### Protocol (adapted from IAEA guidelines)

1.  Prior to sampling, either just in the field or using GIS, determine and flag the location of all points you will take cores from. Reference diagram above.

Note: Samples should be taken avoiding trees, large roots, downed logs, or any other large disturbance.

2.  Label all bags before sampling.
3.  Insert the soil corer vertically, not perpendicular to the hillslope, down to 30cm.
4.  Pull the corer straight up, and immediately turn the corer sideways to prevent soil from falling out. For very loose or sandy soils, you may need to place a hand at the mouth of the core as it is pulled out.
5.  For reference site replicates, either place the core in the gutter to segment, or segment in the corer, whichever is more convenient.
6.  If possible, sharpie depth increments onto the corer before you start.
7.  Store cores in labeled bags as soon as possible.
8.  Using the towel and brush, clean out the corer between samples—especially the mouth of the corer. It is not necessary to clean between sample replicates. But it is necessary to clean between reference replicates.

Repeat.

[**References**]

Updated 9/18/2024

Arata, L., Meusburger, K., Frenkel, E., A’Campo-Neuen, A., Iurian, A. R., Ketterer, M. E., Mabit, L., & Alewell, C. (2016). Modelling Deposition and Erosion rates with RadioNuclides (MODERN)—Part 1: A new conversion model to derive soil redistribution rates from inventories of fallout radionuclides. Journal of Environmental Radioactivity, 162–163, 45–55. <https://doi.org/10.1016/j.jenvrad.2016.05.008>

Baccolo, G., El Khair, D. A., Nastasi, M., Sisti, M., Ferrè, C., Alewell, C., & Comolli, R. (2023). 210Pbxs. Is a viable alternative to 137Cs for tracing soil redistribution in mountain pastures affected by heterogeneous Chernobyl fallout. Earth Surface Processes and Landforms, 48(4), 708–720. <https://doi.org/10.1002/esp.5512>

Crossley, D. A., Reichle, D. E., & Edwards, C. A. (1971). Intake and turnover of radioactive cesium by earthworms (Lumbricidae). Pedobiologia, 11(1), 71–76. [https://doi.org/10.1016/S0031-4056(23)00446-8](https://doi.org/10.1016/S0031-4056(23)00446-8)

Elliott, G. L., Campbell, B. L., & Shelly, D. J. ; C. (1989). A caesium-137-sediment hillslope model with tests from south-eastern Australia. Zeitschrift Für Geomorphologie, 33(2), 235–250.

Hancock, G. R., Loughran, R. J., Evans, K. G., & Balog, R. M. (2008). Estimation of Soil Erosion Using Field and Modelling Approaches in an Undisturbed Arnhem Land Catchment, Northern Territory, Australia. Geographical Research, 46(3), 333–349. <https://doi.org/10.1111/j.1745-5871.2008.00527.x>

International Atomic Energy Agency & Joint FAO/IAEA Division of Nuclear Techniques in Food and Agriculture. (2014). Guidelines for using fallout radionuclides to assess erosion and effectiveness of soil conservation strategies.

Janssen, M. P. M., Glastra, P., & Lembrechts, J. F. M. M. (1996). Uptake of cesium-134 by the earthworm species Eisenia foetida and Lumbricus rubellus. Environmental Toxicology and Chemistry, 15(6), 873–877. <https://doi.org/10.1002/etc.5620150608>

Jarvis, N. J., Taylor, A., Larsbo, M., Etana, A., & Rosén, K. (2010). Modelling the effects of bioturbation on the re-distribution of 137Cs in an undisturbed grassland soil. European Journal of Soil Science, *61*(1), 24–34. <https://doi.org/10.1111/j.1365-2389.2009.01209.x>

Mabit, L., Benmansour, M., Abril, J. M., Walling, D. E., Meusburger, K., Iurian, A. R., Bernard, C., Tarján, S., Owens, P. N., Blake, W. H., & Alewell, C. (2014). Fallout 210Pb as a soil and sediment tracer in catchment sediment budget investigations: A review. Earth-Science Reviews, 138, 335–351. <https://doi.org/10.1016/j.earscirev.2014.06.007>

Mabit, L., K. Meusburger, E. Fulajtar, and C. Alewell. “The Usefulness of 137Cs as a Tracer for Soil Erosion Assessment: A Critical Reply to Parsons and Foster (2011).” Earth-Science Reviews 127 (December 2013): 300–307. <https://doi.org/10.1016/j.earscirev.2013.05.008>

Nolin, M. C., Cao, Y. Z., Coote, D. R., & Wang, C. (1993). Short-range variability of fallout ^137^ Cs in an uneroded forest soil. Canadian Journal of Soil Science, 73(3), 381–385. <https://doi.org/10.4141/cjss93-040>

Parsons, A. J., & Foster, I. D. L. (2011). What can we learn about soil erosion from the use of 137Cs? Earth-Science Reviews, 108(1–2), 101–113. <https://doi.org/10.1016/j.earscirev.2011.06.004>

Tyler, A. N., Carter, S., Davidson, D. A., Long, D. J., & Tipping, R. (2001). The extent and significance of bioturbation on 137Cs distributions in upland soils. CATENA, 43(2), 81–99. [https://doi.org/10.1016/S0341-8162(00)00127-2](https://doi.org/10.1016/S0341-8162(00)00127-2)

VandenBygaart, A. J., Protz, R., Tomlin, A. D., & Miller, J. J. (1998). 137Cs as an indicator of earthworm activity in soils. Applied Soil Ecology, 9(1–3), 167–173. [https://doi.org/10.1016/S0929-1393(98)00071-7](https://doi.org/10.1016/S0929-1393(98)00071-7)

Wallbrink, P. J., & Murray, A. S. (1996). Determining Soil Loss Using the Inventory Ratio of Excess Lead-210 to Cesium-137. Soil Science Society of America Journal, 60(4), 1201–1208. <https://doi.org/10.2136/sssaj1996.03615995006000040035x>

<!--chapter:end:98_radionuclide_protocol.Rmd-->
