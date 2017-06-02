library(dplyr)

pre.imiss <- read.table("pre.imiss", header=T)
post.imiss <- read.table("post.imiss", header=T)
pre.lmiss <- read.table("pre.lmiss", header=T)
post.lmiss <- read.table("post.lmiss", header=T)

colnames(pre.imiss)[6] <- "F_MISS_PRE"
colnames(post.imiss)[6] <- "F_MISS_POST"

colnames(pre.lmiss)[5] <- "F_MISS_PRE"
colnames(post.lmiss)[5] <- "F_MISS_POST"

joined.imiss <- left_join(post.imiss, pre.imiss, by="IID")
selected.imiss <- select(joined.imiss, IID, F_MISS_PRE, F_MISS_POST)

imisscmp <- plot(selected.imiss$F_MISS_PRE, selected.imiss$F_MISS_POST)
abline(a=0, b=1)

hist(selected.imiss$F_MISS_POST, col=rgb(1,0,0,1/4))
hist(selected.imiss$F_MISS_PRE, col=rgb(0,0,1,1/4), add=T)

joined.lmiss <- left_join(post.lmiss, pre.lmiss, by="SNP")
selected.lmiss <- select(joined.lmiss, SNP, F_MISS_PRE, F_MISS_POST)
filtered.lmiss <- filter(selected.lmiss, F_MISS_PRE != F_MISS_POST)

lmisscmp <- plot(filtered.lmiss$F_MISS_PRE, filtered.lmiss$F_MISS_POST)
abline(a=0, b=1)

hist(filtered.lmiss$F_MISS_POST, col=rgb(1,0,0,1/4))
hist(filtered.lmiss$F_MISS_PRE, col=rgb(0,0,1,1/4), add=T)
