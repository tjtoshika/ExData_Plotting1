data <- read.csv('household_power_consumption.txt', colClasses = 'character',na.strings = '?' , sep = ';')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data_full, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

globalactivepower <- as.numeric(subdata$Global_active_power)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
submetering_1 <- as.numeric(subdata$Sub_metering_1)
submetering_2 <- as.numeric(subdata$Sub_metering_2)
submetering_3 <- as.numeric(subdata$Sub_metering_3)


png('plot4.png', height = 480, width = 480)
par(mfrow = c(2,2))
plot(subdata$Datetime, globalactivepower, type = 'l', xlab = '', ylab = 'Global Active Power')
plot(subdata$Datetime, voltage, type = 'l', xlab = 'Datetime', ylab = 'Voltage')
plot(subdata$Datetime, submetering_1, type = 'l', xlab = '', ylab = 'Energy Sub Metering')
lines(submetering_2~subdata$Datetime, col = 'red')
lines(subdata$Sub_metering_3~subdata$Datetime,col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))
plot(subdata$Datetime, globalreactivepower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
