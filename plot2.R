##Coursera:Exploratory Data Analysis
##project 1
##Plot 2

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
png("ExData_Plotting1/plot2.png")

##create plot2
with(Datasub, plot(DateTime, Global_active_power, type = "l", 
                   ylab = "Global Activity Power (kilowatts)", xlab = " ", main = " "))

##close png graphics device
dev.off()
