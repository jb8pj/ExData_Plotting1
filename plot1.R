#Read and subset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#plot histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
# if adding tittle separately
title(main="Global Active Power")
#closing the device
dev.off()
