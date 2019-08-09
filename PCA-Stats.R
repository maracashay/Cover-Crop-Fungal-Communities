#### Performing MANOVA on PCA-axes ####
envdata.scaled<-scale(EnvDatA, scale = TRUE)
dis.mht <- dist(envdata.scaled,method = "euclidean")
res.pca<- PCA(dis.mht)


# now plot PCA
pca.data <- as.data.frame(res.pca$x)
map1$CoverCrop<- as.factor(map1$CoverCrop)
res.pca$sdev

pca.data$group <- sapply( strsplit(as.character(row.names(map1)), "_"), "[[", 1 )
theme<-theme(panel.background = element_blank(),panel.border=element_rect(fill=NA),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),strip.background=element_blank(),axis.text.x=element_text(colour="black"),axis.text.y=element_text(colour="black"),axis.ticks=element_line(colour="black"),plot.margin=unit(c(1,1,1,1),"line"))
pca.plot<-ggplot(pca.data,aes(x=PC1,y=PC2, color = map1$Block)) + scale_fill_manual(breaks = c("1", "2", "3", "4", "5", "6", "7", "8", "9")) + theme_classic() +geom_point()
pca.plot <-pca.plot + geom_point(aes(color = map1$Block, size = 5))  + guides(colour = guide_legend(override.aes = list(size=5))) + guides(shape = guide_legend(override.aes = list(size = 5))) + theme(legend.text = element_text(size = 10))

pca.plot

summary(res.pca) # gives % variance per axis


# perform anova on pca axis scores
m<- aov(pca.data$PC1 ~ map1$CoverCrop + map1$Block) # this creates a manova model using the first two axes from the PCA to assess the effect of CC on the values
summary(m)

m2 <- aov(pca.data$PC2 ~ map1$CoverCrop + map1$Block)
summary(m2)

# adjust p-values
p.values<- c(0.029674, 0.00215, 0.0001, 0.0049)
p.adjust(p.value, method ="bonferroni")

