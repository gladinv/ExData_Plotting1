setwd("C:/Users/User/OneDrive/Documents")

library("datasets")
library("dplyr")
library("tidyverse")

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
df <- "./Data/household_power_consumption.txt"
if (!file.exists(df)) {
  download.file(URL, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}

df <- file("household_power_consumption.txt")
hh_energy <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


png("plot1.png", width = 480,  height = 480)

hist(hh_energy$Global_active_power, col = "red", main = ("Global Active Power"), xlab = "Global Active Power (kilowatts)")

dev.off()