
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rapidjsonr)](http://cran.r-project.org/package=rapidjsonr)
![downloads](http://cranlogs.r-pkg.org/badges/grand-total/rapidjsonr)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/rapidjsonr)](http://cran.r-project.org/web/packages/rapidjsonr/index.html)
[![Github Stars](https://img.shields.io/github/stars/SymbolixAU/rapidjsonr.svg?style=social&label=Github)](https://github.com/SymbolixAU/rapidjsonr)
[![Build Status](https://travis-ci.org/SymbolixAU/rapidjsonr.svg?branch=master)](https://travis-ci.org/SymbolixAU/rapidjsonr)
[![Coverage Status](https://codecov.io/github/SymbolixAU/rapidjsonr/coverage.svg?branch=master)](https://codecov.io/github/SymbolixAU/rapidjsonr?branch=master)

# rapidjsonr

R interface to the C++ header-only [Rapidjson](https://github.com/Tencent/rapidjson) library

This package is using v1.1.0 of rapid json 

<!-- git clone https://github.com/tencent/rapidjson --branch v1.1.0 --depth 1 -->


## Install

Install the development version with

```
devtools::install_github("SymbolixAU/rapidjsonr")
```

When on CRAN you can install the release version with

```
install.packages("rapidjsonr")
```

## Using rapidjsonr


To use `rapidjsonr` in your own package, add a dependency to `rapidjsonr` to your cpp files **before** a call to `#include <Rcpp.h>`

```
// [[Rcpp::depends(rapidjsonr)]]

#include <Rcpp.h>
```

## License

This package is provided under the MIT license, as per Rapidjson itself. 


