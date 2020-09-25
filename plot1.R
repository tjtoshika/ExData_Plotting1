data <- read.csv('household_power_consumption.txt', colClasses = 'character',na.strings = '?' , sep = ';')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subdata <- subset(data_full, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
