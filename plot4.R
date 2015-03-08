dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
logi <- dat[ , "Date"] == "1/2/2007" | dat$Date == "2/2/2007"
a1 <- dat[logi,]
a1$gap <- as.numeric(as.character(a1$Global_active_power))
a1$Sub_metering_1 <- as.numeric(as.character(a1$Sub_metering_1))
a1$Sub_metering_2 <- as.numeric(as.character(a1$Sub_metering_2))
a1$Voltage <- as.numeric(as.character(a1$Voltage))
a1$Global_reactive_power <- as.numeric(as.character(a1$Global_reactive_power))

gaplab <- "Global Active Power (kilowatts)"
dtlab <- "datetime"
smetlab <- "Energy sub metering"
voltlab <- "Voltage"
grplab = "Global_reactive_power"

a1$tms <- as.character(a1$Time)
a1$ds <- as.character(a1$Date)
a1$ts <- paste(a1$ds, a1$tms)
a1$ts <- strptime(a1$ts, format = "%d/%m/%Y %H:%M:%S")

#plot 4
png("plot4.png")
par(mfrow = c(2, 2))
with(a1, {
        plot(x = a1$ts, y = a1$gap, type = "l", ylab = gaplab, xlab = NA)
        plot(a1$ts, a1$Voltage, type = "l", ylab = voltlab, xlab = dtlab)
        plot(a1$ts, a1$Sub_metering_1, type = "n", ylab = smetlab, xlab = NA)
        lines(a1$ts, a1$Sub_metering_1, col = "black")
        lines(a1$ts, a1$Sub_metering_2, col = "red")
        lines(a1$ts, a1$Sub_metering_3, col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = c(1,1,1), col = c("black", "red", "blue"))
        plot(a1$ts, a1$Global_reactive_power, type = "l", ylab = grplab, xlab = dtlab)
})  