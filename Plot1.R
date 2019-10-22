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
PoConsumption$Date <- as.Date(PoConsumption$Date, format = "%d/%m/%Y")
PoConsumption <- subset(PoConsumption,select = -Time)
PoConsumption$Global_active_power <- as.numeric(PoConsumption$Global_active_power)
Final <- subset(PoConsumption, (Date == "2007-02-01") | (Date == "2007-02-02"))
png(filename = "Plot1.png", width = 480, height = 480)
hist(Final$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()




