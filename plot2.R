plot2 <- function() {
  setwd("C:/Users/connor flood/Documents/R/ExploratoryProject")
  file <- "household_power_consumption.txt"
  data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$DateTime <- paste(data$Date, data$Time, sep = "")
  data$DateTime <- strptime(data$DateTime, format = ("%d/%m/%Y %H:%M:%S"))

  png(filename = "plot2.png", width = 480, height = 480)
  plot(data$DateTime,data$Global_active_power,type = "l", xlab = "",
       ylab = "Global Active Power (kilowatts)")
  dev.off()
}
