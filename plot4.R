data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings="?")
mydata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- paste(mydata$Date, mydata$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

par(pch=" ", mfrow=c(2,2), cex=0.7)
with(mydata, plot(datetime, Global_active_power,type="o",
                  ylab="Global Active Power",xlab=""))
with(mydata, plot(datetime, Voltage, type="o",
                  ylab="Voltage"))
with(mydata, plot(datetime,Sub_metering_1, type="n"
                  , ylab="Energy sub metering", xlab=""))
points(datetime, mydata$Sub_metering_1, type="o")
points(datetime, mydata$Sub_metering_2, type="o", col="red")
points(datetime, mydata$Sub_metering_3, type="o", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch=c(NA,NA,NA), col=c("black", "red", "blue"), lwd=1, lty=1, bty="n")
with(mydata, plot(datetime, Global_reactive_power, type="o"))

dev.copy(png,"plot4.png",width=480, height=480, units="px")
dev.off()
