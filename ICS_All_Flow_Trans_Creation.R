# Flow Trans Script
# Clear Workspace
rm(list=ls())
# Import some needed libraries
library(flowCore)
library(flowTrans)
library(dplyr)
# Set working directory and load Rda of flow data
setwd("")
load("")
#Dataframe is called non_noise for this example
df<-non_noise
rm(non_noise)
# Remove label columns (FlowTrans only wants numeric)
df2<-df[,-c(16:19)]
#Save Labels for future use
Label<-df[,c(16:19)]
#Convert dataframe to matrix and then flowframe
df2<-as.matrix(df2)
DS_ICS_data<- flowFrame(df2)
# Transform flow data using flowTrans, in fun argument, try other versions
DS_ICS_trans <- flowTrans(dat=DS_ICS_data,fun="mclMultivArcSinh",colnames(DS_ICS_data), n2f=FALSE,parameters.only = FALSE)    
# Save file
save(DS_ICS_trans,file="DC_ICS_Trans_HQ500.Rda")
