## Don't run this as a routine. Run it in the console (cut + paste)

library("ggmap")


#median of my data (long + lat)
CP = c(lon = 112.9, lat =  33)

#get the map
new_map <- get_map(location = CP, zoom = 5, color = "bw")

#plot the map
p <- ggmap(new_map)
p <- p + geom_density2d(data = dfGSZ_merged, aes(x = tempLong, y = tempLat)) +
    stat_density2d(data = dfGSZ_merged, aes(x = tempLong, y = tempLat,  fill = ..level.., alpha = ..level..), size = 0.01, geom = 'polygon') +
    scale_fill_gradient(low = "green", high = "red") +
    scale_alpha(range = c(0.00, 0.25), guide = FALSE) +
    theme(legend.position = "", axis.title = element_blank(), text = element_text(size = 12))

ggsave(p, file = "splonk.png", width = 8, height = 8, type = "cairo-png")