Extractor <- function(filePath){
    
    #Grab the names of all applicable .xml files in their respective directories...
    source("LoadMegaString.R")
    source("ExtractPlaceCodes.R")
    
    files <- list.files(path=filePath, pattern="\\d\\d\\d\\d\\w+.xml", full.names=T, recursive=FALSE)
    
    #Then pass this file list to LoadMegaString, which actually loads all the accounts into memory.
    output_list <- LoadMegaString(files)
    
    #Then extract all the place codes from the globs of characters.
    allCodes <- lapply(output_list,ExtractPlaceCodes)
}