# Load Data
data <- read.table("household_power_consumption.txt",sep = ";", header=TRUE)
# Subset the data by date and create new column for Date + Time
data <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
par(mfcol = c(2,2), mar = c(4,4,2,2))
# Plot 1
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
with(data, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
# Change the data class as numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
# Plot 2
plot(data$DT, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(data$DT, data$Sub_metering_1, type="l")
points(data$DT, data$Sub_metering_2, type="l", col = "red")
points(data$DT, data$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
# Plot 3
data$Voltage <- as.numeric(as.character(data$Voltage))
with(data, plot(DT, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
# Plot 4
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
with(data, plot(DT, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()