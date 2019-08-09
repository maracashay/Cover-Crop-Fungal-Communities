adonis(t(rare) ~ CCDiversity*Sampling_Event, data=map)
rare.adon.func <- vegdist(rare, "bray")
pairwise.perm.manova(rare.adon.func, map$CoverCrop, nperm=1000)
