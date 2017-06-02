library("dplyr")
args <- commandArgs(TRUE)
dats <- list()
for (i in 1:length(args)) {
  dats[[i]] <- read.table(args[i], header=T)
}

