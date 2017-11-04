plot1 <- function() {
  setwd("C:/Users/connor flood/Documents/R/ExploratoryProject")
  file <- "household_power_consumption.txt"
  data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  plot1 <- as.numeric(as.character(data$Global_active_power))
  
  png(filename = "plot1.png", width = 480, height = 480)
  hist(plot1,col = "red", main = "Global Active Power",
       ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
  dev.off()
}
