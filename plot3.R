#Reading and subsetting
  power <- read.table("household_power_consumption.txt",skip=1,sep=";")
  names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Change Date and Time
  data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
               V7 = as.numeric(as.character(V7)),
               V8 = as.numeric(as.character(V8)),
               V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)
  
#Plot
  png("plot3.png", width=480, height=480)
  with(data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
  with(data, points(V1,V7, col="black", type="l"))
  with(data, points(V1,V8, col="red", type="l"))
  with(data, points(V1,V9, col="blue", type="l"))
  legend("topright", lty=1, col = c("black", "red", "blue"), 
   legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  dev.off()
