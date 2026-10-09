
<!-- README.md is generated from README.Rmd. Please edit that file -->

# landscapeR

<!-- badges: start -->

<!-- badges: end -->

The goal of landscapeR is to provide some basic utilities to make
developing the second ZERO2 landscape manuscript easier.

## Installation

You can install the development version of landscapeR from
[GitHub](https://github.com/) with:

``` r
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

pak::pak("selkamand/landscapeR")
```

## Quick Start

``` r
library(landscapeR)
library(ggplot2)
library(scales)
#> Warning: package 'scales' was built under R version 4.4.1

# Basic theme for plots
iris |>
  ggplot(aes(x = Petal.Width, y = Petal.Length)) +
  geom_point() +
  theme_landscape2()
```

<img src="man/figures/README-quick-start-1.png" width="100%" />

``` r

# Basic colour schemes
palette_cancer_category() |> preview_palette()
```

<img src="man/figures/README-quick-start-2.png" width="100%" />

``` r
palette_event() |> preview_palette()
```

<img src="man/figures/README-quick-start-3.png" width="100%" />

## Requesting a change

Create a github issue with your request or a PR with the code already
added.

## Saving plots

Ensure all plots are vector graphics and are exported to PDF format
e.g. using `ggplot2::ggsave` or the helper `save_ggplot_as_pdf`. Please
explicitly specify plot dimensions using `width` and `height` argument

``` r
# Create plot
gg <- iris |>
  ggplot(aes(x = Petal.Width, y = Petal.Length)) +
  geom_point() +
  theme_landscape2()

# Print plot
gg

# Save as pdf
save_ggplot_as_pdf(
  gg,
  outdir = "figures",
  prefix = "iris",
  width = 2,
  height = 2,
  units = "in"
)
```
