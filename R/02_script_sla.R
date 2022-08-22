# -----------------------------------------------------------------------------------#
# Serrapilheira/ICTP-SAIFR Training Program in Quantitative Biology and Ecology 2022:
# Computational methods
# Project
# Julia Rossi Mora
# Specific leaf area and leaf nitrogen content of Cecropia and Eschweilera
# Script to analyze the specific leaf area of Cecropia and Eschweilera
# August 2022
# -----------------------------------------------------------------------------------#

### Packages required
library(BIEN)

# Specific leaf area (SLA) i.e. leaf area per leaf dry mass of Cecropia (family: Urticaceae)
sla_Cecropia <- BIEN_trait_traitbygenus(trait = "leaf area per leaf dry mass", genus = "Cecropia")
sla_Cecropia_value <- as.numeric(sla_Cecropia[,4])
   
# Specific leaf area (SLA) i.e. leaf area per leaf dry mass of Eschweilera (family: Lecythidaceae)
sla_Eschweilera <- BIEN_trait_traitbygenus(trait = "leaf area per leaf dry mass", genus = "Eschweilera")
sla_Eschweilera_value <- as.numeric(sla_Eschweilera[,4])

# Color palette
green_colors = colorRampPalette(c("darkgreen", "chartreuse3"))

# Boxplot of specific leaf area (SLA) of Cecropia and Eschweilera
par(mar = c(6, 6, 4, 4))
boxplot_sla <- boxplot(sla_Cecropia_value, sla_Eschweilera_value, 
                       col = green_colors(2),
                       boxwex = 0.6,
                       main = expression("Specific leaf area (m"^2*"/kg) of "*italic("Cecropia ")*"and "*italic("Eschweilera")), 
                       cex.main = 1.3,
                       xlab = "Genus",
                       names = expression(italic("Cecropia"), italic("Eschweilera")), 
                       ylab = expression("Specific leaf area (m"^2*"/kg)"),
                       ylim = c(0, 60),
                       cex.lab = 1.3,
                       cex.axis = 1.3)
boxplot_sla

# Save the boxplot of specific leaf area (SLA) of Cecropia and Eschweilera in pdf
boxplot_sla_record <- recordPlot(boxplot_sla)
pdf("figs/boxplot_sla.pdf", width = 8, height = 6)
boxplot_sla_record
dev.off()
graphics.off()

# Median of SLA of Cecropia
median(sla_Cecropia_value)
mean(sla_Cecropia_value)
sd(sla_Cecropia_value)

# Median of SLA of Eschweilera 
median(sla_Eschweilera_value)
mean(sla_Eschweilera_value)
sd(sla_Eschweilera_value)