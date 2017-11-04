plot4 <- function() {
  setwd("C:/Users/connor flood/Documents/R/ExploratoryProject")
  file <- "household_power_consumption.txt"
  data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  ##Make relevant columns numeric
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  #Create a DateTime column that combines date and time
  data$DateTime <- paste(data$Date, data$Time, sep = "")
  data$DateTime <- strptime(data$DateTime, format = ("%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2,2))
  
  plot(data$DateTime,data$Global_active_power,type = "l", xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  plot(data$DateTime,data$Voltage,type = "l", xlab = "datetime",
       ylab = "Voltage")
  
  plot(data$DateTime,data$Sub_metering_1,type = "l", xlab = "",
       ylab = "Energy Sub Metering") 
  lines(data$DateTime,data$Sub_metering_2, type ="l", col = "red")
  lines(data$DateTime,data$Sub_metering_3, type ="l", col = "blue")
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"), lty = c(1,1,1))
  plot(data$DateTime,data$Global_reactive_power,type = "l", xlab = "datetime",
       ylab = "Global_reactive_power")
  
  dev.off()
}