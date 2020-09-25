data <- read.csv('household_power_consumption.txt', colClasses = 'character',na.strings = '?' , sep = ';')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data_full, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)


plot(subdata$Sub_metering_1~subdata$Datetime,type = 'l', ylab = 'Global Active Power(Kilowatts)', xlab = '')
lines(subdata$Sub_metering_2~subdata$Datetime,col = 'red')
lines(subdata$Sub_metering_3~subdata$Datetime,col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))

dev.copy(png, file= 'plot3.png', height =480, width = 480)
dev.off()