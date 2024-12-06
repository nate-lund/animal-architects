# Bioturbation Models, in Revew



## Purpose and Goals

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
