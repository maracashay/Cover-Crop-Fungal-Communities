cca.insect<- cca(formula=abund_table_insectpathogens ~., data = EnvData)
ordistep(cca.insect, direction = "both")
cca.insect.1 <- cca(formula=abund_table_insectpathogens~Silt + P + Zn + S + Cu, data = EnvData)

# check VIF of factors
vif.cca(cca.insect.1)
anova(cca.insect.1, by = "terms")
