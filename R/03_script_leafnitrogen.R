# -------------------------------------------------------------------------------------#
# Serrapilheira/ICTP-SAIFR Training Program in Quantitative Biology and Ecology 2022:
# Computational methods
# Project
# Julia Rossi Mora
# Specific leaf area and leaf nitrogen content of Cecropia and Eschweilera
# Script to analyze leaf nitrogen content per leaf dry mass of Cecropia and Eschweilera
# August 2022
# -------------------------------------------------------------------------------------#

### Packages required
library(BIEN)

# Leaf nitrogen content per leaf dry mass of Cecropia (family: Urticaceae)
nitrogen_Cecropia <- BIEN_trait_traitbygenus(trait = "leaf nitrogen content per leaf dry mass", genus = "Cecropia")
nitrogen_Cecropia_value <- as.numeric(nitrogen_Cecropia[,4])

# Leaf nitrogen content per leaf dry mass of Eschweilera (family: Lecythidaceae)
nitrogen_Eschweilera <- BIEN_trait_traitbygenus(trait = "leaf nitrogen content per leaf dry mass", genus = "Eschweilera")
nitrogen_Eschweilera_value <- as.numeric(nitrogen_Eschweilera[,4])

# Color palette
green_colors = colorRampPalette(c("darkgreen", "chartreuse3"))

# Boxplot of leaf nitrogen content per leaf dry mass of Cecropia and Eschweilera 
par(mar = c(6, 6, 4, 4))
boxplot_nitrogen <- boxplot(nitrogen_Cecropia_value, nitrogen_Eschweilera_value, 
                            col = green_colors(2),
                            boxwex = 0.6,
                            main = expression("Leaf nitrogen content per leaf dry mass (mg/g) of "*italic("Cecropia ")*"and "*italic("Eschweilera")), 
                            cex.main = 1.3,
                            xlab = "Genus", 
                            names = expression(italic("Cecropia"), italic("Eschweilera")), 
                            ylab = "Leaf nitrogen content per leaf dry mass (mg/g)",
                            ylim = c(0, 40),
                            cex.lab = 1.3,
                            cex.axis = 1.3)
boxplot_nitrogen

# Save the boxplot of leaf nitrogen content per leaf dry mass of Cecropia and Eschweilera in pdf
boxplot_nitrogen_record <- recordPlot(boxplot_nitrogen)
pdf("figs/boxplot_nitrogen.pdf", width = 8, height = 6)
boxplot_nitrogen_record
dev.off()

# Median of leaf nitrogen content per leaf dry mass of Cecropia
median(nitrogen_Cecropia_value)
mean(nitrogen_Cecropia_value)
sd(nitrogen_Cecropia_value)

# Median of leaf nitrogen content per leaf dry mass of Eschweilera 
median(nitrogen_Eschweilera_value)
mean(nitrogen_Eschweilera_value)
sd(nitrogen_Eschweilera_value)