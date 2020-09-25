data <- read.csv('household_power_consumption.txt', colClasses = 'character',na.strings = '?' , sep = ';')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data_full, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

globalactivepower <- as.numeric(subdata$Global_active_power)
png('plot2.png')
plot(subdata$Datetime, globalactivepower, ylab = 'Global Active POwer(kilowatts)', type = 'l', height=480, width=480, xlab = ' ')
dev.off()
