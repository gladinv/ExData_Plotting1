setwd("C:/Users/User/OneDrive/Documents")

library("datasets")
library("dplyr")
library("tidyverse")

df <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
               na.strings = "?", nrows = 2075259, check.names = F, 
               stringsAsFactors = F, comment.char = "", quote = '\"')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

energy <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

datetime <- paste(as.Date(energy$Date), energy$Time)
energy$Datetime <- as.POSIXct(datetime)

png("plot3.png", width = 480,  height = 480)

with(energy, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()