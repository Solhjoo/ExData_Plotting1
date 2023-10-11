library(dplyr)
library(lubridate)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "powerConsumption.zip", method = "curl")
unzip("powerConsumption.zip")

Consumption <- read.table("household_power_consumption.txt", header = T, sep = ";")
Consumption$Date <- as.Date(Consumption$Date, format = "%d/%m/%Y")
Consumption <- filter(Consumption, Date == as.POSIXlt("2007-02-01") | Date == as.POSIXlt("2007-02-02"))

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot( as.numeric(Consumption$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab="",xaxt = "n")
#axis(1, at=c(1,1440), labels=unique(strftime(Consumption$Date, "%a")))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()

