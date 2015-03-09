data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings="?")
mydata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
par(cex=0.75)
hist(mydata$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png",width=480, height=480, units="px")
dev.off()
