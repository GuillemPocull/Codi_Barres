

#### 1.COMPRES ####

## Meta  ----------------------------------------------------------

# This script contains ____

### Interesting websites

# https://zint.org.uk/manual/
# devtools::install_github("CannaData/zintr")

## Initial code  ----------------------------------------------------------

### Delete all objects

rm(list=ls())

### Instal packages in case they are not installed and open libraries

list.of.packages <- c("tidyverse", "readr", "plyr", "pbapply", "MASS", "ggplot2", "cowplot", "plotly", "vegan", "readxl",
                      "devtools", "baRcodeR", "writexl", "shiny")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)}

invisible(lapply(list.of.packages, library, character.only = TRUE, logical.return=T))
rm(list.of.packages, new.packages) # remove objects we won't need anymore.

### Set constants and variables

dir <- getwd()
dir_compres <- paste0(dir, "/compres") # 'compres' directory
dir_export_cb <- paste0(dir, "/export_codi_barres") # 'compres' directory
dir_export_db <- paste0(dir, "/export_db") # 'compres' directory

### Open files

### Create invented file

producte <- c("ferro", "ferro", "plastic")
quantitat <- c(10, 20, 30)

df <- data.frame(producte, quantitat)

df$ref <- round(runif(nrow(df), 10000, 99999), 0) # afegim codi barres

View(df)

## Transform reference to barcode  ----------------------------------------------------------

### Good one

create_PDF(Labels = df[,"ref"], name = paste0(dir_export_cb, "/ex1_", format(Sys.Date(), "%d-%m-%y")),
           type = "linear") # 'linear' type means it follows the code 128B specification of barcoding

## Export df as excel  ----------------------------------------------------------

write_xlsx(df, paste0(dir_export_db, "/e1_" , Sys.Date(), ".xlsx"))

