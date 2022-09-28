

#### 2. ENTREGA  ####

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
                      "devtools", "baRcodeR", "writexl")

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

df <- read_excel(paste0(dir_export_db, "/e1_2022-09-28.xlsx")) %>% as.data.frame
View(df)

### Create new columns

df["check"] <- NA # new column for the checks

df["date_check"] <- NA # new column for the date of the check


## Check product and send to dataframe  ----------------------------------------------------------

p <- 1

if(p %in% df$ref) {
  
  print("ENTREGA REALITZADA CORRECTAMENT")
  
  print(paste0("producte: ", df[df$ref %in% p, "producte"]))
  print(paste0("quantitat: ", df[df$ref %in% p, "quantitat"]))
  
  df[df$ref %in% p, "check"] <- "x"
  df[df$ref %in% p, "date_check"] <- format(Sys.Date(), "%d-%m-%Y")
  
} else { print("NO S'HA DETECTAT EN L'INVENTARI") }

df









## Export df as excel  ----------------------------------------------------------

write_xlsx(df, paste0(dir_export_db, "/e1_" , Sys.Date(), ".xlsx"))

