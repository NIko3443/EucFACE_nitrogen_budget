make_lai_variable <- function(){

  #res <- download_lai_variable()
  
  #myDF1 <- read.csv("download/FACE_P0020_RA_LMA_20160201-20161018_L2.csv")
  #myDF2 <- read.csv("download/FACE_P0020_RA_LMA_20150129-20150416_L2.csv")
  #myDF3 <- read.csv("download/FACE_P0020_RA_LMA_20140130-20141016_L2.csv")
  #myDF4 <- read.csv("download/FACE_P0020_RA_LMA_L2_20130213-20131115.csv")

  
  #res <- rbind(myDF1, rbind(myDF2, rbind(myDF3,myDF4)))  
  res <- read.csv("download/FACE_P0037_RA_GAPFRACLAI_OPEN_L2.dat",skip = 4, header = F)
  colnames(res) <- c("TIMESTAMP","Ring","Date","Gapfraction.mean","Rain_mm_Tot.mean","Gapfraction.sd","Rain_mm_Tot.sd","Gapfraction.n","Rain_mm_Tot.n","treatment","maxSDring","LAI")
  res <- subset(res, select=c(Date, Ring, LAI))
  names(res)[3] <- "lai_variable"
  
  res$Ring <- gsub("R", "", res$Ring)
  
  #- return a number for ring
  res$Ring <- as.numeric(res$Ring)
  
  return(res)
}


