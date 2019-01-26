# autoSim.R

nVals <- seq(100, 500, by=100)
for (n in nVals) {
  for (dist in c("gaussian", "t1", "t5")) {
    oFile <- paste("n", n, "dist", dist, ".txt", sep="")
    sysCall <- paste("nohup Rscript runSim.R n=", n, " dist=", 
                     shQuote(shQuote(dist)), " seed=", 280, " rep=", 50, " > ",
                     oFile, sep="")
    system(sysCall)
    print(paste("sysCall=", sysCall, sep=""))
  }
}


