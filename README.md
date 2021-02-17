# An R Package for Fast Sampling from von Mises Fisher Distribution
The **vMF** package implements fast sampling from von Mises-Fisher distribution use the method proposed by Andrew T.A Wood (1994) <doi:10.1080/03610919408813161>.

## Installation
### Requirements
- **vMF** package needs [**R**](https://cran.r-project.org/) version 3.0.0 or later which can be installed on Linux, Mac and Windows. See [**CRAN**](https://cran.r-project.org/) for installation details.
- [**devtools**](https://cran.r-project.org/package=devtools) package should be installed on [**R**](https://cran.r-project.org/). If not already done, install [**devtools**](https://cran.r-project.org/package=devtools) using the code ` install.packages("devtools") `.
- (*Only for windows users*) Windows users should install  [**Rtools**](https://cran.r-project.org/bin/windows/Rtools/) compatible with their [**R**](https://cran.r-project.org/) version.

### How to install
**vMF** package can be installed from this GitHub repos using the `install_github` function of the [**devtools**](https://cran.r-project.org/package=devtools) package. All the dependencies will also be installed automatically.
```R
library(devtools)
install_github("ahoundetoungan/vMF")
```
The option `build_vignettes = TRUE` can be added if one desires to install the vignettes (this will take several minutes).
### Load vMF
Once the installation is done, **vMF** can be loaded as a common package in [**R**](https://cran.r-project.org/).
```R
library(vMF)
```
### How to use vMF
I provide a [vignette](https://nbviewer.jupyter.org/github/ahoundetoungan/vMF/blob/master/doc/vMF.pdf) that fully documents the package. Moreover, each function of the package has a help page accessible using `?name-of-the-function`. 
