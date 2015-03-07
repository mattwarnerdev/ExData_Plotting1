plot1 <- function() {
  message("Plot 1 working...") 
  
  #Source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  colNames <- c("Date", "Time", 
                "Global_active_power", 
                "Global_reactive_power", 
                "Voltage", 
                "Global_intensity", 
                "Sub_metering_1", 
                "Sub_metering_2", 
                "Sub_metering_3")
  elec <- read.csv("data/exdata-data-household_power_consumption/household_power_consumption.txt", 
                   header = FALSE, sep = ";", 
                   na.strings = "?", 
                   skip = 66637, 
                   nrows = 2880, 
                   col.names = colNames
                   )

  # save the histogram to a PNG file with a width of 480 pixels 
  # and a height of 480, plot1.png
  png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
  hist(elec$Global_active_power, 
       xlab = "Global Active Power (kilowatts)", 
       col = "Red", 
       main = "Global Active Power")
  dev.off()
    
  message("Plot 1 done.") 
}