library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "powerConsumption.zip", method = "curl")
unzip("powerConsumption.zip")

Consumption <- read.table("household_power_consumption.txt", header = T, sep = ";")
Consumption$Date <- as.Date(Consumption$Date, format = "%d/%m/%Y")
Consumption <- filter(Consumption, Date == as.POSIXlt("2007-02-01") | Date == as.POSIXlt("2007-02-02"))

png(file = "plot1.png")
hist(as.numeric(Consumption$Global_active_power),col = 'red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
