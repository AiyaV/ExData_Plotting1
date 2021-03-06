
if(!file.exists('EDA')) dir.create('EDA')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './EDA/household_power_consumption.zip')


unzip('./EDA/household_power_consumption.zip', exdir = './EDA')

fileEDA  <- file('./EDA/household_power_consumption.txt')

dataEDA <- read.table(text = grep("^[1,2]/2/2007",readLines(fileEDA),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# convert data and time to specific format
dataEDA$Date <- as.Date(dataEDA$Date, format = '%d/%m/%Y')
dataEDA$DateTime <- as.POSIXct(paste(dataEDA$Date, dataEDA$Time))

# Plot 3
# open device

png(filename = './plot3.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(dataEDA$DateTime, dataEDA$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(dataEDA$DateTime, dataEDA$Sub_metering_2, col = 'red')
lines(dataEDA$DateTime, dataEDA$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()
