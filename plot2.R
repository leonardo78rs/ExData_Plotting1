## Exploratory Data Analysis 
## 
## Leonardo Mendes de Oliveira 15/10/2017 
##
## The table "alldata" and your conversions not need execute allways (Only in plot1)
## For graphs in sequence, the steps 1 to 3 not necessary.
## 
setwd('/Users/Notebook/Desktop/coursera/data')
## Step 1: Read source data
alldata <- read.csv("household_power_consumption.txt", sep=";")

## Step 2: Converting data types
alldata$Time                  <- strptime(paste(alldata$Date, alldata$Time), format="%d/%m/%Y%H:%M:%S")
alldata$Date                  <- as.Date(alldata$Date, format="%d/%m/%Y")
alldata$Global_active_power   <- as.numeric(as.character(alldata$Global_active_power))
alldata$Global_reactive_power <- as.numeric(as.character(alldata$Global_reactive_power))
alldata$Sub_metering_1        <- as.numeric(as.character(alldata$Sub_metering_1))
alldata$Sub_metering_2        <- as.numeric(as.character(alldata$Sub_metering_2))
alldata$Sub_metering_3        <- as.numeric(as.character(alldata$Sub_metering_3))
alldata$Voltage               <- as.numeric(as.character(alldata$Voltage))

## Step3: restrict to a specific month
rangedata <- subset(alldata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Step4: Plot 2
png(file="plot2.png", width=480, height=480)
with(rangedata, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
