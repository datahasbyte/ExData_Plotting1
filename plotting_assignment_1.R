

# Exploratory Data Analysis
# Course Project 1
install.packages("sqldf")
library(sqldf)
library(lubridate)

setwd("E:\\Dropbox\\coursera\\Exploratory Data Analysis")
power <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

power$Time <- paste(power$Date, power$Time)
power$Time <- strptime(power$Time, format = "%m/%d/%Y %H:%M:%S")
power$Date <- strptime(as.Date(power$Date, format="%m/%d/%Y"), format="%Y-%m-%d")

head(power$Time)
head(power$Date)

class(power$Time)
class(power$Date)

write.csv(power, file="power.csv")
