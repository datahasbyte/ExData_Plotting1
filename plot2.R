# Plot 2
library(sqldf)
library(lubridate)

setwd("E:\\Dropbox\\coursera\\Exploratory Data Analysis")
power <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
is.na(power) <- power == "?"

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- paste(power$Date, power$Time)
power$Time <- as.POSIXct(power$Time)

png(file=".\\ExData_Plotting1\\figure\\plot2.png")
plot(power$Time, power$Global_active_power, type="l", pin=c(480, 480), xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
