# (PART) Chapter II: Bioturbation Review and Modeling {.unnumbered}

# Chapter Outline (start here)



## Brief Outline

1.  Introduction
2.  Conceptual models
    1.  Definitions / Justification
    2.  Review of conceptual models
    3.  Factors of animal activity
    4.  New conceptual models
    5.  Examples from the literature
3.  Numerical models
    1.  Transition / Justification
    2.  Examples of numerical model use
    3.  Characteristics of numerical models
    4.  Review of equations from the literature
    5.  Modeling factors of animal activity
4.  Numerical model building
    1.  Purpose / Goals
    2.  Identification of most key factors/variables
    3.  Assumptions and methods
    4.  Test results
    5.  Verification and data mined data
5.  Conclusion

## Detailed Outline

### Introduction

Provide a background and on role of animals in soil development. Introduce some of the important figures in pedology that discussed animal activity: Fallou, Darwin, Dokucahev, Jenny [Chapter \@ref(a-brief-history-of-pedology)], to establish importance. Draw connections from pedology to ecology, geomorpohology, and hydrology or more specifically carbon, soil health, and mineral weathering [Mudd and Yoo, 2010]. Use established importance to address the need for an updated, interdisciplinary review of how we think about bioturbation, both conceptually and numerically. Provide an overview of the questions answered and ultimate purpose of this article: How can we, and how have other authors, summarize what are animals doing to the soil?

### Conceptual models

Define conceptual model: A conceptual model is a representation of the key elements of and relationships within some process or structure. Justify the need for conceptual models for animal activity:

-   They provide a framework for explaining the existence of and relationships between real observations.

-   As pedologists, we rely on conceptual models to describe morphology and 'tell the story' of a soil.

-   They inform the questions we ask about and methods we use to measure a soil or animal activity.

-   Before constructing a numerical model, we need to identify the processes that are relevant to our aim. That aim could be describing soil genesis or contaminant transport, carbon or nutrient cycling, erosion, etc.

Explore relevant conceptual models in the literature: cloprt [Jenny, 1941], soil evolution model [Johnson & Watson-Stegner, 1987], bio-mantle [Johnson, 2005], etc. Identifying characteristics of animal activity might allow one to estimate the overall impact of organisms. For pedology, this might result in progressive and/or regressive soil evolution. A complete conceptual model of animal-soil activity might include:

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

Integrate the most important above factors into new conceptual models. For example:

$$
S = f(D, E, P,\frac{dD}{dz},\frac{dP}{dz})dt
$$

Where D is diffusion or mixing, E is erosion, and P is soil production. Soil production and diffusion notably also change with profile depth, which depends on the parent material and organisms.

$$
disturbance = \frac{vol}{event} * \frac{distance}{event} * \frac{events}{area} * \frac{events}{time}
$$

Discuss some examples from the real-world, like jumping worms altering the bulk density of the top 5cm, Mima mounds, tree throw examples, or stonelines. Relate these examples to the concepts discussed above. Make notes on the way bioturbation is measured, methods used in the literature: what are they actually measuring?

### Numerical models

Explain importance: Conceptual models alone are valuable for describing a number of processes. However, quantitative, numerical models are a more powerful tool for answering questions and making predictions, and are can be informed by conceptual ones... Describe how numerical models have been used in the literature and the bridges between aquatic and terrestrial applications (including isotope tracers).

Characterize the different approaches/aspects to modeling:

-   Anomalous vs. normal mixing

-   Local diffusion vs. non-local mixing

-   Depth dependence

Describe how equations in the literature incorporate these approaches, providing equations to illustrate. For example (Boudreau, 1986):

$$
\frac{dρy}{dt}=\frac{d}{dz}(D(z\frac{dρy}{dx})-wρC)
$$

Discuss what variables these models include, and how these models integrate the animal-soil activity factors above. What is missing (erosion)? What assumptions are being made?

### Numerical model building

Describe the purpose: The purpose of this section is to create a quantitative framework, a model, to explore the relationship between bioturbation, erosion, and particle size distribution and their collective impact on soil profile and landscape development.

Identify the key variables: erosion rate, mixing rate, local vs. non-local ratio, change in animal activity with depth, bulk density, and soil property characteristics.

Describe methods [very WIP, considering using python and landlab for portions, need to investigate further]

### Conclusion

Present a summary of findings/discussion. Highlight some takeaways:

-   If you're a pedologist doing descriptions, leave a column open for animals. Note what organisms are present? How deep do they go? What is the lateral distribution/abundance of krotovinas or tree throw mounds? What structure or texture change might be a product of bioturbation?

-   If you're designing a study around bioturbation, consider what you are trying to measure. Consider what methods might be most applicable. And consider what kind of shared data is needed to maximize the value of your own.
