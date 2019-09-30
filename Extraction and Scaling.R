# Extraction and scaling of transformed data
# Wipe workspace
rm(list=ls())
#Import needed library
library(flowCore)
# Set working directory and load transormed data Rda
setwd("")
load("")
# Use exprs to extract result
fd<-exprs(DS_ICS_trans$result)
# Grab your labels from prior dataframe
Labels<-non_noise[,c(16:19)]
#Scale extracted data
fd<-scale(fd)
# Use cbind to combine scaled data with labels
ICS_Scaled_Trans<-cbind(fd,Labels)
# Save transformed and scaled data with labels
# This will be the input to all subsequent visualizations
save(ICS_Scaled_Trans,file="ICS_Scaled_Trans.Rda")
