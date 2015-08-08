# coursera-exploratory-data-analysis-course-project-1
# Plot 2: Time Vs. Global Active Power

#Reading data table
Source <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#defining dates in dataset
Source$Date <- as.Date(Source$Date, format="%d/%m/%Y")

#Subsetting data 
data <- subset(Source, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting data and copy it to file
plot(data$Datetime, data$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
