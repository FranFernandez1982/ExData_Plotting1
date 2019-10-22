# Setting the Working Directory and Downloading the File

rm(list=ls())
library(lubridate)
setwd("/home/fran/COURSERA/COURSE_04/WEEK_01/COURSE_PROJECT_01")
filename <- "exdata_data_household_power_consumption.zip"

if(!file.exists(filename)) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL,filename)
}

if (!file.exists("exdata_data_household_power_consumption")) { 
    unzip(filename) 
}

# Load Data

PoConsumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
PoConsumption <- subset(PoConsumption, (Date == "1/2/2007") | (Date == "2/2/2007"))
PoConsumption$Date <- strptime(paste(PoConsumption$Date,PoConsumption$Time, sep =" "), format = "%d/%m/%Y %H:%M:%S")
PoConsumption <- subset(PoConsumption, select = -Time)
PoConsumption$Global_active_power <- as.numeric(PoConsumption$Global_active_power)
png(filename = "Plot3.png", width = 480, height = 480)
plot(PoConsumption$Date, PoConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(PoConsumption$Date, PoConsumption$Sub_metering_2, type = "l", col = "red")
lines(PoConsumption$Date, PoConsumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()

