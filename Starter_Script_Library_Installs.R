# Starter script-Library installs
# Jason M. Grayson

#Here are some CRAN installs
#When prompted update all
install.packages("tidyverse")
install.packages("Rtsne")
install.packages("umap")

#Here are the Bioconductor installs
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("flowCore")
BiocManager::install("flowTrans")
BiocManager::install("FlowSOM")

install.packages("devtools") 
devtools::install_github("JinmiaoChenLab/Rphenograph")
