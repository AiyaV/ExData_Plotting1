
if(!file.exists('EDA')) dir.create('EDA')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './EDA/household_power_consumption.zip')


unzip('./EDA/household_power_consumption.zip', exdir = './EDA')

fileEDA  <- file('./EDA/household_power_consumption.txt')

dataEDA <- read.table(text = grep("^[1,2]/2/2007",readLines(fileEDA),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

 # Plot 4
   # open device
  
png(filename = './plot4.png', width = 480, height = 480, units='px')
# plot figure
   Sys.setlocale(category = "LC_ALL", locale = "english")
 par(mfrow = c(2, 2))
 plot(dataEDA$DateTime, dataEDA$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
 plot(dataEDA$DateTime, dataEDA$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
 plot(dataEDA$DateTime, dataEDA$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
 lines(dataEDA$DateTime, dataEDA$Sub_metering_2, col = 'red')
 lines(dataEDA$DateTime, dataEDA$Sub_metering_3, col = 'blue')
 legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
 plot(dataEDA$DateTime, dataEDA$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
 # close device
   dev.off()