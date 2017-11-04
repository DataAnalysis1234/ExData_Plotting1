plot3 <- function() {
  setwd("C:/Users/connor flood/Documents/R/ExploratorProject")
  file <- "household_power_consumption.txt"
  data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  ##Make sub metering numeric
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  
  #Create a DateTime column that combines date and time
  data$DateTime <- paste(data$Date, data$Time, sep = "")
  data$DateTime <- strptime(data$DateTime, format = ("%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot3.png", width = 480, height = 480)
  plot(data$DateTime,data$Sub_metering_1,type = "l", xlab = "",
       ylab = "Energy Sub Metering") 
  lines(data$DateTime,data$Sub_metering_2, type ="l", col = "red")
  lines(data$DateTime,data$Sub_metering_3, type ="l", col = "blue")
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"), lty = c(1,1,1))
  dev.off()
}
