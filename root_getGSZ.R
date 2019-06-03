root_getGSZ <- function(){
    
    #You need to run all of this in the console window... There's no output!
    library("stringr")
    source("Extractor.R")
    
    #First, load the relevant codes from the XML data into variables
    GSZcodes <- unlist(Extractor("./Data/liang-gaoseng-zhuan/"))
    XGSZcodes <- unlist(Extractor("./Data/tang-gaoseng-zhuan/"))
        
    #join them together
    combo <- c(GSZcodes, XGSZcodes)
    
    #... but keep track of the original sources
    sources <- vector(mode="character", length=length(combo))
    sources[1:length(GSZcodes)]="GSZ"
    sources[(length(GSZcodes)+1):(length(GSZcodes)+length(XGSZcodes))] = "XGSZ"
    
    dfGSZ <- data.frame(text = sources, code = combo)
    
    
    ## dfLongLat is the output of root_getCodes() 
    source("root_getCodes.R")
    dfLongLat <- root_getCodes()
    
    ## This is the working merge code.
    ## Note: there are a few NA values, due to either ambiguous location names or named locations
    ## corresponding to wide geographical areas (e.g., Kashmir, Korea).
    dfGSZ_merged <- merge(x = dfGSZ, y = dfLongLat, by = "code", all.x = TRUE)
    
    ## Now get the dream data I parsed out and match in the codes
	## If someone wanted to use this approach to map another subset of episodes from GSZ / XGSZ, they would
	## simply need to make an appropriately formatted .csv file. See the readme in the root directory for details.
    
    DreamCode <- read.csv("GSZ_Codes_By_Death_Site.csv", strip.white=TRUE, stringsAsFactors=FALSE)
    dc_merged <- merge(x = DreamCode, y = dfLongLat, by.x = "PL_Code" , by.y = "code", all.x = TRUE)
    
    ##Now run "prelim_plotting_code.R" on the following data:
    plotGSZ <- dfGSZ_merged[dfGSZ_merged$text == "GSZ",]
    plotXGSZ <- dfGSZ_merged[dfGSZ_merged$text == "XGSZ",]
    plot_dc_GSZ <- dc_merged[dc_merged$Text=="GSZ",]
    plot_dc_XGSZ <- dc_merged[dc_merged$Text=="XGSZ",]
}