##Reading data file and subsetting data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plotting and annotating graph, and providing png
datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataset$Global_active_power)
dev.print(png, file = "plot2.png", width = 480, height = 480)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


