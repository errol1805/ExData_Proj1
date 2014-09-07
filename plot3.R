# Exploratory Data Analysis Project 1
# Plot 3
# Ensure raw data is in the working directory
# This script creates an image file "plot3.png" in the working directory

# reads raw data into table - strings as factors ensures that data is read as character strings
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = F)

# changes required columns into the required format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# filtering data to the data we need
dataday <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
dataday <- data.frame(dataday,as.POSIXct(paste(dataday$Date,dataday$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(dataday)[10] <- "datetime"

#PLOT 3
png(file="plot3.png")

with(dataday,{
    plot(datetime,Sub_metering_1,type="l", ylab = "Energy sub metering",xlab = "")
    lines(datetime,Sub_metering_2,col="red") #adds line to existing plot
    lines(datetime,Sub_metering_3,col="blue") 
    legend("topright",lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),legend = c(colnames(dataday)[7:9])) #adds legend to topright corner of plot
    })

dev.off()