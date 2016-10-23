
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
with(dataEDA, {
  plot(DateTime, Sub_metering_1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(DateTime, Sub_metering_2, col='Red')
  lines(DateTime, Sub_metering_3, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)  
dev.off()