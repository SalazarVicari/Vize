url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"
download.file(url, destfile = "MapsThatChangedOurWorld_StoryMap_Data.csv", method = "auto")
maps <- read.csv("MapsThatChangedOurWorld_StoryMap_Data.csv", header = TRUE,sep = ';',dec = ",")
maps$Latitude <- as.numeric(gsub("[N]", "", maps$Latitude))
idx <- grep("W", maps$Longitude)
maps$Longitude <- as.numeric(gsub("[EW]", "", maps$Longitude))
maps$Year <- as.numeric(gsub("[AD]", "", maps$Year))
hist(maps$Year, breaks = 10, main = "Year Histogram", xlab = "Year")
maps$Longitude[idx] <- maps$Longitude[idx] * -1
finalResult <- maps[c("Longitude", "Latitude", "Year")]
finalResult

