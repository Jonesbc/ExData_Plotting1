##Coursera:Exploratory Data Analysis
##project 1
##Plot 4

##read the data into R.
Data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"), 
                   na.strings = "?")

##subset the data to only include the dates needed using package:dplyr.
library(dplyr)
Datasub <- filter(Data, Date == "1/2/2007" | Date == "2/2/2007")
##check subsetted data frame.
head(Datasub); tail(Datasub)

##Change the class of the "Date" and "Time" variables to POSIXlt,
##and combine into one variable called "DateTime"
Datasub$DateTime <- as.POSIXlt(paste(as.Date(Datasub$Date, format="%d/%m/%Y"), Datasub$Time, sep=" "))

##open png graphics device
png("ExData_Plotting1/plot4.png")

##create plot4
par(mfrow = c(2,2))
with(Datasub, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Activity Power (kilowatts)", xlab = " ", main = " ")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime", main = " ")
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ", main = " ")
  lines(x = DateTime, y = Sub_metering_2, col = "red")
  lines(x = DateTime, y = Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")
  plot(DateTime, Global_reactive_power, type = "l", ylab = "Global reactive power", xlab = "datetime", main = " ")
})

##close png graphics device
dev.off()




