LoadMegaString <- function(fileList){
    
    tempCharVect <- vector(mode = "character", length=length(fileList))
    
    for(i in 1:length(fileList)){
        tempCharVect[i]<- readChar(fileList[i], file.info(fileList[i])$size)
    }
    tempCharVect
}