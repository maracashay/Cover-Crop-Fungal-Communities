histogram(genera$Glomus)
histogram(log(genera$Glomus))
glom.function<-lmer(log(Glomus) ~ Function * Sampling_Event + (1|Block), genera)
anova(glom.function)
glom.posthoc <- emmeans(glom.function, list(pairwise ~ Function), simple = "each", adjust = "tukey", combine=TRUE)
glom.posthoc
