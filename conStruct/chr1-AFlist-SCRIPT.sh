AFlist <- vector()
locusNames <- vector()

count = 0

fileList<- c("1_1_S9_ID.frq", "1_3_S10_ID.frq", "1_4_S11_ID.frq", "1_5_S12_ID.frq", "1_6_S13_ID.frq", "1_7_S14_ID.frq", "1_8_S15_ID.frq", "2_1_S3_ID.frq", "2_4_S4_ID.frq", "5_2_S25_ID.frq", "6_11_S36_ID.frq", "6_12_S37_ID.frq", "6_13_S38_ID.frq", "6_1_S28_ID.frq", "6_2_S29_ID.frq", "6_3_S30_ID.frq", "6_4_S31_ID.frq", "6_6_S20_ID.frq", "6_7_S21_ID.frq", "6_8_S22_ID.frq", "7_14_S33_ID.frq", "7_15_S34_ID.frq", "7_16_S35_ID.frq", "7_3_S23_ID.frq", "7_4_S24_ID.frq", "7_5_S16_ID.frq", "7_6_S17_ID.frq", "7_7_S18_ID.frq", "7_8_S19_ID.frq", "8_1_S5_ID.frq", "8_2_S6_ID.frq", "8_3_S7_ID.frq", "8_4_S8_ID.frq", "8_5_S27_ID.frq", "8_8_S26_ID.frq", "9_2_S32_ID.frq", "CHAC12.frq", "HAC13.frq", "IM11.frq", "IM14.frq", "IM15.frq", "IM16.frq", "IM17.frq", "IM18.frq", "IM21.frq", "IM22.frq", "IM23.frq", "IM24.frq", "IM25.frq", "IM27.frq", "IM28.frq", "IM32.frq", "IM33.frq", "IM34.frq", "IM36.frq", "IM37.frq", "IM41.frq", "IM42.frq", "IM43.frq", "IM44.frq","IM45.frq", "IM46.frq", "IM47.frq", "IM48.frq", "IM53.frq", "IM54.frq", "IM55.frq", "IM56.frq", "IM57.frq", "L5_S1_ID.frq", "L6_S2_ID.frq", "LPD31.frq", "LPD32.frq", "LPD34.frq", "LPD35.frq", "LPD36.frq", "LPD37.frq", "LPD38.frq", "MTC1.frq", "MTC14.frq", "MTC15.frq", "MTC2.frq", "MTC39.frq", "QRY16.frq", "QRY17.frq", "QRY3.frq", "QRY4.frq", "QRY5.frq", "QRY6.frq", "QRY7.frq", "pos_HAC28.frq")
indvList<- c("1_1_S9_ID", "1_3_S10_ID", "1_4_S11_ID", "1_5_S12_ID", "1_6_S13_ID", "1_7_S14_ID", "1_8_S15_ID", "2_1_S3_ID", "2_4_S4_ID", "5_2_S25_ID", "6_11_S36_ID", "6_12_S37_ID", "6_13_S38_ID", "6_1_S28_ID", "6_2_S29_ID", "6_3_S30_ID", "6_4_S31_ID", "6_6_S20_ID", "6_7_S21_ID", "6_8_S22_ID", "7_14_S33_ID", "7_15_S34_ID", "7_16_S35_ID", "7_3_S23_ID", "7_4_S24_ID", "7_5_S16_ID", "7_6_S17_ID", "7_7_S18_ID", "7_8_S19_ID", "8_1_S5_ID", "8_2_S6_ID", "8_3_S7_ID", "8_4_S8_ID", "8_5_S27_ID", "8_8_S26_ID", "9_2_S32_ID", "CHAC12", "HAC13", "IM11", "IM14", "IM15", "IM16", "IM17", "IM18", "IM21", "IM22", "IM23", "IM24", "IM25", "IM27", "IM28", "IM32", "IM33", "IM34", "IM36", "IM37", "IM41", "IM42", "IM43", "IM44","IM45", "IM46", "IM47", "IM48", "IM53", "IM54", "IM55", "IM56", "IM57", "L5_S1_ID", "L6_S2_ID", "LPD31", "LPD32", "LPD34", "LPD35", "LPD36", "LPD37", "LPD38", "MTC1", "MTC14", "MTC15", "MTC2", "MTC39", "QRY16", "QRY17", "QRY3", "QRY4", "QRY5", "QRY6", "QRY7", "pos_HAC28")
for (fileName in fileList){
  count = count + 1
  conn <- file(fileName,open="r")
  linn <-readLines(conn)
  for (i in 1:length(linn)){
    vars<- strsplit(linn[i], "\t")
    vars <- unlist(vars)
    AFlistName <- gsub("sub", fileName, "sub-AFlist-scaffold_1")
    if (vars[1]=="scaffold_1"){
      locus<- paste(vars[1], vars[2], sep="-")
      preAF1<- strsplit(as.character(vars[5]), ":")
      preAF1<- unlist(preAF1)
      AF<- preAF1[2]
      locusNames<- append(locusNames, locus, after = length(locusNames))
      AFlist<- append(AFlist, AF, after = length(AFlist))
      if (count == 1){
        scaffold_1_all <- matrix(AFlist, ncol=length(AFlist), byrow=TRUE)
        colnames(scaffold_1_all) <- locusNames
      }
      if (count > 1){
        scaffold_1_all<- rbind(scaffold_1_all, AFlist)
      }
    }
  }
  
}
close(conn)

scaffold_1_all <- row.names(indvList)
write.csv(scaffold_1_all, file='chr1_all_AF.csv')




