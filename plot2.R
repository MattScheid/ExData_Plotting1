# Read Dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

# Subset data to Feb 01 and Feb 02
data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02",]

# Convert to datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Create plot 2
plot(data$Global_active_power ~ data$Datetime,
     type="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)")

# Save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
