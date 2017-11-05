# Plot 1
library(sqldf)
library(lubridate)

setwd("E:\\Dropbox\\coursera\\Exploratory Data Analysis")
power <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

power$Time <- paste(power$Date, power$Time)
power$Time <- strptime(power$Time, format = "%m/%d/%Y %H:%M:%S")
power$Date <- strptime(as.Date(power$Date, format="%m/%d/%Y"), format="%Y-%m-%d")

png(file=".\\ExData_Plotting1\\figure\\plot1.png")
with(power, hist(Global_active_power, pin=c(480,480), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

hist(power$Global_active_power, col="red")

