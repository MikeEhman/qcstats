library(dplyr)

pre.frq <- read.table("pre.frq", header=T)
post.frq <- read.table("post.frq", header=T)

joined.frq <- left_join(post.frq, pre.frq, by="SNP") %>% mutate(MAF_PRE = MAF.x, MAF_POST = MAF.y)
selected.frq <- select(joined.frq, SNP, MAF_PRE, MAF_POST)

plot(selected.frq$MAF_PRE, selected.frq$MAF_POST, col=rgb(0,0,0,1/4))

hist(selected.frq$MAF_PRE, col=rgb(0,0,1,1/4), breaks=100)
hist(selected.frq$MAF_POST, col=rgb(1,0,0,1/4), breaks=100, add=T)
