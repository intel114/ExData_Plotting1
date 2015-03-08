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

#plot1
png("plot1.png")
hist(a1$gap, col = "red", xlab = gaplab, main = NA)