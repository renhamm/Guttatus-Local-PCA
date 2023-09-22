filter = dplyr::filter

pops_x <- list("CR", "HAC", "HOL", "IM", "LPD", "MTC", "QRY", "SWC", "TBC", "TUN", "WLC")

for(i in 1:length(pops_x)) {
  a <- pops_x[i]
  popCombo <- gsub("sub", a, "sub_windowPi")
  filename1 <- gsub("sub", a, "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/sub-gk-v2.sites.pi")
  filename2 <- gsub("sub", a, "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/pi-stats/sub_windowPi.csv")
  pivalues <- read.table(filename1, head=T) #fst file for populations
  windows <- read.table("v2-WindowPositions.txt", head=F) #windows file
  WindowPi <- read.table("v2-WindowPositions.txt", head=F) # windows file
  
  #function to calculate mean fst per window
  f <- function(pivalues, chr, Wstart, Wstop){
    windowsize <- filter(pivalues, CHROM == chr & POS >= Wstart & POS <= Wstop)
    windowsize <- filter(windowsize, PI != "NaN")
    mean_pi <- mean(windowsize$PI)
    return(mean_pi)
  }
  
  #iterate through each line of original windows file
  #calculate mean fst for values btw start and stop
  #write value into row of popA-popB file
  for(i in 1:nrow(WindowPi)) {
    chromosome <- WindowPi$V1[i]
    WinStart <- WindowPi$V2[i]
    WinStop <- WindowPi$V3[i]
    mean_winpi <- f(pivalues, chromosome, WinStart, WinStop)
    WindowPi$V4[i] <- mean_winpi
  }    
  
  write.csv(WindowPi, file = filename2, row.names = F)
  
}
























