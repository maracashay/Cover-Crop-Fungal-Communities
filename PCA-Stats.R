envdata.scaled<-scale(envdata1, scale = TRUE)
dis.euc <- dist(envdata.scaled,method = "euclidean")
res.pca<- PCA(dis.euc)


m<- manova(res.pca$x[, 1:2] ~ map1$CoverCrop + map1$Block) # this creates a manova model using the first two axes from the PCA to assess the effect of CC on the values
summary.aov(m)

m1<- manova(res.pca$x[, 1:2] ~ map1$Block)
summary.aov(m1)
