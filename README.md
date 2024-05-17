
# ffmpegrr

<!-- badges: start -->
<!-- badges: end -->

The goal of ffmpegrr is to concatenate video clips generated automatically by GoPro cameras into one continuous clip using `ffmpeg`.

## Installation

You need first to install ffmpeg on your computer: https://ffmpeg.org/  or via your package manager such as homebrew on MacOS `brew install ffmpeg`



You can install the development version of `ffmpegrr` from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brunj7/ffmpegrr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ffmpegrr)

concat_clips(folder_in="/Users/brunj7/Data/09_16_23_1108_baseline", folder_out"/Users/brunj7/Data/", no_audio=TRUE)
```

