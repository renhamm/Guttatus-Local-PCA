filter = dplyr::filter

pops_x <- list("CR_HAC", "CR_HOL", "CR_IM", "CR_MTC", "CR_QRY", "CR_SWC", "CR_TBC", "CR_TUN", "CR_WLC", "HAC_HOL", "HAC_IM", "HAC_MTC", "HAC_QRY", "HAC_SWC", "HAC_TBC", "HAC_TUN", "HAC_WLC", "HOL_IM", "HOL_MTC", "HOL_QRY", "HOL_SWC", "HOL_TBC", "HOL_TUN", "HOL_WLC", "IM_MTC", "IM_QRY", "IM_SWC", "IM_TBC", "IM_TUN", "IM_WLC", "MTC_QRY", "MTC_SWC", "MTC_TBC", "MTC_TUN", "MTC_WLC", "QRY_SWC", "QRY_TBC", "QRY_TUN", "QRY_WLC", "SWC_TBC", "SWC_TUN", "SWC_WLC", "TBC_TUN", "TBC_WLC", "TUN_WLC")
pops_x2 <- list("CR-HAC", "CR-HOL", "CR-IM", "CR-MTC", "CR-QRY", "CR-SWC", "CR-TBC", "CR-TUN", "CR-WLC", "HAC-HOL", "HAC-IM", "HAC-MTC", "HAC-QRY", "HAC-SWC", "HAC-TBC", "HAC-TUN", "HAC-WLC", "HOL-IM", "HOL-MTC", "HOL-QRY", "HOL-SWC", "HOL-TBC", "HOL-TUN", "HOL-WLC", "IM-MTC", "IM-QRY", "IM-SWC", "IM-TBC", "IM-TUN", "IM-WLC", "MTC-QRY", "MTC-SWC", "MTC-TBC", "MTC-TUN", "MTC-WLC", "QRY-SWC", "QRY-TBC", "QRY-TUN", "QRY-WLC", "SWC-TBC", "SWC-TUN", "SWC-WLC", "TBC-TUN", "TBC-WLC", "TUN-WLC")

for(i in 1:length(pops_x)) {
  a <- pops_x[i]
  b <- pops_x2[i]
  popCombo <- gsub("sub", a, "sub_windowFst")
  filename1 <- gsub("sub", b, "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/fst-sub.weir.fst")
  filename2 <- gsub("sub", b, "/global/scratch/laurenhamm/Data/thesis/localPCAproject/v2-files/indv-pops/fst-stats/sub_windowFst.csv")
  fstvalues <- read.table(filename1, head=T) #fst file for populations
  windows <- read.table("v2-WindowPositions.txt", head=F) #windows file
  WindowFst <- read.table("v2-WindowPositions.txt", head=F) # windows file
  
  #function to calculate mean fst per window
  f <- function(fstvalues, chr, Wstart, Wstop){
    windowsize <- filter(fstvalues, CHROM == chr & POS >= Wstart & POS <= Wstop)
    windowsize <- filter(windowsize, WEIR_AND_COCKERHAM_FST != "NaN")
    mean_fst <- mean(windowsize$WEIR_AND_COCKERHAM_FST)
    return(mean_fst)
  }
  
  #iterate through each line of original windows file
  #calculate mean fst for values btw start and stop
  #write value into row of popA-popB file
  for(i in 1:nrow(WindowFst)) {
    chromosome <- WindowFst$V1[i]
    WinStart <- WindowFst$V2[i]
    WinStop <- WindowFst$V3[i]
    mean_winfst <- f(fstvalues, chromosome, WinStart, WinStop)
    WindowFst$V4[i] <- mean_winfst
  }    
  
  write.csv(WindowFst, file = filename2, row.names = F)
  
}
























