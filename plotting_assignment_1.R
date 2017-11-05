

# Exploratory Data Analysis
# Course Project 1
install.packages("sqldf")
library(sqldf)

setwd("E:\\Dropbox\\coursera\\Exploratory Data Analysis")
power <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

names(power)
dim(power)
head(power$Date)

power$Date <- strptime(as.Date(power$Date, format="%m/%d/%Y"), format="%Y-%m-%d")

head(power$Time)


power$Time <- strptime(power$Time, format = "%H:%M:%S")
