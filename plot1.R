# Read Dataset
raw_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

# Subset data to Feb 01 and Feb 02
data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02",]

# Create plot
hist(data$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="Red")

# Save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

