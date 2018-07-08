# Load Data
data <- read.table("household_power_consumption.txt",sep = ";", header=TRUE)
# Change the class of Date column to "Date"
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Subset the data by date
data <- subset(data, data$Date == as.Date("2007-02-01")|data$Date == as.Date("2007-02-02"))
# Change the class of GAP to numeric for plotting
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# Plotting and save as PNG
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png , file = "plot1.png")
dev.off()