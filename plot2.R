# Exploratory Data Analysis Project 1
# Plot 2
# Ensure raw data is in the working directory
# This script creates an image file "plot2.png" in the working directory

# reads raw data into table - strings as factors ensures that data is read as character strings
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = F)

# changes required columns into the required format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# filtering data to the data we need
dataday <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
dataday <- data.frame(dataday,as.POSIXct(paste(dataday$Date,dataday$Time),format = "%Y-%m-%d %H:%M:%S"))
colnames(dataday)[10] <- "datetime"


# PLOT 2
png(file="plot2.png")

with(dataday,plot(datetime,Global_active_power,type="l", ylab = "Global Active Power (kilowatts)",xlab = ""))

dev.off()