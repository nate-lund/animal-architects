# Numerical Models



The purpose of this section is to review the current state of the study and modeling of bioturbation.

The goals are to:

1.  Complete a review of the current bioturbation modeling landscape to answer the questions:
    -   What are the different approaches to modeling bioturbation or how can the current models be classified?
    -   What are the limitations or what is the applicability of theses models? What is their purpose?
    -   What spatial and temporal scale do models operate on? Soil profile or landscape? Decade or millennium?
2.  Compile annotated equations and variables used in modeling bioturbation.

## Model Characteristics

### Anomalous and Normal mixing

There are two broad approaches to modeling bioturbation in terrestrial and aquatic environments: anomalous mixing and normal mixing. Anomalous mixing models simulate the trajectory of individual sediment particles by capturing their discontinuous movement in "jumps" between periods of waiting (Michel et al., 2022). Jump length and waiting time, both organism-specific stochastic variables, are employed to simulate mixing over short periods of time (Meysman et al., 2010 in Michel et al., 2022). Normal mixing is analogous with a the diffusion process and is described by a diffusion-advection equation. Of interest to this review, if simulation time and the number of translocation events are sufficiently large, anomalous mixing models coincide with the diffusive model (Michel et al., 2022). Further, "If σ and τ are finite... the ratio σ2/(2τ) is the biodiffusion coefficient. If moreover the mean μ of the jump-length distribution is non-zero, wb=μ/τ" (Michel et al., 2022). As soil development, the focus of this review, occurs over relativity long periods, normal mixing is the primary approach explored here.

> Sources to further look into: Meysman 2008: <https://doi.org/10.1016/j.gca.2008.04.023> Meysman 2010: <https://www.researchgate.net/publication/230736816_When_and_why_does_bioturbation_lead_to_diffusive_mixing> Marie 2007: <https://doi.org/10.1016/j.jembe.2006.10.052>

### Local diffusion and Non-local mixing

Normal mixing can be further described as the sum of two components: [local]{.underline} and [non-local]{.underline} mixing. To illustrate, imagine burying a marble at the bottom of a bucket of sand. To get the marble out, you have two options. Non-local mixing is like digging sand out and piling it up on the side. Local mixing is like forcing your hand through the loosely packed sand, displacing it as you go.

Formally, local mixing represents the spatially random displacement of material in which the point of excavation is close to the point of deposition (Michel et al., 2022). It is also defined as movment across a distance over which the change in soil composition is minimal (Boudreau, 1986a). When mixing is described by frequent, short-distanced translocations in random directions, it is defined as local mixing, and can be approximately described by Fick's Law of diffusion (citation). Correspondingly, when soil is mixed, soil components will move diffusely across concentration gradients.

Local mixing common for most bioturbators and includes ingestion/egestion, pushing/shouldering of particles, and local digging/foraging... (citations to break these down). Epi-, endo-, and epiendogeic earthworm species are all local mixers (citation). More examples...

[Boudreau (1986a) suggests non-local mixing cannot be defined by diffusion. Keep reading.]

Non-local mixing represents the displacement of material in which the point of excavation is far from the point of deposition. Its characterized by translocation of excavated material to the soil surface followed by infilling from local material [???].

Non-local mixing is common for mound building and burrowing organisms like Anecic earthworm species and pocket gophers.

Both local and non-local mixing represent a substantial movement of material but differ in scale. Local mixing acts on a horizon to horizon scale. Non-local mixing acts on a profile scale. Given enough time and stability, either may completely 'turn over' the profile. Jarvis et al. (2010) found that models excluding non-local mixing significantly underestimate surface burial. Matisoff et al. (2011) also integrate a non-local mixing factor into their model.

Decline in organism activity with depth.

## Local Mixing models

Johnson et al. (2014) provides a simple diffusion model for change in a soil property, y, with time.

$$
\frac{dy}{dt} = \frac{d}{dz}(D(z)\frac{dy}{dz})
$$

where an exponential or linear relationship between diffusion and depth is assumed:

$$
D(z) = D(0)e^{-z/z_{b}}
$$

$$
D(z)=-az+D(0)
$$

where zb is the e-folding length scale (in meters) and a is the gradient of the slope (including where diffusion is constant w/ depth, a = 0). The diffusion equation is solved numerically using OSL data.

Jarvis et al. (2010) and Matisoff et al. (2011) apply similar equations derived in Boudreau (1986) in using radioisotope tracers.

$$
\frac{dρy}{dt}=\frac{d}{dz}(D(z\frac{dρy}{dx})-wρC)
$$

Where w is rate of downward soil displacement or soil velocity (m/s), which can be constant or a function of depth. This function has the advantage of integrating depth-dependent soil bulk density (ρ).

## References

Boudreau, B. P. “Mathematics of Tracer Mixing in Sediments; II, Nonlocal Mixing and Biological Conveyor-Belt Phenomena.” *American Journal of Science* 286, no. 3 (March 1, 1986): 199–238. <https://doi.org/10.2475/ajs.286.3.199>.

Boudreau, B. P., and D. M. Imboden. “Mathematics of Tracer Mixing in Sediments; III, The Theory of Nonlocal Mixing within Sediments.” *American Journal of Science* 287, no. 7 (September 1, 1987): 693–719. <https://doi.org/10.2475/ajs.287.7.693>.

Jarvis, N. J., Taylor, A., Larsbo, M., Etana, A., & Rosén, K. (2010). Modelling the effects of bioturbation on the re-distribution of 137Cs in an undisturbed grassland soil. European Journal of Soil Science, 61(1), 24–34. <https://doi.org/10.1111/j.1365-2389.2009.01209.x>

Johnson, D. L., Domier, J. E. J., & Johnson, D. N. (2005a). Animating the biodynamics of soil thickness using process vector analysis: A dynamic denudation approach to soil formation. Geomorphology, 67(1–2), 23–46. <https://doi.org/10.1016/j.geomorph.2004.08.014>

Johnson, D. L., Domier, J. E. J., & Johnson, D. N. (2005b). Reflections on the Nature of Soil and Its Biomantle. Annals of the Association of American Geographers, 95(1), 11–31. <https://doi.org/10.1111/j.1467-8306.2005.00448.x>

Johnson, M. O., Mudd, S. M., Pillans, B., Spooner, N. A., Keith Fifield, L., Kirkby, M. J., & Gloor, M. (2014). Quantifying the rate and depth dependence of bioturbation based on optically‐stimulated luminescence (OSL) dates and meteoric 10 Be. Earth Surface Processes and Landforms, 39(9), 1188–1196. <https://doi.org/10.1002/esp.3520>

Matisoff, G., Ketterer, M. E., Rosén, K., Mietelski, J. W., Vitko, L. F., Persson, H., & Lokas, E. (2011). Downward migration of Chernobyl-derived radionuclides in soils in Poland and Sweden. Applied Geochemistry, 26(1), 105–115. <https://doi.org/10.1016/j.apgeochem.2010.11.007>

Michel, E., Néel, M.-C., Capowiez, Y., Sammartino, S., Lafolie, F., Renault, P., & Pelosi, C. (2022). Making Waves: Modeling bioturbation in soils – are we burrowing in the right direction? Water Research, 216, 118342. <https://doi.org/10.1016/j.watres.2022.118342>

Román‐Sánchez, A., Laguna, A., Reimann, T., Giráldez, J. V., Peña, A., & Vanwalleghem, T. (2019). Bioturbation and erosion rates along the soil‐hillslope conveyor belt, part 2: Quantification using an analytical solution of the diffusion–advection equation. Earth Surface Processes and Landforms, 44(10), 2066–2080. <https://doi.org/10.1002/esp.4626>

Salvador-Blanes, S., Minasny, B., & McBratney, A. B. (2007). Modelling long-term in situ soil profile evolution: Application to the genesis of soil profiles containing stone layers. European Journal of Soil Science, 58(6), 1535–1548. <https://doi.org/10.1111/j.1365-2389.2007.00961.x>
