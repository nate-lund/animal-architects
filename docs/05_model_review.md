# Bioturbation Modeling



The purpose of this section is to review the current state of the study and modeling of bioturbation.

The goals are to:

1.  Complete a review of the current bioturbation modeling landscape to answer the questions:
    -   What are the different approaches to modeling bioturbation or how can the current models be classified?
    -   What are the limitations or what is the applicability of theses models? What is their purpose?
    -   What spatial and temporal scale do models operate on? Soil profile or landscape? Decade or millennium?
2.  Compile annotated equations and variables used in modeling bioturbation.

### Model Characteristics

There are two approaches to modeling bioturbation in terrestrial and aquatic environments: anomalous mixing and normal mixing (Michel et al., 2022). Anomalous mixing models simulate the trajectory of individual sediment particles by capturing the discontinuous movement of particles in "jumps" between periods of waiting. Jump length and waiting time are the bioturbator-specific stochastic variables of interest, and are often used in random walk models (Meysman et al., 2010 in Michel et al., 2022). Of interest to this review, if simulation time and the number of translocation events are sufficiently large, anomalous mixing models coincide with the diffusive model (Michel et al., 2022). Further, "If σ and τ are finite... the ratio σ2/(2τ) is the biodiffusion coefficient. If moreover the mean μ of the jump-length distribution is non-zero, wb=μ/τ" (Michel et al., 2022).

> Sources to further look into: Meysman 2008: <https://doi.org/10.1016/j.gca.2008.04.023> Meysman 2010: <https://www.researchgate.net/publication/230736816_When_and_why_does_bioturbation_lead_to_diffusive_mixing> Marie 2007: <https://doi.org/10.1016/j.jembe.2006.10.052>

Normal mixing is described by a diffusion-advection equation and, as soil development occurs over very long timescales, is the focus of this review. Normal mixing can be further described as the sum of two components: [local]{.underline} and [non-local]{.underline} mixing (Michel et al., 2022). Local mixing represents the spatially random displacement of material in which the point of excavation is close to the point of deposition. In anomalous mixing terms, it is defined by short jump lengths and waiting times. Local mixing is the primary outcome of most bioturbators. Epi-, endo-, and epiendogeic earthworm species are all local mixers.

Non-local mixing represents the displacement of material in which the point of excavation is far from the point of deposition. Additionally, displacement from non-local mixing results in a net movement of excavated material to the soil surface. Excavation is later followed by infilling from local material [???]. In anomalous mixing terms, it is defined by long jump lengths and waiting times. Non-local mixing is common for mound building and burrowing organisms like Anecic earthworm species and pocket gophers.

Both local and non-local mixing represent a substantial movement of material but differ in scale. Local mixing acts on a horizon to horizon scale. Non-local mixing acts on a profile scale. Given enough time and stability, either may completely 'turn over' the profile. Jarvis et al. (2010) found that models excluding non-local mixing significantly underestimate surface burial. Matisoff et al. (2011) also integrate a non-local mixing factor into their model.

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

zb is the e-folding length scale (in meters)

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
