# Read Dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

# Subset data to Feb 01 and Feb 02
data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02",]

# Convert to datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Create Plot
                      # plot parameters
par(mfrow = c(2,2),   # number of rows and columns
    mar = c(4,5,2,1)) # margin size

with(data, {
  
  plot(Global_active_power ~ Datetime,
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  plot(Voltage ~ Datetime,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage (volt)")
  
  plot(Sub_metering_1 ~ Datetime,
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
       lines(Sub_metering_2 ~ Datetime, col = 'Red')
       lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    
       # add legend to plot
       legend("topright",
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
              col = c("black", "red", "blue"),
              lty = 1, lwd = 2, bty = "n", cex = .8)
       
  plot(Global_reactive_power ~ Datetime,
       type = "l", 
       xlab = "datetime",
       ylab = "Global Rective Power (kilowatts)")

})

# Save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()