library(dplyr)

pre.het <- read.table("pre.het", header=T)
post.het <- read.table("post.het", header=T)

joined.het <- left_join(post.het, pre.het, by="IID")

selected.het <- left_join(post.het, pre.het, by="IID") %>% mutate(F_POST=F.x, F_PRE=F.y) %>% select(IID,F_PRE, F_POST)

compute_h <- function(NNM, OHOM) {
  (NNM - OHOM) / NNM
}


plot(selected.het$F_PRE, selected.het$F_POST)
abline(a=0, b=1)

hist(selected.het$F_POST, col=rgb(1,0,0,1/4), breaks=100, main="Histograms of F Coefficient Estimates", xlab="F Coefficient Estimate from Heterozygosity Report")
hist(selected.het$F_PRE, col=rgb(0,0,1,1/4), breaks=100, add=T)
legend("topright", c("Pre-QC", "Post-QC"), col=c(rgb(0,0,1,1/4), rgb(1,0,0,1/4)), lwd=10)

mutated.het <- selected.het %>% mutate(H_PRE=compute_h(joined.het$N.NM..y, joined.het$O.HOM..y), H_POST=compute_h(joined.het$N.NM..x, joined.het$O.HOM..x))

plot(mutated.het$H_PRE, mutated.het$H_POS)
hist(mutated.het$H_PRE, breaks=100, col=rgb(0,0,1,1/4), ylim=c(0,100), xlim=c(0.3,0.4))
hist(mutated.het$H_POST, breaks=100, col=rgb(1,0,0,1/4), add=T)
