library(ShortRead)
library(plyr)
library(data.table)

args <- commandArgs(trailingOnly = TRUE)
prefix <- args[1]

d <- readFastq(paste0('raw_data/',prefix,'.fastq.gz'))
tmp <- fread(paste0('blast/',prefix,'.txt'),select=1)

d <- d[!(d@id %in% tmp$V1)]
writeFastq(d,paste0('blast/',prefix,'.unaligned.fq.gz'))

