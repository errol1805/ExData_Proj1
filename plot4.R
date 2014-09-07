# Exploratory Data Analysis Project 1
# Plot 4
# Ensure raw data is in the working directory
# This script creates an image file "plot4.png" in the working directory

# reads raw data into table - strings as factors ensures that data is read as character strings
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = F)

# changes required columns into the required format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# filtering data to the data we need
dataday <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
dataday <- data.frame(dataday,as.POSIXct(paste(dataday$Date,dataday$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(dataday)[10] <- "datetime"

#PLOT 4
png(file="plot4.png")

par(mfrow=c(2,2)) #splits plotting frame into 4 plots (2 by 2)
with(dataday,{
    plot(datetime,Global_active_power,type="l", ylab = "Global Active Power (kilowatts)",xlab = "")
    plot(datetime,Voltage,type="l",ylab= "Voltage", xlab = "datetime")
    plot(datetime,Sub_metering_1,type="l", ylab = "Energy sub metering",xlab = "")
    lines(dataday$datetime,dataday$Sub_metering_2,col="red")
    lines(dataday$datetime,dataday$Sub_metering_3,col="blue")
    legend("topright",,lty=c(1,1),bty="n",col=c("black","red","blue"),legend = c(colnames(dataday)[7:9]))
    plot(datetime,Global_reactive_power,type="l")
})

dev.off()