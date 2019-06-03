## Notes for cheesy place name extraction function...

## Note 1: I had previously set up this subroutine to download the files in code, but in the run up to publication of
## this article, the URLs for Dharma Drum's "Authority Database" were all changed.
## As such, I will simply direct you to the "Download" page at the Dharma Drum Authority Database, which can currently
## be found at http://authority.dila.edu.tw/downloads/authority_place.2018-03.zip (March 2018).
## Once you download this package, extract it to a subfolder named "Data"

## Note 2: since some folders have additional supplementary material, only read files whose names are in the 
## "NNNN<some number of characters>.xml" format (where 'N' = 0-9)


ExtractPlaceCodes <- function(gszTemp){

#find the "placename" tags in the text
output <- gregexpr(pattern="<placeName key=\"", text=gszTemp)
locs <- as.numeric(output[[1]])

values <- vector(mode = "character", length=length(locs))


## As noted elsewhere, my status as a neophyte R programmer is evident here, as I am iterating instead of
## taking advantage of the language's functional character.
for(i in 1:length(locs)){
   values[i] <- substr(gszTemp, locs[i]+16, locs[i]+29)
   print(values[i])
}
unlist(values)
}