extractCoords <- function(input)
{
    results <- vector(mode="character", length=xmlSize(input))
    for(i in 1:xmlSize(input)){
        results[i] <- xmlValue(input[[i]][["location"]])
    }
    results
}