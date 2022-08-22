# ----------------------------------------------------------------------------------------------------------------#
# Serrapilheira/ICTP-SAIFR Training Program in Quantitative Biology and Ecology 2022:
# Computational methods
# Project
# Julia Rossi Mora
# Specific leaf area and leaf nitrogen content of Cecropia and Eschweilera
# Script of t-test for specific leaf area and leaf nitrogen content per leaf dry mass of Cecropia and Eschweilera
# August 2022
#-----------------------------------------------------------------------------------------------------------------#

### Necessary scripts to load the data 
source("R/02_script_sla.R")
source("R/03_script_leafnitrogen.R")

# t-Student test for the specific leaf area (SLA) i.e. leaf area per leaf dry mass of Cecropia (family: Urticaceae) and Eschweilera (family: Lecythidaceae)
t.test(sla_Cecropia_value, sla_Eschweilera_value)

# t-Student test for leaf nitrogen content per leaf dry mass of Cecropia (family: Urticaceae) and Eschweilera (family: Lecythidaceae)
t.test(nitrogen_Cecropia_value, nitrogen_Eschweilera_value)