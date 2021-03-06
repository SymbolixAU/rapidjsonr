context("read geojson")

test_that("can read from various sources", {

	skip_on_cran()
	skip_on_travis()

	url <- "http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_outline_500k.json"

	## direct from url
	con <- curl::curl(url)
	lines <- geojsonsf:::read_url(con)
	#close(con)
	expect_true(nchar(lines) == 1078089)

	sf <- geojson_sf(lines)
	sfc <- geojson_sfc(lines)

	expect_true(nrow(sf) == 615)
	expect_true(length(sfc) == 615)

	sf <- geojson_sf(url)
	sfc <- geojson_sfc(url)

	expect_true(all(class(sf) == c("sf", "data.frame")))
	expect_true(all(class(sfc) == c("sfc_LINESTRING", "sfc")))

	expect_true(nrow(sf) == 615)
	expect_true(length(sfc) == 615)

	## connection
	con <- curl::curl(url)
	sf <- geojson_sf(con)
	con <- curl::curl(url)
	sfc <- geojson_sfc(con)

	expect_true(all(class(sf) == c("sf", "data.frame")))
	expect_true(all(class(sfc) == c("sfc_LINESTRING", "sfc")))

	expect_true(nrow(sf) == 615)
	expect_true(length(sfc) == 615)

	## local file
	sf <- geojson_sf(geo_melbourne)
	sfc <- geojson_sfc(geo_melbourne)

	expect_true(nrow(sf) == length(sfc))
	expect_true(nrow(sf) == 41)

	sf <- geojson_sf(system.file("examples", "geo_melbourne.geojson", package = "geojsonsf"))
	sfc <- geojson_sfc(system.file("examples", "geo_melbourne.geojson", package = "geojsonsf"))

	expect_true(nrow(sf) == length(sfc))
	expect_true(nrow(sf) == 41)
})

test_that("read utils work", {
	expect_true(geojsonsf:::is_url("http://www"))
	expect_true(geojsonsf:::is_url("https://www"))
	expect_false(geojsonsf:::is_url("me.com"))
})

test_that("read_rul works", {
	skip_on_cran()
	skip_on_travis()

	url <- "http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_outline_500k.json"
	con <- curl::curl(url)
	geo <- geojsonsf:::read_url(con)
	expect_true(nchar(geo) == 1078089)

	url <- "http://notaurl"
	con <- curl::curl(url)
	expect_error(geojsonsf:::read_url(con), "There was an error downloading the geojson")
})

