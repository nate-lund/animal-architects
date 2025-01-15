---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART) Chapter III: Modeling Soil, Hillslope, Landscape Evolution {.unnumbered}

# Soil Geomorphology



"Simplicity you can argue for."

## Important equations / variables

Hill slope creep
$$
\frac{dz}{dt}=D\frac{d^2z}{dx^2}
$$

Soil mixing
$$
\frac{dy}{dz}=D(z)\frac{dy}{dz}+\frac{dz}{dt}\frac{dy}{dz}
$$

Diffusion coefficient
$$
D(z)=D_0e^{-z/z_b}
$$
Soil Production
$$
P = e^{-az}
$$


## Resources

Dissertation using landlab: Mahmoudi, M. (2018). **Comparing model
predictions of hillslope sediment size distribution with field
measurements** (Doctoral dissertation, San Francisco State University).

## Notes

-   Use landlab to simulate hillslope evolution under different
    earthworms / bioturbation types? Broaden to landscape scale? Include
    sediment contribution to streams?

-   Simulate Mima mound creation by pocket gophers using a landlab
    module?

![From Johnson and Watson-Stegner
(1987)](images/clipboard-152616148.png)
