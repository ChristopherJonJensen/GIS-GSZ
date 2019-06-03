## Parse the "location" variable into numeric coordinates.
## I acknowledge that this is a rather poor way to parse these coordinates, evidencing my greater familiarity
## with procedural as opposed to functional languages. In the future, I intend to refine this code to avoid
## needing to iterate here.

DF_CoordParse <- function(dfData){
    tempLong <- vector(mode = "numeric", length = nrow(dfData))
    tempLat <- vector(mode = "numeric", length = nrow(dfData))
    
    for(i in 1:nrow(dfData)){
        if(!is.na(dfData[i,2])){
            output <- as.numeric(unlist(strsplit(dfData[i,2], " ")))
            tempLong[i] <- output[1]
            tempLat[i] <- output[2]
        }
    }
    
    dfReturn <- cbind(dfData, tempLong, tempLat)
}