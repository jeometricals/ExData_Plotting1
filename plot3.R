# coursera-exploratory-data-analysis-course-project-1
# Plot 3: Time Vs. Energy Sub Metering

#Reading data table
Source <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#defining dates in dataset
Source$Date <- as.Date(Source$Date, format="%d/%m/%Y")

#Subsetting data 
data <- subset(Source, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting data, add lines and legend and copy it to file
with(data, plot(data$Datetime, data$Sub_metering_1, col="black", type="l", xlab=" ", ylab="Energy sub metering"))
lines(data$Datetime, data$Sub_metering_2, col="red", type="l")
lines(data$Datetime, data$Sub_metering_3, col="blue", type="l")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()