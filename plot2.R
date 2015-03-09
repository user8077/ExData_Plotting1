data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings="?")
mydata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- paste(mydata$Date, mydata$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

par(pch=" ")
with(mydata, plot(datetime, Global_active_power,type="o",
                  ylab="Global Active Power (kilowatts)",
                  xlab=""))
dev.copy(png,"plot2.png",width=480, height=480, units="px")
dev.off()
