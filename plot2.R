# Load Data
data <- read.table("household_power_consumption.txt",sep = ";", header=TRUE)
# Subset the data by date and create new column for Date + Time
data <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
# Change the class of GAP to numeric for plotting
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
with(data, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()