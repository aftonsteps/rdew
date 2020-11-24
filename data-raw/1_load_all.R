## Shortcut script for running all the data-loading scripts

## Load data-loading helper functions
source("R/utils_make_snake_case.R")
source("R/utils_make_cols_snake_case.R")

## Load data
source("data-raw/big_craftables.R")
source("data-raw/crops.R")
source("data-raw/crops_object_information.R")
source("data-raw/furniture.R")
source("data-raw/hats.R")
source("data-raw/seeds_object_information.R")
source("data-raw/weapons.R")

## Clean up after ourselves
rm(list = c("make_snake_case",
            "make_cols_snake_case"))
