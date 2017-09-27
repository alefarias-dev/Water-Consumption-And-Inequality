# packages
install.packages('Hmisc')
library(Hmisc)
library(ggplot2)
library(reshape2)

# go to datasets folder
setwd('~/git/Water-Consumption-And-Inequality/datasets')

# import datasets
df = read.table("merged_data.csv", header=TRUE, sep=";")

df_original = df
df = df[,c(-1,-10)]
df = na.omit(df)
rcorr(as.matrix(df))

# correlation matrix
mat <- round(cor(df),2)
melted_cormat <- melt(mat)
head(melted_cormat)

ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + geom_tile() + 
  theme(axis.text.x = element_text(angle = 50, vjust = 1, size = 5, hjust = 1),
        axis.text.y = element_text(angle = 0, vjust = 1, size = 5, hjust = 1),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) + 
  coord_fixed() +
  scale_fill_gradient2(low  = "black", 
                       high = "darkturquoise", 
                       mid  = "white", 
                       midpoint = 0, 
                       limit = c(-1,1), 
                       name="Correlation") +
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 3)
  
