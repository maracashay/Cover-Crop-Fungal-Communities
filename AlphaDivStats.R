Speciesnumber=specnumber(t(All))
shannon=diversity(t(All), index = "shannon", MARGIN = 1, base = exp(1))
evenness=shannon/log(Speciesnumber)
Summary_diversity=cbind(Speciesnumber,shannon,evenness)
Summary_diversity=as.data.frame(Summary_diversity)


shan.test<-lmer(Shannon ~ Function + Sampling_Event + Function:Sampling_Event + (1|Block), map)
anova(shan.test)


emmeans(shan.test, list(pairwise ~ Function), adjust = "tukey", combine=TRUE)
