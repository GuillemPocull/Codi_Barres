

#### 1.COMPRES ####

## Meta  ----------------------------------------------------------

# This script contains ____

# 

## Initial code  ----------------------------------------------------------

### Delete all objects

rm(list=ls())

### Instal packages in case they are not installed and open libraries

list.of.packages <- c("tidyverse", "readr", "plyr", "pbapply", "MASS", "ggplot2", "cowplot", "plotly", "vegan", "readxl",)

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)}

invisible(lapply(list.of.packages, library, character.only = TRUE, logical.return=T))
rm(list.of.packages, new.packages) # remove objects we won't need anymore.

### Set constants and variables

dir <- getwd()
dir_compres <- paste0(dir, "/compres") # 'compres' directory

### Open files

### Create invented file

ref <- 


## Transform reference to barcode  ----------------------------------------------------------



## Export barcode image  ----------------------------------------------------------



