# Plot 3
library(sqldf)
library(lubridate)

setwd("E:\\Dropbox\\coursera\\Exploratory Data Analysis")
power <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
is.na(power) <- power == "?"

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- paste(power$Date, power$Time)
power$Time <- as.POSIXct(power$Time)

png(file=".\\ExData_Plotting1\\figure\\plot3.png")
plot(power$Time, power$Sub_metering_1, type="n", pin=c(480, 480), xlab="", ylab = "Energy sub metering")
points(power$Time, power$Sub_metering_1, type="l")
points(power$Time, power$Sub_metering_2, type="l", col="red")
points(power$Time, power$Sub_metering_3, type="l", col="blue")
legend("topright", pch=c(1,1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
