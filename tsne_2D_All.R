##Tsne Starter Code
##Coded by Millie Perez 03/14/18
#Wipe Workspace
rm(list=ls())
# Import libraries
library(Rtsne)
# Set working directory and import transformed, scaled data with label
setwd("")
load("")
# Here dataframe is called ICS_balanced_trans_scaled
# Need to chop off label info before tsne
ALL<-ICS_balanced_trans_scaled[,-c(16:19)]

# Set a seed to ensure reproducible results (number!)
set.seed(1234)
# Save labels
Labels_All_ICS<-ICS_balanced_trans_scaled[,c(16:19)]
save(Labels_All_ICS,file="Labels_All_ICS.Rda")
# Put needed data into dataframe
ALL.train<-ALL
#Execute the algorithm on curated data
# Experiment with perplexity and max_iter)
tsne<- Rtsne(ALL.train, dims = 2, perplexity=30, verbose=TRUE,check_duplicates=FALSE, max_iter = 2000)

#Save the tsne
save(tsne,file = "tsne_ICS_500_1000SS.Rda")

