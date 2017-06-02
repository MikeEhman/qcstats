library(dplyr)

pre.hwe <- read.table("./pre.hwe", header=T)
post.hwe <- read.table("./post.hwe", header=T)

joined.hwe <- left_join(post.hwe, pre.hwe, by="SNP")

hist(joined.hwe$P.y, breaks=100, col=rgb(0,0,1,1/4))
hist(joined.hwe$P.x, breaks=100, col=rgb(1,0,0,1/4), add=T)
