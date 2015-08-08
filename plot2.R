dataF <- "household_power_consumption.txt"
columnC <- c("character", "character", "numeric", "numeric", "numeric", 
             "numeric", "numeric", "numeric", "numeric")

dataR <- read.table(dataF,header = TRUE, sep = ";",na.string = "?", 
                    colClasses = columnC)

dataP <- dataR[dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007",]
reading_time <- strptime(paste(dataP$Date, " ", dataP$Time),"%d/%m/%Y %H:%M:%S", tz = "GMT")
dataP <- cbind(dataP,reading_time)

pYlab <- "Global Active Power (kilowatts)"
with(dataP, plot(reading_time, Global_active_power, type = "l", ylab = pYlab, xlab =""))

dev.copy(png,file = "plot2.png")
dev.off()