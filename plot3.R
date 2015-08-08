dataF <- "household_power_consumption.txt"
columnC <- c("character", "character", "numeric", "numeric", "numeric", 
             "numeric", "numeric", "numeric", "numeric")

dataR <- read.table(dataF,header = TRUE, sep = ";",na.string = "?", 
                    colClasses = columnC)

dataP <- dataR[dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007",]
reading_time <- strptime(paste(dataP$Date, " ", dataP$Time),"%d/%m/%Y %H:%M:%S",
                         tz = "GMT")
dataP <- cbind(dataP,reading_time)

pYlab <- "Energy sub metering"
with(dataP, plot(reading_time, Sub_metering_1, type = "l", ylab = pYlab,
                 xlab =""))
with(dataP, lines(reading_time, Sub_metering_2, col = "red"))
with(dataP, lines(reading_time, Sub_metering_3, col = "blue"))
lLabel <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = lLabel)

dev.copy(png,file = "plot3.png")
dev.off()                                                                                       