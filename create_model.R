library("readxl")
library("caret")
library("lattice")
library("ggplot2")
library("readr")
library("data.table")
library("dplyr")
library("rpart")
library("rpart.plot")

##import file
df0 <- read.csv("drive:/PaDEL_IC50_PubchemFingerprinter.csv", header = TRUE)
df1 <- read.csv("drive:/DDR_IC50_curated_filtered.csv")

##merge file using tidyverse
df1 <- df1[,-1]
df2 <- merge(df0, df1, by.x = "Name", by.y = "molecule_chembl_id")
df3 <- cbind(df0[,2:ncol(df0)],df1[,ncol(df1)])
df3 <- df2[,-(883:884)]
df4 <- df3[,-1]
df5 <- df4[,-882]##df contains only fingerprint
class <- df4[,882]##df contain only class

##if use data.table
df1[df0, on = .(Name, molecule_chembl_id)]
df3 <- cbind(df0[,2:ncol(df0)],df1[,ncol(df1)])
subjects[locations, on = .(subject, semester)]

##using dplr/tidyverse
df1[df0, on = .(Name, molecule_chembl_id)]
df3 <- cbind(df0[,2:ncol(df0)],df1[,ncol(df1)])
subjects[locations, on = .(subject, semester)]
