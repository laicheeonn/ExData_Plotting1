dataF <- "household_power_consumption.txt"
columnC <- c("character", "character", "numeric", "numeric", "numeric", 
             "numeric", "numeric", "numeric", "numeric")

dataR <- read.table(dataF,header = TRUE, sep = ";",na.string = "?", colClasses = columnC)

dataP <- dataR[dataR$Date == "1/2/2007" | dataR$Date == "2/2/2007",]
reading_time <- strptime(paste(dataP$Date, " ", dataP$Time),"%d/%m/%Y %H:%M:%S", tz = "GMT")
dataP <- cbind(dataP,reading_time)

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))

with(dataP, {
    
    pYlab <- "Global Active Power (kilowatts)"
    plot(reading_time, Global_active_power, type = "l", ylab = pYlab, xlab ="")

    plot(reading_time, Voltage, type = "l", xlab ="datetime")
    
    pYlab <- "Energy sub metering"
    with(dataP, plot(reading_time, Sub_metering_1, type = "l", ylab = pYlab, xlab =""))
    with(dataP, lines(reading_time, Sub_metering_2, col = "red"))
    with(dataP, lines(reading_time, Sub_metering_3, col = "blue"))
    lLabel <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = lLabel, cex = 0.5)
    
    plot(reading_time, Global_reactive_power, type = "l", xlab ="datetime")
})

dev.copy(png,file = "plot4.png")
dev.off() 