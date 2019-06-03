## Okay. This is all you need to do in order to get the Long/Lat coordinates from the DB.

root_getCodes <- function(){
    source("DF_AllCodes.R")
    source("DF_CoordParse.R")
    library("XML", lib.loc="~/R/win-library/3.1")
    
    dbXML <- xmlParse("DILAplaceAuthorityData2.xml", useInternalNodes = TRUE)
    dfValues <- DF_AllCodes(dbXML)
    dfLongLat <- DF_CoordParse(dfValues)
    
    # Now incorporate all of the values that were missing...
    # Chuck out the rows with NA values
    dfLongLat2 <- dfLongLat[!is.na(dfLongLat$location),]
    
    # This next step is the least replicable and the most time-consuming.
	# See the readme file in the root directory of this repository for directions on assembling the "searchCoords.csv" file.
	
    newCodes <- read.csv("searchCoords.csv")
    names(newCodes) <- names(dfLongLat2)
    df_AllVals <- rbind(dfLongLat2,newCodes)
}