# packages
install.packages('Hmisc')
library(Hmisc)

# go to datasets folder
setwd('/Water-Consumption-And-Inequality/datasets')

# import datasets
DF1 = read.table("access_to_improved_drinking_water.csv", header=TRUE, sep=";")
DF2 = read.table("access_to_improved_sanitation.csv", header=TRUE, sep=";")
DF3 = read.table("freshwater_withdrawal.csv", header=TRUE, sep=";")
DF4 = read.table("total_renewable_freshwater_supply.csv", header=TRUE, sep=";")

