
 if(!file.exists('EDA')) dir.create('EDA')
 fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
 download.file(fileUrl, destfile = './EDA/household_power_consumption.zip')


unzip('./EDA/household_power_consumption.zip', exdir = './EDA')
 
   fileEDA  <- file('./EDA/household_power_consumption.txt')

 dataEDA <- read.table(text = grep("^[1,2]/2/2007",readLines(fileEDA),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
  # Plot 1
    # open device
  png(filename = './plot1.png', width = 480, height = 480, units='px')
  # plot figure
    with(dataEDA, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
  # close device
    dev.off()