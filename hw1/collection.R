#initiating variables before for looping over dist then n.
distVals <- c("gaussian", "t1", "t5")
nVals <- seq(100, 500, by = 100)
interim <- c()
col1 <- c()

#start of for loops
for (dist in distVals) {
  for (n in nVals) {
    oFile <- Sys.glob(paste("/home/*/biostat-m280-2019-winter/hw1/n", n, "dist",
                   dist, ".txt", sep=""))
    rtable <- read.table(oFile) 
    rtable <- rtable[, 2] #pulling 2nd column since first column is [1]
    interim <- c(interim, rtable)
    col1 <- c(col1, rep(n,2))
    col1 <- head(col1, 10)
  }
}

Avg <- rep(c('PrimeAvg', 'SampAvg'), 5)

Final_Table <- data.frame(n = col1, Method = Avg, Gaussian = interim[1:10],
                          t5 = interim[21:30], t1 = interim[11:20])
Final_Table