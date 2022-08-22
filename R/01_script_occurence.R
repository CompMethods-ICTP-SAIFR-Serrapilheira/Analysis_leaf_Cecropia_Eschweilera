# -----------------------------------------------------------------------------------#
# Serrapilheira/ICTP-SAIFR Training Program in Quantitative Biology and Ecology 2022:
# Computational methods
# Project
# Julia Rossi Mora
# Specific leaf area and leaf nitrogen content of Cecropia and Eschweilera
# Script to show the occurence of Cecropia and Eschweilera
# August 2022
# -----------------------------------------------------------------------------------#

### Packages required 
library(BIEN)
library(maps)

# Cecropia occurence data
Cecropia_occurence <- BIEN_occurrence_genus(genus = "Cecropia")

# Eschweilera occurence data
Eschweilera_occurence <- BIEN_occurrence_genus(genus = "Eschweilera")

# Base world map
base_map <- map("world", fill = TRUE, col= "light grey", xlim = c(-140, -20),
            ylim = c(-60, 40), mar = c(0.0001, 0.0001, par("mar")[3], 0.1))

# Cecropia and Eschweilera occurence map
map_Cecropia <- points(cbind(Cecropia_occurence$longitude, Cecropia_occurence$latitude),
                col = "darkgreen",
                pch = 20,
                cex = 0.4)
                  
map_Eschweilera <- points(cbind(Eschweilera_occurence$longitude, Eschweilera_occurence$latitude),
                   col = "chartreuse3",
                   pch = 1,
                   cex = 0.4) 

# Color palette
green_colors = colorRampPalette(c("darkgreen", "chartreuse3"))

# Defining the legend of the map
leg.txt <- c("Cecropia", "Eschweilera")
legend("left", leg.txt, border = "black", fill = green_colors(2), cex = 1.2)

# Save the occurence map of Cecropia and Eschweilera in pdf
map_occurence <- map_Eschweilera + map_Cecropia
map_occurence_record <- recordPlot(map_occurence)
pdf("figs/map_occurence.pdf", width = 10, height = 8)
map_occurence_record
dev.off()