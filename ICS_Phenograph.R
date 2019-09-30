# This script is to run Phenograph clustering on data
# Wipe workspace
rm(list=ls())
#Import library
library(Rphenograph)
#Set working directory and load scaled, transformed data with label
setwd("")
load("")
# Pull off columns with only flow data
data<-ICS_balanced_trans_scaled[,c(1:15)]
#Convert dataframe to matrix
data<-as.matrix(data)
#Execute Rphenogrpah, try different k, this is for k nearest neighbors
flow_Rphenograph_out<-Rphenograph(data,k=20)
#save output, we will use membership/cluster assignment in visualizations
save(flow_Rphenograph_out,file="ICS_flow_Rphenographk20_out.Rda")

phenograph_cluster<-membership(flow_Rphenograph_out[[2]])



#iris_unique <- unique(iris) # Remove duplicates
#data <- as.matrix(iris_unique[,1:4])
#Rphenograph_out <- Rphenograph(data, k = 45)
#modularity(Rphenograph_out[[2]])
#membership(Rphenograph_out[[2]])
#iris_unique$phenograph_cluster <- factor(membership(Rphenograph_out[[2]]))
#g1<-ggplot(iris_unique, aes(x=Sepal.Length, y=Sepal.Width, col=Species, shape=phenograph_cluster)) + geom_point(size = 3)+theme_bw()
#g1
