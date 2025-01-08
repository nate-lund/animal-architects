# Numerical Models





## Transition / Justification

Conceptual models alone are valuable for describing a number of processes. However, quantitative, numerical models are a more powerful tool for answering questions and making predictions, and are can be informed by conceptual ones…

Relevant to aquatic and terrestrial environments.

## Examples of numerical model application

Tracers to estimate organism bioturbation rate, OSL for soil age.

## Characteristics of Numerical models

### Depth dependence

Most bioturbation models consider the observation made by scientists as far back as Charles Darwin that organism activity declines with depth (Darwin, 1881) [citations]. Intuitively, greater soil depths are not as attractive to soil fauna because of increased soil density and a diminishing food supply (citation). However, a degree of nuance is needed to understand when this observation is relevant to modeling. Depth dependence is relevant under the following conditions. 1) Organism activity does not encompass the entire profile. 2) The system is not in equilibrium, or too little time has passed for bioturbation to homogenize the soil profile. 3) The rate of mixing is large compared to soil erosion or production. 4) Material that is introduced to the profile decays, weathers, or is otherwise transformed at a rate neither too fast to be meaningfully redistributed by fauna nor to slow to reach equilibrium. If one or multiple of these conditions are met, a diffusion-depth function is needed. [are examples needed to illustrate this?] Boudreau (1986a) provides equations for when these conditions are met for specific radioisotope tracers.

When depth dependence is relevant, a function that describes the diffusion-depth relationship is derived. Most often, it is found by statistically fitting a function to quartz grain age or isotope tracers from samples taken at several depth increments (Gray et al., 2020; Jarvis et al. 2010; Johnson et al., 2014; Matisoff et al., 2011) [there are more studies to included here, one that I cannot find]. There is as general consensus among these studies that diffusion depth-dependence is ubiquitous across environments and is generally best described by an exponential function (citation). Notably, however, the shape of the functions described by these authors varies [Table X], which challenges attempts to broaden model application.

[I need to look into this further and compare the diffusion-depth functions. also, are there other ways of estimating diffusion depth? is there a way to create a general form? what is the biggest limitation: it is maximum depth or shape? this is notwithstanding any non-local diffusion.]

|                        |          |           |
|------------------------|----------|-----------|
| Source                 | Equation | Intercept |
| Gray et al. (2020)     |          |           |
| Jarvis et al. (2010)   |          |           |
| Johnson et al. (2014)  |          |           |
| Matisoff et al. (2011) |          |           |

: Table X

### Anomalous and Normal mixing

There are two broad approaches to modeling bioturbation in terrestrial and aquatic environments: anomalous mixing and normal mixing. Anomalous mixing models simulate the trajectory of individual sediment particles by capturing their discontinuous movement in "jumps" between periods of waiting (Michel et al., 2022). Jump length and waiting time, both organism-specific stochastic variables, are modeled to simulate mixing over short periods of time (Meysman et al., 2010 in Michel et al., 2022). Normal mixing is analogous with the diffusion process and is described by a diffusion-advection equation. Of interest to this review, if simulation time and jump counts are sufficiently large, anomalous mixing models coincide with the diffusive model (Michel et al., 2022) [further reading needed]. Further, the mathematics overlap, and the biodiffusion coefficient can be described as... [a function of jump length]. As soil development occurs over relativity long periods is the focus of this review, normal mixing is the primary approach explored here.

[Sources to further look into]

-   Meysman 2008: <https://doi.org/10.1016/j.gca.2008.04.023>

-   Meysman 2010: <https://www.researchgate.net/publication/230736816_When_and_why_does_bioturbation_lead_to_diffusive_mixing>

-   Marie 2007: <https://doi.org/10.1016/j.jembe.2006.10.052>

### Local diffusion and Non-local mixing

Normal mixing is further described as the sum of two components: [local]{.underline} and [non-local]{.underline} mixing, each of which can be modeled. To illustrate the difference, imagine burying a marble at the bottom of a bucket of sand. To get the marble out, you have two options. Digging sand out and piling it up on the side is comparable to non-local mixing. Forcing your hand through the loosely packed sand, displacing it as you go, is similar to local mixing.

Formally, local mixing is the random displacement of material across distances over which the change in soil composition is minimal (Boudreau, 1986a). Because translocation distance is small and randomly determined, local mixing is approximately described by a diffusion-advection equation. Correspondingly, when soil is mixed, soil components will move diffusely across concentration gradients. Local mixing is common for most bioturbators and includes ingestion/egestion, pushing/shouldering of particles, and local digging/foraging... [citation to break these down]. Epi-, endo-, and epiendogeic earthworm species are all local mixers. More examples...

Non-local mixing represents the displacement of material in which the point of excavation is far from the point of deposition. Its characterized by translocation of excavated material to the soil surface followed by infilling from local material [???].

[Boudreau (1986a) suggests non-local mixing cannot be defined by diffusion. Keep reading.]

Non-local mixing is common for mound building and burrowing organisms like Anecic earthworm species and pocket gophers.

Both local and non-local mixing represent a substantial movement of material but differ in scale. Local mixing acts on a horizon to horizon scale. Non-local mixing acts on a profile scale. Given enough time and stability, either may completely 'turn over' the profile. Jarvis et al. (2010) found that models excluding non-local mixing significantly underestimate surface burial. Matisoff et al. (2011) also integrate a non-local mixing factor into their model.

## Review of equations from the literature

*This first code chunk defines the shared structures and variables used by the following code chunks. It has no outputs itself.*












