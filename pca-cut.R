library("dplyr")
args <- commandArgs(TRUE)
famname <- args[1]
pcaname <- args[2]
outname <- args[3]


fam <- read.table(famname)
pca <- read.table(pcaname, skip=11)

pca1 <- pca[,1]
pca2 <- pca[,2]

pca1.mean <- mean(pca1)
pca1.sd <- sd(pca1)
pca2.mean <- mean(pca2)
pca2.sd <- sd(pca2)

pca1.lo <- pca1.mean - 3*pca1.sd
pca1.hi <- pca1.mean + 3*pca1.sd
pca2.lo <- pca2.mean - 3*pca2.sd
pca2.hi <- pca2.mean + 3*pca2.sd

#plot(pca1,pca2)
#abline(h=pca2.lo)
#abline(h=pca2.hi)
#abline(v=pca1.lo)
#abline(v=pca1.hi)

rem.ids <- fam[pca1 > pca1.hi | pca1 < pca1.lo | pca2 > pca2.hi | pca2 < pca2.lo,] %>% select(V1,V2)
write.table(rem.ids, outname, col.names=F, row.names=F)
