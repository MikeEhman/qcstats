library(dplyr)

pre.frq <- read.table("pre.frq", header=T)
post.frq <- read.table("post.frq", header=T)

joined.frq <- left_join(post.frq, pre.frq, by="SNP") %>% mutate(MAF_PRE = MAF.x, MAF_POST = MAF.y)
selected.frq <- select(joined.frq, SNP, MAF_PRE, MAF_POST)
