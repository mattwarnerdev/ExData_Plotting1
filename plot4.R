plot4 <- function() {
  print("Plot 4 working...") 
  
  #Source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", 
                "Sub_metering_2", "Sub_metering_3")
  elec <- read.csv("data/exdata-data-household_power_consumption/household_power_consumption.txt", 
                   header = FALSE, sep = ";", 
                   na.strings = "?", 
                   skip = 66637, 
                   nrows = 2880, 
                   col.names = colNames
  )
  #combine date and time columns, convert to POSIXlt
  elec$datetime <- strptime(paste(elec$Date, elec$Time), "%d/%m/%Y %T")
  
  
  
  png(file = "plot4.png", bg = "transparent", width = 480, height = 480)
  par(mfrow = c(2, 2))
  #First plot
  plot(elec$datetime, elec$Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab = "")
  
  #Second plot
  plot(elec$datetime, elec$Voltage, type = "l", xlab = "datetime", 
       ylab = "Voltage")
  
  
  #Third plot
  plot(elec$datetime, elec$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "", cex.lab = 0.9)
  lines(elec$datetime, elec$Sub_metering_3, col = "Blue")
  lines(elec$datetime, elec$Sub_metering_2, col = "Red")
  legend("topright", names(elec)[7:9], lty=c(1,1), 
         col = c("Black", "Red", "Blue"), box.lty = 0, cex = 0.75)
  

  #Fourth plot
  plot(elec$datetime, elec$Global_reactive_power, 
       xlab = "datetime", ylab = "Global_Reactive_power", type = "l",
       cex.lab = 0.9)
  
  #Fix scale on all, yaxis labels on 4th
  
  dev.off()
  
  print("Plot 4 done.") 
}