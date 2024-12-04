# Modeling Building



## Purpose and Goals

In a general sense, the purpose of this chapter is to create a quantitative framework, a model, to explore the relationship between bioturbation, erosion, and particle size distribution and their collective impact on soil profile and landscape development, across organisms.

To this end, the goal primary goal is to construct a model that integrates bioturbation, erosion, and particle size distribution on soil-profile and landscape scales. More specifically, to create a simple model, with a limited number of input parameters that can...

1.  Describe how bioturbation creates texture contrast in soils over time.
    1.  E.g. stoneline development or clay homogenization.
2.  Describe how erosion rate and particle-size sensitive erosion rate impact texture contrast development.
    1.  E.g. quantitatively model the dynamic denudation framework of Johnson et al. (2005a and 2005b).
3.  Describe how bioturbation drives soil texture variability across a landscape, including sediment supplied to streams.
4.  Accommodate changes in erosion and mixing rates at discrete time steps.
    1.  E.g. to simulate the impact of an invasive species or introduction of bioturbators.
5.  Represent a suite of bioturbators with unique particle size preferences and mixing rates and behaviors (see Chapter \@ref(review-animals-as-agents-of-heterogeneity-and-homogeneity-in-soil-and-landscape-development)).

## Single-profile diffusion

![Figure 1. Visualization of a single layer, i, and the upper and lower layers [this figure is a png now, build in r later if I want to keep]](images/clipboard-62785000.png){width="414"}

### Soil Mixing via Diffusion

The model is based on a layer system to approximate diffusion at depth. At each time step, the soil properties for each layer are calculated based on input parameters and the properties of the layer directly above and below. The model [currently] assumes steady state conditions: that erosion and soil formation are equivalent, regardless of soil depth. [Citation] says this is okay...

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

Where h~i~ is layer thickness (m). If the soil property, *y*, is included in the bulk soil being diffused, over time, diffusion will homogenize layers, as *y* ‘flows’ from layers of high to low concentration. This model only considers local mixing, and does not account for material that is excavated from one layer and deposited on the surface. Jarvis et al. (2010) and Mastisoff et al. (2011) suggest an additional factor in the diffusion-advection equation to account for non-local mixing. Local plus non-local mixing is described by:

$$
placeholder.equation
$$

Where... Including non-local mixing complicates the model and requires more data on the behavior of bioturbators. In comparing models including and excluding non-local mixing, Jarvis et al. 2010 found models without non-local mixing underestimated surface translocation of particles (using 137Cs as tracer). Notably, the authors did not include erosion estimates in their model, which studies show is an important factor in the redistrobtuoion of material by bioturbation (Mudd and Yoo, 2010) [review this citation again]. Further study on the importance of modeling non-local mixing is required.

[note to self: burial versus erosion rate is a well-studied topic and is worth looking into here]

However, a primary interest of our model is the movement of material too large to be mixed by bioturbators, coarse fragments. Coarse fragments are included only in downward local soil movement. They move downwards to infill where material is excavated but are too large to be excavated themselves. Ignoring non-local and upward local mixing, flux of coarse fragments can be described by:

$$
V_{S, net}=D(z_i)(S_i) + D(z_i+h)(S_{i+1}-S_i)
$$

Where S is the concentration of material of a greater size class than movable by present bioturbators.

### Erosion and Soil Formation

WIP

At the top and bottom of the profile, the above diffusion equations are adjusted to be zero. At the top, and erosion factor. Bulk density is assumed to be consistent throughout the profile.

## References
