# Rename and aggregate inundation and habitat data for Ferreira-Ferreira et al 2015

# required libraries
library(raster)
library(dplyr)
library(forcats)

setwd("~/Projects/Ferreira_habitat_inundation_WEM_2015/")

# Load data

hab <- shapefile("/original/mami_veget.shp")
inun <- shapefile("/original/mami_inund.shp")
bas <- shapefile("/shapefile/mamiraua_basic_habitats.shp")

# Lets look at the datasets

head(hab)

head(inun)

# Do equivalent records have the same FID?

hab@polygons[[5876]]@ID

inun@polygons[[5876]]@ID

# Lets use hab as the template

# First, we remove the area field

hab@data$area_km <- NULL
head(hab)

# Now, we rename the veget field,  convert it to factor, and relabel the classes
names(hab@data) <- "class"
hab@data$class <- as.factor(hab@data$class)
hab@data$class <- fct_recode(hab@data$class,
                             low_varzea = 'V. Baixa',
                             high_varzea = 'V. Alta',
                             herb_soil = 'Herbaceas-Solo',
                             chavascal = 'Chavascal',
                             water_bodies = 'Agua')

head(hab)
# Add class codes
hab@data <- hab@data %>% mutate(class_acro = fct_recode(class,
                                                        LV = 'low_varzea',
                                                        HV = 'high_varzea',
                                                        HS = 'herb_soil',
                                                        CH = 'chavascal',
                                                        WB = 'water_bodies'))
head(hab)
# Add formatted class labels
hab@data <- hab@data %>% mutate(class_name = fct_recode(class,
                                                        'Low Várzea' = 'low_varzea',
                                                        'High Várzea' = 'high_varzea',
                                                        'Herbaceous / Soil' = 'herb_soil',
                                                        'Chavascal' = 'chavascal',
                                                        'Water Bodies' = 'water_bodies'))
head(hab)

hab@data <- hab@data %>% mutate(class_code = fct_recode(class,
                                                        '2' = 'low_varzea',
                                                        '1' = 'high_varzea',
                                                        '4' = 'herb_soil',
                                                        '3' = 'chavascal',
                                                        '5' = 'water_bodies'))

head(hab)

# Now we bring in the relevan columns from inunf
hab@data <- cbind(hab@data,inun@data)

# Renaming
names(hab@data)[5:7] <- c("area_km2", "fl_stage_m","fl_dur_day")

# Remove flooding stage of zero, because it is actually NA
hab@data$fl_stage_m[hab@data$fl_stage_m ==0] <- NA

# Rename inundation duration classes
hab@data$fl_dur_day <- as.factor(hab@data$fl_dur_day)
hab@data$fl_dur_day <- fct_recode(hab@data$fl_dur_day,
                             "<40" = '<40 dias',
                             ">295" = '>295 dias',
                             "105-125" = '105-125 dias',
                             "125-175" = '125-175 dias',
                             "175-295" = '175-295 dias',
                             "40-105" = "40-105 dias", 
                             "365" = "365 dias",
                             "0" = "Não Inundado")

# sum areas - does this match the paper
areas <- hab@data %>% group_by(class) %>% summarize(area = sum(area_km2))

# reorder fields of the mamiraua basic habitat to match the complete one

bas@data

bas@data <- bas@data[,c('class','class_acro','class_name','class_code','area_km2')]

# Save results
shapefile(bas, "/shapefile/mamiraua_basic_habitats.shp", overwrite=TRUE)
shapefile(hab, "/shapefile/emamiraua_inundation_habitat.shp")

