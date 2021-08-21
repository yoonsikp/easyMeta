library(metafor)
studies <- read.table(file = 'studies.tsv', sep = '\t', header = TRUE)
dat <- escalc(measure = "RR", ai = tpos, bi = tneg, ci = cpos,
              di = cneg, data = studies, append = TRUE)
res <- rma(yi, vi, data = dat, knha=TRUE)
confint(res)
forest(res, slab = dat$Study.Name,
       xlim = c(-16, 6), at = log(c(0.1, 0.2, 1, 5, 10)), atransf = exp,
       ilab = cbind(dat$tpos, dat$tneg, dat$cpos, dat$cneg),
       ilab.xpos = c(-9.5, -8, -6, -4.5), cex = 0.75)
op <- par(cex = 0.75, font = 2)
par(op)
