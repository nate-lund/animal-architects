# Chapter II Notes



## Conceptual Models

Define conceptual model: A conceptual model is a representation of the key elements of and relationships within some process or structure. Justify the need for conceptual models for animal activity:

-   They provide a framework for explaining the existence of and relationships between real observations.

-   As pedologists, we rely on conceptual models to describe morphology and ‘tell the story’ of a soil.

-   They inform the questions we ask about and methods we use to measure a soil or animal activity.

-   Before constructing a numerical model, we need to identify the processes that are relevant to our aim. That aim could be describing soil genesis or contaminant transport, carbon or nutrient cycling, erosion, etc.

The central idea of this section is to assess the role of animals in soil and landscape development. Specifically, to collect evidence for the statement:

> Animals unintentionally create heterogeneity and homogeneity in soil and landscape development.

It begs the question, what kind of framework, whether qualitative or quantitative, can we create to broadly understand the role of organisms in soil and landscape development?

### Factors of animal activity

-   Spatial variability

    -   What is the lateral distribution of organisms' disturbance [Hartemink et al., 2020]?

    -   How does organism activity change with depth?

    -   What is the relationship between disturbance size, distribution/frequency, and organisms/area?

    -   How is organism activity related to topography or erosion?

-   Local vs. non-local mixing

    -   Where is excavated material going? Are they constructing mounds and burrows or just pushing soil out of the way? If building mounds, are those mounds directly above or is soil also being moved laterally?

    -   How is soil altered as it is transported [OM, structure change]?

-   Mixing vs sorting

    -   What are organisms moving?

    -   What aren't they moving?

    -   Where are they moving it to?

-   Time

    -   How are the above changing over time?

    -   What kind of feed back loops might organisms being encouraging?

### Review of conceptual models

Hans Jenny (1941) provides an elegant framework to describe soil formation:

$$
S = f(cl, o, r, p, t)
$$

Where soil (S) is a function (f()) of climate (cl), organisms (o), relief (r), parent material (p), and time (t). Jenny's model is a powerful conceptual tool qualify the soil forming processes. Wilde (1946, p. 13) [found from Johnson & Watson-Stegner (1987)] suggests a slightly updated framework where prior factors are considered over time:

$$
S = f(cl, o, r, p)dt
$$

### New conceptual models

Jenny's model is factorial approach that describes the exogenous/environmental properties influencing soil development. However, a perhaps more useful tool for soil and landscape modeling (conceptually and literally) is a process-based approach. Jenny's original four variables can instead by described by several processes:

| Factor          | Example process                                   |
|-----------------|---------------------------------------------------|
| climate         | precipitation, eluviation, illuviation, advection |
| organisms       | bioturbation, diffusion                           |
| relief          | erosion, deposition, uplift                       |
| parent material | soil texture, weathering                          |

: cloprt factors to processes

In the context of a landscape where bioturbation is present and substantial, I propose the following approach:

$$
S = f(D, E, P,\frac{dD}{dz},\frac{dP}{dz})dt
$$

Where D is diffusion or mixing, E is erosion, and P is soil production. Soil production and diffusion notably also change with profile depth, which depends on the parent material and organisms.

An alternative, more geomorphological approach (that requires a considerably long timescale) could integrate landscape-scale diffusion and stream-power-based erosion plus uplift variables into a clorpt model by the following thought process. On a landscape scale, erosion can be described by:

$$
ε = KA^mS^n+D\frac{d^2z}{dx^2}
$$

Where erosion is equal to the sum of stream-power-based erosion and diffusion. Including uplift, we can express the standard landscape evolution equation:

$$
\frac{dz}{dt} = U - KA^mS^n-D\frac{d^2z}{dx^2}
$$

Over sufficiently long timescales, a system will eventually reach steady-state conditions, at which dz/dt is equal to zero. The above equation can then be rearranged to describe erosion rate as a function of U:

$$
U = KA^mS^n+D\frac{d^2z}{dx^2}
$$

U can then be substituted into the cloprt model:

$$
S = f(D, U, P,\frac{dD}{dz},\frac{dP}{dz})dt
$$

In another form, soil formation can be described as a piecewise function of soil depth:

\begin{equation}
formation(z) =
  \left\{\begin{array}{lr}
     erosion/deposition(z), & z = 0 \\
     mixing(z), & 0 < z < f \\
     production(z), & z = f 
  \end{array}\right.
\end{equation}

All of these equations provide only a conceptual model to identify the internal and external processes that are forming soil. They provide a lense through which soils and landscapes can be viewed. The rest of this section focuses on this qualitative side, whereas the following modeling sections represent a quantitative approach.


### References

Baxter, Timothy, Sam Woor, Martin Coombes, and Heather Viles. “The Geomorphic Work of the European Mole ( [*Talpa europaea*]{.smallcaps} ): Long‐term Monitoring of Molehills Using Structure‐from‐motion Photogrammetry.” *Earth Surface Processes and Landforms*, October 13, 2024, esp.6008. <https://doi.org/10.1002/esp.6008>.

Cox, G. W., & Allen, D. W. (1987). Soil translocation by pocket gophers in a Mima moundfield. Oecologia 72, 207-210.

Grinnell, Joseph. “THE BURROWING RODENTS OF CALIFORNIA AS AGENTS IN SOIL FORMATIONl.” *JOURNAL OF MAMMALOGY*, 1923.

Hansen, R. M. (n.d.). MOVEMENT OF ROCKS BY NORTHERN POCKET GOPI-IERS. 49.

Miller, M. A. (1957). Burrows of the Sacramento Valley pocket gopher in flood-irrigated alfalfa fields. Hilgardia, 26(8), 431–452. <https://doi.org/10.3733/hilg.v26n08p431>

Nye, P. H. “Some Soil-Forming Processes in the Humid Tropics.” *Journal of Soil Science* 5, no. 1 (1954): 7–21. <https://doi.org/10.1111/j.1365-2389.1954.tb02171.x>.

Yeates, G. W., & Van Der Meulen, H. (1995). Burial of soil-surface artifacts in the presence of lumbricid earthworms. Biology and Fertility of Soils, 19(1), 73–74. <https://doi.org/10.1007/BF00336350>

Gabet, Emmanuel J., O.J. Reichman, and Eric W. Seabloom. “The Effects of Bioturbation on Soil Processes and Sediment Transport.” *Annual Review of Earth and Planetary Sciences* 31, no. 1 (May 2003): 249–73. <https://doi.org/10.1146/annurev.earth.31.100901.141314>.

Gabet, Emmanuel J. “Gopher Bioturbation: Field Evidence for Non-Linear Hillslope Diffusion.” *Earth Surface Processes and Landforms* 25, no. 13 (2000): 1419–28. [https://doi.org/10.1002/1096-9837(200012)25:13\<1419::AID-ESP1483.0.CO;2-1](https://doi.org/10.1002/1096-9837(200012)25:13%3C1419::AID-ESP148%3E3.0.CO;2-1).

Jenny, H. (1941). *Factors of Soil Formation A System of Quantitative Pedology*.  Dover Publications.

Johnson, D. L., and D. Watson-Stegner. “EVOLUTION MODEL OF PEDOGENESIS:” *Soil Science* 143, no. 5 (May 1987): 349–66. <https://doi.org/10.1097/00010694-198705000-00005>.
