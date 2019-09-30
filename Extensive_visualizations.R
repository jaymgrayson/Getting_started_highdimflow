# In Depth Visualization

# Wipe workspace
rm(list=ls())
#Import needed library
library(ggplot2)
#Set working directory to data; load data
setwd("")
load("")
# From tsne need to pull out the Y, this will give you V1 and V2 (x and y equivalent)
tsne_data<-tsne$Y
#Load scaled and transformed data
load("")
# Combine tsne V1 and V2 with scaled and transformed data
Training_data<-cbind(ICS_balanced_trans_scaled,tsne_data)
#Load R phenograph output 
phenograph_cluster<-membership(flow_Rphenograph_out[[2]])
phenograph_cluster<-as.factor(phenograph_cluster)
#Combine with other data
Training_data<-cbind(Training_data,phenograph_cluster)
Training_data$phenograph_cluster<-as.factor(Training_data$phenograph_cluster)
#Rename columns in dataframe
names(Training_data)[names(Training_data)=='1']<-'V1'
names(Training_data)[names(Training_data)=='2']<-'V2'
save(Training_data,file="All_pheno_tsne_flow_data.Rda")

g1<-ggplot(Training_data, aes(x=V1,y=V2,color=phenograph_cluster))+geom_point(size=0.1)+theme_bw()+theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+ guides(color = guide_legend(override.aes = list(size=2)))
g1<-g1+facet_grid(~aGVHD)
g1
