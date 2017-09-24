# Read Dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

# Subset data to Feb 01 and Feb 02
data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02",]

# Convert to datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime,
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ Datetime,
        col = 'Red')
  lines(Sub_metering_3 ~ Datetime,
        col = 'Blue')
})

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       lwd = 2)
      
# Save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()