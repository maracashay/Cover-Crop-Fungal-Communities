#### Rarefaction curves #####
otu.t <- t(otus)
S <- specnumber(otu.t) # observed number of species
(raremax <- min(rowSums(otu.t)))
Srare <- rarefy(otu.t, raremax)
plot(S, Srare, xlab = "Observed No. of Species", ylab = "Rarefied No. of Species")
abline(0, 1)
rplot <- rarecurve(otu.t, step = 20, sample = raremax, col = "blue", cex = 0.6, label = FALSE)

col <- c("black", "darkred", "forestgreen", "hotpink", "blue")
lty <- c("solid", "dashed", "dotdash")
lwd <- c(1, 2)
pars <- expand.grid(col = col, lty = lty, lwd = lwd, 
                    stringsAsFactors = FALSE)
Nmax <- sapply(rplot, function(x) max(attr(x, "Subsample")))
Smax <- sapply(rplot, max)

jpeg(file = "Rarefaction-Curves-WithoutRarefying.jpeg", width=8, height=8, units="in", res=800)

plot(c(1, max(Nmax)), c(1, max(Smax)), xlab = "Sample Size",
     ylab = "Species", type = "n")
abline(v = raremax)
for (i in seq_along(rplot)) {
  N <- attr(rplot[[i]], "Subsample")
  with(pars, lines(N, rplot[[i]], col = col[i], lty = lty[i], lwd = lwd[i]))
}
dev.off()