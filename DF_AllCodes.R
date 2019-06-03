## Read in data file and return data frame

DF_AllCodes <- function(parsedXML){
    do.call(rbind, xpathApply(parsedXML, "/*//place", function(node) {
        location <- xmlValue(node[["location"]])    
        code <- xmlAttrs(node)
        data.frame(code, location, stringsAsFactors = FALSE)
    }))
    
    
    
}