pkgname <- "jsonify"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('jsonify')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("as.json")
### * as.json

flush(stderr()); flush(stdout())

### Name: as.json
### Title: Coerce string to JSON
### Aliases: as.json

### ** Examples


js <- '{"x":1,"y":2}'
as.json(js)




cleanEx()
nameEx("from_json")
### * from_json

flush(stderr()); flush(stdout())

### Name: from_json
### Title: From JSON
### Aliases: from_json

### ** Examples


from_json('{"a":[1, 2, 3]}')
from_json('{"a":8, "b":99.5, "c":true, "d":"cats", "e":[1, "cats", 3]}')
from_json('{"a":8, "b":{"c":123, "d":{"e":456}}}')

lst <- list("a" = 5L, "b" = 1.43, "c" = "cats", "d" = FALSE)
js <- jsonify::to_json(lst, unbox = TRUE)
from_json( js )

## Return a data frame
from_json('[{"id":1,"val":"a"},{"id":2,"val":"b"}]')

## Return a data frame with a list column
from_json('[{"id":1,"val":"a"},{"id":2,"val":["b","c"]}]')

## Without simplifying to a data.frame
from_json('[{"id":1,"val":"a"},{"id":2,"val":["b","c"]}]', simplify = FALSE )

## Missing JSON keys 
from_json('[{"x":1},{"x":2,"y":"hello"}]')

## Missing JSON keys - filling with NAs
from_json('[{"x":1},{"x":2,"y":"hello"}]', fill_na = TRUE )

## Duplicate object keys
from_json('[{"x":1,"x":"a"},{"x":2,"x":"b"}]')

from_json('[{"id":1,"val":"a","val":1},{"id":2,"val":"b"}]', fill_na = TRUE )





cleanEx()
nameEx("minify_json")
### * minify_json

flush(stderr()); flush(stdout())

### Name: minify_json
### Title: Minify Json
### Aliases: minify_json

### ** Examples


df <- data.frame(id = 1:10, val = rnorm(10))
js <- to_json( df )
jsp <- pretty_json(js)
minify_json( jsp )




cleanEx()
nameEx("pretty_json")
### * pretty_json

flush(stderr()); flush(stdout())

### Name: pretty_json
### Title: Pretty Json
### Aliases: pretty_json

### ** Examples


df <- data.frame(id = 1:10, val = rnorm(10))
js <- to_json( df )
pretty_json(js)

## can also use directly on an R object
pretty_json( df )




cleanEx()
nameEx("to_json")
### * to_json

flush(stderr()); flush(stdout())

### Name: to_json
### Title: To JSON
### Aliases: to_json

### ** Examples


to_json(1:3)
to_json(letters[1:3])
to_json(data.frame(x = 1:3, y = letters[1:3]))
to_json(list(x = 1:3, y = list(z = letters[1:3])))
to_json(seq(as.Date("2018-01-01"), as.Date("2018-01-05"), length.out = 5))
to_json(seq(as.Date("2018-01-01"), as.Date("2018-01-05"), length.out = 5), numeric_dates = FALSE)

psx <- seq(
  as.POSIXct("2018-01-01", tz = "Australia/Melbourne"), 
  as.POSIXct("2018-02-01", tz = "Australia/Melbourne"), 
  length.out = 5
  )
to_json(psx)
to_json(psx, numeric_dates = FALSE)

## unbox single-value arrays
to_json(list(x = 1), unbox = TRUE)
to_json(list(x = 1, y = c("a"), z = list(x = 2, y = c("b"))), unbox = TRUE)

## rounding numbers using the digits argument
to_json(1.23456789, digits = 2)
df <- data.frame(x = 1L:3L, y = rnorm(3), z = letters[1:3])
to_json(df, digits = 0 )

## keeping factors
to_json(df, digits = 2, factors_as_string = FALSE )





cleanEx()
nameEx("validate_json")
### * validate_json

flush(stderr()); flush(stdout())

### Name: validate_json
### Title: validate JSON
### Aliases: validate_json

### ** Examples


validate_json('[]')
df <- data.frame(id = 1:5, val = letters[1:5])
validate_json( to_json(df) )

validate_json('{"x":1,"y":2,"z":"a"}')

validate_json( c('{"x":1,"y":2,"z":"a"}', to_json(df) ) )
validate_json( c('{"x":1,"y":2,"z":a}', to_json(df) ) )




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
