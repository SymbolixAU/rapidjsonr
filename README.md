
[![Travis build status](https://travis-ci.org/SymbolixAU/rapidjsonr.svg?branch=master)](https://travis-ci.org/SymbolixAU/rapidjsonr)

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


