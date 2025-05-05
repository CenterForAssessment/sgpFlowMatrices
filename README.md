sgpFlowMatrices
=============

[![R-CMD-check](https://github.com/CenterForAssessment/sgpFlowMatrices/workflows/R-CMD-check/badge.svg)](https://github.com/CenterForAssessment/sgpFlowMatrices/actions)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/centerforassessment/sgpFlowMatrices?branch=master&svg=true)](https://ci.appveyor.com/project/centerforassessment/sgpFlowMatrices)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sgpFlowMatrices)](http://cran.r-project.org/package=sgpFlowMatrices)
[![Development Version](https://img.shields.io/badge/devel-0.0--0.4-brightgreen.svg)](https://github.com/CenterForAssessment/sgpFlowMatrices)
[![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](https://github.com/CenterForAssessment/sgpFlowMatrices/blob/master/LICENSE.md)

# Overview

The **sgpFlowMatrices** package contains coefficient matrices derived from SGP analyses of large scale state assessment data. The coefficient matrices are utilized by functions within the sgpFlow package to calculate SGP lookup tables that are used to model student flow throughout the education system. The package is under active development by staff at the [Center for Assessment](https://www.nciea.org).

# Contents

The coefficient matrices embedded in **sgpFlowMatrices** are updated periodically. Current contents include:

* DEMO_sgpFlowMatrices: Contains single-cohort (2023-2024) and super-cohort (2020-2021 to 2023-2024) matrices DEMO based upon sgpDataLONG.

# Installation

To install the latest stable release of **sgpFlowMatrices** from [CRAN](https://CRAN.R-project.org/package=sgpFlowMatrices) (Currently not yet posted to CRAN)

```R
> install.packages("sgpFlowMatrices")
```

To install the development release of **sgpFlowMatrices** from [GitHub](https://github.com/CenterForAssessment/sgpFlowMatrices/):

```R
> devtools::install_github("CenterForAssessment/sgpFlowMatrices")
```

# Usage

To use **sgpFlowMatrices** please follow the directions in the [vignette](https://centerforassessment.github.io/sgpFlowMatrices/articles/sgpFlowMatrices.html)


# Resources

* [sgpFlowMatrices GitHub Pages](https://CenterForAssessment.github.io/sgpFlowMatrices)
* [CRAN Repo](https://CRAN.R-project.org/package=sgpFlowMatrices)

# Contributors

The **sgpFlowMatrices** Package is crafted with :heart: by:

* [Damian Betebenner](https://github.com/dbetebenner)
* [Adam Van Iwaarden](https://github.com/adamvi)

We love feedback and are happy to answer questions or support requests for additional features to the package.
