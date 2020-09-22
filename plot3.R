##Reading data file and subsetting data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Arrenging variables and its values
datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataset$Global_active_power)
metering1 <- as.numeric(dataset$Sub_metering_1)
metering2 <- as.numeric(dataset$Sub_metering_2)
metering3 <- as.numeric(dataset$Sub_metering_3)

##Plotting and annotating graph, and providing png
dev.print(png, file = "plot3.png", width = 480, height = 480)
png("plot3.png", width=480, height=480)
plot(datetime, metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, metering2, type="l", col="red")
lines(datetime, metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()