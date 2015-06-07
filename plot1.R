##Coursera:Exploratory Data Analysis
##project 1
##Plot1

##read the data into R.
Data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
        colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double"), 
        na.strings = "?")

##subset the data to only include the dates needed using package:dplyr.
library(dplyr)
Datasub <- filter(Data, Date == "1/2/2007" | Date == "2/2/2007")
##check subsetted data frame.
head(Datasub); tail(Datasub)

##open png graphics device
png("ExData_Plotting1/plot1.png")

##reproduce histogram (i.e., plot1)
hist(Datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Activity Power (kilowatts)")

##close png graphics device
dev.off()

